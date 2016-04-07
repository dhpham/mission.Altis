/*
	Author: JEPP

	Description:
	Converts a direction from degrees to cardinal point.
	
	Parameter(s):
	_this select 0: NUMBER - Direction

	Returns:
	STRING - Cardinal direction
*/

params [
    ["_dir",0,[0]],
    "_str"
];

_str = "";
_dir = _dir call JEPP_fnc_formatDegrees;

// north
if (_dir >= 337.5 || _dir < 22.5) then {_str = "north"};
if (_dir >= 22.5 && _dir < 67.5) then {_str = "northeast"};
if (_dir >= 67.5 && _dir < 112.5) then {_str = "east"};
if (_dir >= 112.5 && _dir < 157.5) then {_str = "southeast"};
if (_dir >= 157.5 && _dir < 202.5) then {_str = "south"};
if (_dir >= 202.5 && _dir < 247.5) then {_str = "southwest"};
if (_dir >= 247.5 && _dir < 292.5) then {_str = "west"};
if (_dir >= 292.5 && _dir < 337.5) then {_str = "northwest"};

_str;