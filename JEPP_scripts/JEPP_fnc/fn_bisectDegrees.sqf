/*
	Author: JEPP

	Description:
	Returns the midpoint between two directions.
	
	Parameter(s):
	_this select 0: NUMBER - Direction 1
	_this select 1: NUMBER - Direction 2

	Returns:
	NUMBER - direction
*/

params [
    ["_dir1",0,[0]],
    ["_dir2",0,[0]],
    "_dir"
];

_dir = -1;

if (_dir1 <= _dir2) then {
	_dir = (_dir1 + _dir2)/2;
};
if (_dir1 > _dir2) then {
	_dir = 180 + (_dir1 + _dir2)/2;
};

_dir % 360;