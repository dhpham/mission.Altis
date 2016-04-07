/*
	Author: JEPP

	Description:
	Returns true if target is in range of indirect fire.
	
	Parameter(s):
	_this select 0: OBJECT - Shooter
    _this select 1: OBJECT or ARRAY - Target

	Example:

	Returns:
    BOOLEAN
*/

params [
    ["_unit",objNull,[objNull]],
    ["_pos",[0,0,0],[objNull,[]],3],
    "_maxAngle",
    "_g",
    "_dist",
    "_elev",
    "_weapon",
    "_modes",
    "_mode",
    "_m",
    "_v",
    "_minDist",
    "_maxDist"
];

if (_pos isEqualType objNull) then {
    _pos = getPosASL _pos;
};

_maxAngle = 80;
_g = 9.8;
_unitPos = getPosASL _unit;
_dist = _unitPos distance2D _pos;
_elev = (_pos select 2) - (_unitPos select 2); // elevation difference of target wrt shooter
_weapon = weapons _unit select 0;
_modes = getArray (configfile >> "CfgWeapons" >> _weapon >> "modes");
_parents = [configfile >> "CfgWeapons" >> _weapon, true] call BIS_fnc_returnParents;
if ("mortar_155mm_AMOS" in _parents) then {
    _m = [154, 243, 388.5, 648, 810];
};
if ("mortar_82mm" in _parents) then {
    _m = [70, 140, 200];
};
if ("rocket_230mm_GAT" in _parents) then {
    _m = [212.5, 425, 637.5, 850];
};
_m resize (count _modes / 2);

_v = _m select 0;
_minDist = _v*cos(_maxAngle)/_g * (_v*sin(_maxAngle) + sqrt(_v^2 * sin(_maxAngle)^2 - 2*_g*_elev));

_v = _m select (count _m - 1);
_maxDist = _v*(_v + sqrt(_v^2 - 4*_g*_elev))/(2*_g);

_minDist < _dist && _dist < _maxDist;