/*
	Author: JEPP

	Description:
	Shifts a position by a given amount in a given direction.
	
	Parameter(s):
	_this select 0: ARRAY - Position
    _this select 1: ARRAY - Shift
	_this select 1 select 0: NUMBER - Distance
	_this select 1 select 1: NUMBER - Direction
    _this select 1 select 2: NUMBER - Elevation
	_this select 2: NUMBER - Direction of y-coordinate (0/360 = north)

	Example:
	[_pos, [5, 45, 0]] call JEPP_fnc_polarShift;

	Returns:
	ARRAY - New position
*/

params [
    ["_pos",[],[[]],[2,3]],
    ["_shift",[],[[]]],
    ["_dir",0,[0]],
    "_shiftPos"
];

if (_pos isEqualTo []) exitWith {
    ["Position must be 2 or 3 elements."] call BIS_fnc_error;
};

_shift params [
    ["_dist",0,[0]],
    ["_azim",0,[0]],
    ["_elev",0,[0]]
];

_shiftPos = [_dist, _azim, _elev] call JEPP_fnc_sphericalToCartesian;
[_pos, _shiftPos, _dir] call JEPP_fnc_shiftPos;