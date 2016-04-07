_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_egressDist = 3000;
_group = group _plane;

{deleteWaypoint _x;} forEach waypoints _group;
_group setSpeedMode "NORMAL";



// egress
_tgtObj = _plane getVariable ["JEPP_cas_tgtObj", []];
_tgtPos = getPos _tgtObj;
_egressText = _plane getVariable ["JEPP_cas_egressText", ""];
_egressHdg = [_egressText] call JEPP_fnc_cardinalToDegrees;
_posEgress = [_tgtPos, [_egressDist, _egressHdg]] call JEPP_fnc_polarShift;
_wpEgress = _group addWaypoint [_posEgress, 0];
_wpEgress setWaypointType "MOVE";
_group setCurrentWaypoint _wpEgress;



// flares
if (_plane getVariable ["JEPP_cas_flares", false]) then {
	_plane setVariable ["JEPP_cas_flares", false];
	[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_flaresFast.sqf";
};



// winchester
_ammo = [];
{
    _magazine = _x select 0;
    _rounds = _x select 1;
    _weapon = _x select 4;
    [_ammo, _weapon, _rounds] call BIS_fnc_addToPairs;
} forEach magazinesAmmoFull _plane;

_winchester = true;
{
    _rounds = 0;
    _weapon = _x select 0;
    _profile = _x select 1;
    if (_profile == "AGM" || _profile == "LGB" || _profile == "GUN" || _profile == "RKT") then {
        _rounds = [_ammo, _weapon, 0] call BIS_fnc_getFromPairs;
    };
    if (_rounds != 0) then {
        _winchester = false;
    };
} forEach JEPP_cas_ordnance;



// done
if (_winchester) then {
    _plane sideRadio "winchester";
    // _plane sideRadio "beepRecv";
    _plane execVM "JEPP_scripts\JEPP_cas\JEPP_cas_rtb.sqf";
} else {
    player setVariable ["JEPP_cas_dialog", "done"];
};