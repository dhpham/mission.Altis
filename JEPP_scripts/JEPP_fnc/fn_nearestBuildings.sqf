/*
	Author: JEPP

	Description:
	Returns an array of the nearest enterable buildings, ordered by distance.
	
	Parameter(s):
    _this select 0: ARRAY - Position
    _this select 1: NUMBER - Radius

	Returns:
	ARRAY - Array of buildings
*/

params [
    ["_pos",[0,0,0],[[],objNull],[2,3]],
    ["_rad",0,[0]],
    "_buildings"
];

if (_pos isEqualType objNull) then {
    _pos = getPos _pos;
};

_buildings = nearestObjects [_pos, ["Building"], _rad];
[_buildings, [], {!((_x call BIS_fnc_buildingPositions) isEqualTo [])}] call JEPP_fnc_filter;