_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_distStart = 5000;
_distIn = 3000;
_group = group _plane;

{deleteWaypoint _x;} forEach waypoints _group;



_atkHdg = _plane getVariable ["JEPP_cas_atkHdg", -1];
_locPos = _plane getVariable ["JEPP_cas_locPos", []];
_tgtObj = _plane getVariable ["JEPP_cas_tgtObj", objNull];
if !(_tgtObj isEqualTo objNull) then {
    _locPos = getPos _tgtObj;
};
if (_atkHdg == -1) then {
    _atkHdg = [_locPos, _plane] call BIS_fnc_dirTo;
} else {
    _atkHdg = (_atkHdg + 180) % 360;
};



// ip inbound
_posStart = [_locPos, [_distStart, _atkHdg]] call JEPP_fnc_polarShift;
_wpStart = _group addWaypoint [_posStart, 0];
_wpStart setWaypointType "MOVE";
_wpStart setWaypointStatements ["true", "vehicle this setVariable ['JEPP_cas_inbound', true];"];
_wpStart setWaypointCompletionRadius 500;
_group setCurrentWaypoint _wpStart;

// call inbound
waitUntil {
    _pos = getPos _plane;
    _pos distance2D _posStart < 1000;
};
_plane sideRadio "IPinbound";
// _plane sideRadio "beepRecv";



// continue
player setVariable ["JEPP_cas_dialog", "mission"];
waitUntil {
    _plane getVariable ["JEPP_cas_continue", false];
};



// split group?? multiple ships




// mark
waitUntil {
    _plane getVariable ["JEPP_cas_inbound", false];
};

sleep 3;

_mark = _plane getVariable ["JEPP_cas_mark", 0];
switch _mark do {
    case 0: // none
    {
        _plane setVariable ["JEPP_cas_contactMark", true];
        
        _plane setVariable ["JEPP_cas_markPos", _locPos];
        
        // tally target
        [_plane, _locPos] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_tallyTarget.sqf";
    };
    case 1: // smoke
    {
        _markTypes = JEPP_cas_smoke;
        _s = [_plane, _markTypes] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactMark.sqf";
    
        // save script handle for terminate
        [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
    };
    case 2: // laser
    {
        _s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactLaser.sqf";
    
        // save script handle for terminate
        [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
    };
    case 3: // IR pointer
    {
        _s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactPointer.sqf";
    
        // save script handle for terminate
        [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
    };
    case 4: // IR strobe
    {
        _markTypes = JEPP_cas_IR;
        _s = [_plane, _markTypes] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactMark.sqf";
    
        // save script handle for terminate
        [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
    };
};



// in
waitUntil {
    _plane getVariable ["JEPP_cas_tallyTarget", false];
};
sleep 3;
_group setSpeedMode "LIMITED";
_posIn = [_locPos, [_distIn, _atkHdg]] call JEPP_fnc_polarShift;
_wpIn = _group addWaypoint [_posIn, 0];
_wpIn setWaypointType "MOVE";
_wpIn setWaypointStatements ["true", "vehicle this setVariable ['JEPP_cas_in', true];"];
_wpIn setWaypointCompletionRadius 500;
_group setCurrentWaypoint _wpIn;
waitUntil {
    _plane getVariable ["JEPP_cas_in", false];
};

_inDir = [_locPos, _plane] call BIS_fnc_dirTo call JEPP_fnc_degreeToCardinal;
_plane sideChat format ["%1, in from the %2.", groupID _group, _inDir];
_plane sideRadio "in";
switch _inDir do {
    case "north" : {
        _plane sideRadio "fromTheN";
    };
    case "northeast" : {
        _plane sideRadio "fromTheNE";
    };
    case "east" : {
        _plane sideRadio "fromTheE";
    };
    case "southeast" : {
        _plane sideRadio "fromTheSE";
    };
    case "south" : {
        _plane sideRadio "fromTheS";
    };
    case "southwest" : {
        _plane sideRadio "fromTheSW";
    };
    case "west" : {
        _plane sideRadio "fromTheW";
    };
    case "northwest" : {
        _plane sideRadio "fromTheNW";
    };
};
// _plane sideRadio "beepRecv";



// flares
_plane setVariable ["JEPP_cas_flares", true];
[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_flares.sqf";



// cleared hot
player setVariable ["JEPP_cas_dialog", "mission"];



// weapons release
_s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_weaponsRelease.sqf";

// save script handle for terminate
[_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;



// off dry
_wpOff = _group addWaypoint [_locPos, 0];
_wpOff setWaypointType "MOVE";
_wpOff setWaypointStatements ["true", "vehicle this setVariable ['JEPP_cas_off', true];"];
_group setCurrentWaypoint _wpOff;
waitUntil {
    _plane getVariable ["JEPP_cas_off", false];
};

if !(_plane getVariable ["JEPP_cas_clearedHot", false]) then {
    terminate _s;
    _plane sideRadio "off";
    // _plane sideRadio "beepRecv";
    
    [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_egress.sqf";
};