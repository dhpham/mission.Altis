/*
	Author: JEPP

	Description:
	Capitalize the first letter in a string.
	
	Parameter(s):
	_this select 0: STRING

	Example:
	"abC" call JEPP_fnc_capitalize;

	Returns:
	STRING - "Abc"
*/

params [
    ["_str","",[""]],
    "_s"
];

_str = toArray toLower _str;
_s = _str select 0;
if (_s >= 97 || _s <= 122) then {
    _str set [0, _s - 32];
};

toString _str;