/*
	Author: JEPP

	Description:
	Convert from spherical coordinates to cartesian coordinates.
	
	Parameter(s):
	_this select 0: ARRAY - [r, azimuthal angle, elevation angle]

	Example:
	[1, 45, 0] call JEPP_fnc_sphericalToCartesian;

	Returns:
	ARRAY - [0.707, 0.707, 0]
*/

params [
    ["_r",0,[0]], // magnitude
    ["_theta",0,[0]], // azimuth (0/360 = north)
    ["_phi",0,[0]], // elevation (90 = zenith)
    "_rCosPhi",
    "_x",
    "_y",
    "_z"
];

_rCosPhi = _r * (cos _phi);

_x = _rCosPhi * (sin _theta);
_y = _rCosPhi * (cos _theta);
_z = _r * (sin _phi);

[_x,_y,_z];