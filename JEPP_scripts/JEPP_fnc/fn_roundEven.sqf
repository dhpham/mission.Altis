/*
	Author: JEPP

	Description:
	Rounds to the nearest even of the given power of 10.
	
	Parameter(s):
	_this select 0: NUMBER
	_this select 1: NUMBER - Power

	Returns:
	NUMBER - Rounded number
*/

params [
    ["_num",0,[0]],
    ["_power",0,[0]],
    "_factor",
    "_r",
    "_n"
];

_factor = 10 ^ _power;
_r = (_num % _factor);

_n = _num - _r;

if ((_n / _factor) % 2  != 0) then {
	_n = _n + _factor;
};

_n;