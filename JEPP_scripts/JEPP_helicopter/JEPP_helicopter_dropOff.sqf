params [
    ["_heli",objNull,[objNull]],
    ["_grid","",[""]]
];

_n = [JEPP_helicopter_groups, _heli] call BIS_fnc_findNestedElement;
_groupId = JEPP_helicopter_groups select (_n select 0) select 0;
_n = _n select 2;
group _heli setGroupId [format ["%1 %2", _groupId, _n + 1]];

if (_grid == "") exitWith {_heli sideChat "No grid entered."};
_pos = _grid call JEPP_fnc_gridPos;
if (_pos isEqualTo []) exitWith {
    _heli sideChat "Invalid grid.";
};
player setVariable ["JEPP_helicopter_grid", ""];

group driver _heli setBehaviour "CARELESS";

// close doors
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 0, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};

// find LZ
_minDist = 0;
_maxDist = 50;
_objDist = 10;
_maxGradient = 0.3;
_gradientRadius = 5;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];
_objBlacklist = ["Land_HelipadEmpty_F"];
_LZ = [_pos, _minDist, _maxDist, _objDist, _maxGradient, _gradientRadius, _waterMode, _shoreMode, _posBlacklist, _objBlacklist] call JEPP_fnc_findFlatEmpty;
if (_LZ isEqualTo []) exitWith {
    _heli sideChat format ["No valid LZ found at grid %1.", _grid];
    _groupId = JEPP_helicopter_groups select ([JEPP_helicopter_groups, _heli] call BIS_fnc_findNestedElement select 0) select 0;
    [_groupId, "RTB"] execVM "JEPP_scripts\JEPP_helicopter\JEPP_helicopter_exec.sqf";
};

// create drop off waypoint
_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
{deleteWaypoint _x;} forEach waypoints group _heli;
_wpLand = group _heli addWaypoint [_LZ,0];
_wpLand setWaypointType "MOVE";
_wpLand setWaypointCompletionRadius 100;
_wpLand setWaypointStatements ["true", 'vehicle this land "GET OUT";'];

// wait until waypoint is completed
waitUntil {!isTouchingGround _heli};
waitUntil {unitReady _heli};

// open doors
waitUntil {getPosATL _heli select 2 < 5};
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 1, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};

// get out
//waitUntil {isTouchingGround _heli};
waitUntil {getPosATL _heli select 2 < 1};
_crew = crew _heli;
_cargo = fullCrew [_heli, "cargo"];
_turret = [fullCrew [_heli, "turret"], [], {_x select 4}] call JEPP_fnc_filter;
_cargo = [_cargo + _turret, [], {_x select 0}] call JEPP_fnc_apply;
doGetOut _cargo;

waitUntil {crew _heli isEqualTo _crew};
sleep 3;
[_heli] execVM "JEPP_scripts\JEPP_helicopter\JEPP_helicopter_RTB.sqf";