/*
	Author: JEPP

	Description:
	Shifts a position by a given amount in x, y, z
	
	Parameter(s):
	_this select 0: ARRAY - Position
	_this select 1: ARRAY - Shift
	_this select 2: NUMBER - Direction of y-coordinate (0/360 = north)

	Example:
	[3,2] = [[1, 1], [1, 2], 90] call JEPP_fnc_shiftPos;

	Returns:
	ARRAY - New position
*/

params [
    ["_pos",[],[[]],[2,3]],
    ["_shift",[],[[]]],
    ["_dir",0,[0]],
    "_newPos"
];

if (_pos isEqualTo []) exitWith {
    ["Position must be 2 or 3 elements."] call BIS_fnc_error;
};

if (_shift isEqualTo []) then {
    _shift = [0,0,0];
};

if (count _shift <= 1) then {
    _shift set [1, 0];
};

if (count _shift <= 2) then {
    _shift set [2, 0];
};

if (_dir != 0) then {
    _shift = [[0,0,0], _shift, -_dir] call JEPP_fnc_transform;
};

_newPos = [];
_newPos set [0, (_pos select 0) + (_shift select 0)];
_newPos set [1, (_pos select 1) + (_shift select 1)];
if (count _pos == 3) then {
    _newPos set [2, (_pos select 2) + (_shift select 2)];
};

_newPos;