/*
	Author: JEPP

	Description:
    Returns array of all locations of given type.
	
	Parameter(s):
    _this select 0: ARRAY - Location types

	Returns:
    ARRAY
*/

params [
    ["_locTypes",[],[[]]],
    "_pos",
    "_rad",
    "_locations"
];

_pos = [worldSize/2,worldSize/2];
_rad = worldSize/sqrt(2);
_locations = nearestLocations [_pos, _locTypes, _rad];
_locations;