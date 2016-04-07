/*
	Author: JEPP

	Description:
	Convert a position from cartesian coordinates to spherical coordinates.
	
	Parameter(s):
	_this select 0: ARRAY - [x, y, z]

	Example:
	[1, 0, 0] call JEPP_fnc_cartesianToSpherical;

	Returns:
	ARRAY - [1, 90, 0]
*/

params [
    ["_x",0,[0]],
    ["_y",0,[0]],
    ["_z",0,[0]],
    "_r",
    "_theta",
    "_phi"
];

_r = sqrt(_x^2 + _y^2 + _z^2);
_theta = _x atan2 _y; // azimuth (0/360 = north)
_phi = asin(_z / _r); // elevation (90 = zenith)

[_r, _theta, _phi];