/*
	Author: JEPP

	Description:
	Formats an angle to 0-360 degrees.
	
	Parameter(s):
	_this select 0: NUMBER - Degrees

	Returns:
	NUMBER - Degrees (0-360)
*/

params [
    ["_deg",0,[0]]
];

while {_deg < 0} do {
	_deg = _deg + 360;
};

if (_deg > 360) then {
	_deg = _deg % 360;
};

_deg;