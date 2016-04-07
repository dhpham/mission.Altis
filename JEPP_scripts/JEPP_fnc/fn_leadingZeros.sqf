/*
	Author: JEPP

	Description:
	Adds leading zeros to a string.
	
	Parameter(s):
	_this select 0: STRING
	_this select 1: NUMBER - Total string length

	Returns:
	STRING
*/

params [
    ["_str","",[""]],
    ["_n",0]
];

_n = _n - (count _str);
if (_n > 0) then {
    _str = (["0", _n] call JEPP_fnc_multiplyString) + _str;
};
_str;