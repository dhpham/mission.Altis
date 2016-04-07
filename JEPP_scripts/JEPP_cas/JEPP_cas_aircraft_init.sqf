_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_loiterPos = [_this,1,[0,0,0],[[]]] call BIS_fnc_param;
_group = group _plane;

_altitude = 1500;
_plane setVariable ["JEPP_cas_altitude", _altitude];
_loiterRad = 100;

_time = 30;
_time = [str floor (_time/60), [str round (_time%60), 2] call JEPP_fnc_leadingZeros];

{deleteWaypoint _x;} forEach waypoints _group;

_plane flyInHeight _altitude;
_plane setCollisionLight false;

{
    _x setBehaviour "CARELESS";
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
} forEach crew _plane;

if (_plane getVariable ["JEPP_cas_RTB", false]) exitWith {
    // move
    _wp = _group addWaypoint [_loiterPos, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointStatements ["true", "vehicle this setVariable ['JEPP_cas_delete', true];"];
    _group setCurrentWaypoint _wp;
    
    waitUntil {
        _plane getVariable ["JEPP_cas_delete", false];
    };
    
    // delete
    if (_plane getVariable ["JEPP_cas_RTB", false]) then {
        {
            deleteVehicle _x;
        } forEach crew _plane;
        deleteVehicle _plane;
    };
};

if !(_plane getVariable ["JEPP_cas_onStation", false]) then {
    // move
    _wp1 = _group addWaypoint [_loiterPos, 0];
    _wp1 setWaypointType "MOVE";
    _wp1 setWaypointStatements ["true", "vehicle this setVariable ['JEPP_cas_onStation', true];"];
    _group setCurrentWaypoint _wp1;
    
    waitUntil {
        _plane getVariable ["JEPP_cas_onStation", false];
    };
    
    // loiter
    _wp2 = _group addWaypoint [_loiterPos, 0];
    _wp2 setWaypointType "LOITER";
    _wp2 setWaypointLoiterRadius _loiterRad;
    _wp2 setWaypointLoiterType "CIRCLE";
    _group setCurrentWaypoint _wp2;
    
    _aircraftType = getText (configfile >> "CfgVehicles" >> typeOf vehicle leader _group >> "displayName");
    _grid = mapGridPosition getPos leader _group;
    _height = [getPos leader _group select 2, 100] call JEPP_fnc_roundNum;
    leader _group sideChat format ["%1, this is %2. %3 on station at %4, %5. Time on station is %6+%7. Standing by for tasking.", groupID group player, groupID _group, _aircraftType, _grid, _height, _time select 0, _time select 1];
    [_plane, _grid] call JEPP_fnc_speak;
    _plane sideRadio "at";
    [_plane, str _height, true] call JEPP_fnc_speak;
    _plane sideRadio (selectRandom ["timeOnStation", "playTime"]);
    [_plane, _time select 0] call JEPP_fnc_speak;
    [_plane, "+"] call JEPP_fnc_speak;
    [_plane, _time select 1, true] call JEPP_fnc_speak;
    _plane sideRadio "tasking";
    // _plane sideRadio "beepRecv";
} else {
    _wp = _group addWaypoint [_loiterPos, 0];
    _wp setWaypointType "LOITER";
    _wp setWaypointLoiterRadius _loiterRad;
    _wp setWaypointLoiterType "CIRCLE";
    _group setCurrentWaypoint _wp;
};