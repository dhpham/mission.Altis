/*
	Author: JEPP

	Description:
	Rounds a number to the given factor.
	
	Parameter(s):
	_this select 0: NUMBER
	_this select 1: NUMBER - Factor

	Returns:
	NUMBER - Rounded number
*/

params [
    ["_num",0,[0]],
    ["_factor",0,[0]],
    "_n"
];

_n = _num - (_num % _factor);

if (_num % _factor >= _factor / 2) then {
	_n = _n + _factor;
};

_n;