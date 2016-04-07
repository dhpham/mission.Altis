/*
	Author: JEPP

	Description:
	Returns the position of a projectile's impact
	
	Parameter(s):
	_this select 0: OBJECT - Unit to track
	_this select 1: ARRAY - Ammo types to track

	Example:
	[player,["SmokeShell", "B_IR_Grenade"]] call JEPP_fnc_impactPos;

	Returns:
	ARRAY - Position of impact
*/

params [
    ["_shooter",objNull,[objNull]],
    ["_markTypes",[],[[]]],
    "_id",
    "_ammo",
    "_mark",
    "_markPos"
];

_shooter setVariable ["markType","none",true];

_id = _shooter addEventHandler ["fired", {
	_shooter = _this select 0;
	_ammo = _this select 4;
	_shooter setVariable ["markType",_ammo,true];
}];

waitUntil {
	_ammo = _shooter getVariable ["markType","none"];
	_ammo in _markTypes;
};

_ammo = _shooter getVariable ["markType","none"];
_shooter removeEventHandler ["fired",_id];
_mark = nearestObject [_shooter, _ammo];
waitUntil {speed _mark == 0};
_markPos = getPos _mark;
_markPos;