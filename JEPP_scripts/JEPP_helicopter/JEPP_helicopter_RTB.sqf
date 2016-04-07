params [
    ["_heli",objNull,[objNull]]
];

// terminate scripts
_handles = _heli getVariable ["JEPP_helicopter_scriptHandles", []];
_heli setVariable ["JEPP_helicopter_scriptHandles", []];
{terminate _x;} forEach _handles;

_base = _heli getVariable "JEPP_helicopter_base";
_basePos = getPos _base;
player setVariable ["JEPP_helicopter_grid", ""];

group driver _heli setBehaviour "CARELESS";

// close doors
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 0, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};

// create waypoint
{deleteWaypoint _x;} forEach waypoints group _heli;
_wpLand = group _heli addWaypoint [_basePos,0];
_wpLand setWaypointType "MOVE";
_wpLand setWaypointCompletionRadius 100;
_wpLand setWaypointStatements ["true", 'vehicle this land "LAND";'];

// wait until waypoint is completed
waitUntil {!isTouchingGround _heli};
waitUntil {unitReady _heli};

// open doors
waitUntil {isTouchingGround _heli};
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 1, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};

// rearm and refit
_heli setVehicleArmor 1;
_heli setVehicleAmmo 1;
_heli setFuel 1;