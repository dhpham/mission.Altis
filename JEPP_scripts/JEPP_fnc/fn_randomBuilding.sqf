/*
	Author: JEPP

	Description:
	Returns a random enterable building within a radius around a position.
	
	Parameter(s):
    _this select 0: ARRAY - Center position
    _this select 1: NUMBER - Radius
    Defaults to the entire map.

	Returns:
	OBJECT - Building
*/

params [
    ["_pos",[worldSize/2,worldSize/2],[[],objNull],[2,3]],
    ["_rad",worldSize/sqrt(2),[0]],
    "_buildings"
];

if (_pos isEqualType objNull) then {
    _pos = getPos _pos;
};

_buildings = [_pos, _rad] call JEPP_fnc_nearestBuildings;

if !(_buildings isEqualTo []) then {
    selectRandom _buildings;
} else {
    objNull;
};