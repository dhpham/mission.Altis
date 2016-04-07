/*
	Author: JEPP

	Description:
    Returns coordinates in a translated and rotated coordinate system.
	
	Parameter(s):
	_this select 0: ARRAY - New origin
	_this select 1: ARRAY - Position
	_this select 2: NUMBER - Rotation

	Example:

	Returns:
	ARRAY - New position
*/
params [
    ["_o",[],[[]],[2,3]],
    ["_pos",[],[[]],[2,3]],
    ["_dir",0,[0]],
    "_newPos",
    "_x1",
    "_y1",
    "_x2",
    "_y2"
];

if (_o isEqualTo [] || _pos isEqualTo []) exitWith {
    ["Position must be 2 or 3 elements."] call BIS_fnc_error;
};

_x1 = (_pos select 0) - (_o select 0);
_y1 = (_pos select 1) - (_o select 1);

_x2 = _x1*cos(_dir) - _y1*sin(_dir);
_y2 = _y1*cos(_dir) + _x1*sin(_dir);

_newPos = [];
_newPos set [0, _x2];
_newPos set [1, _y2];
if (count _pos == 3 && count _o == 3) then {
    _newPos set [2, (_pos select 2) - (_o select 2)];
};

_newPos;