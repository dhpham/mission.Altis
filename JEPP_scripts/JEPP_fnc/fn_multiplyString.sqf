/*
	Author: JEPP

	Description:
	Multiply string.
	
	Parameter(s):
	_this select 0: STRING
	_this select 1: NUMBER

	Example:

	Returns:
*/

params [
    ["_str","",[""]],
    ["_n",0,[]],
    "_s"
];
_s = _str;
if (_n > 1) then {
    for "_x" from 1 to (_n - 1) do {
        _s = _s + _str;
    };
};
_s;