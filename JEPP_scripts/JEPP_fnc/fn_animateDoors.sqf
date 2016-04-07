/*
	Author: JEPP

	Description:
	Animate all vehicle doors.
	
	Parameter(s):
	_this select 0: OBJECT - Vehicle
    _this select 1: NUMBER - Phase
    _this select 2: BOOLEAN - Now
    _this select 3: ARRAY - Blacklist

	Example:
	_helicopter call JEPP_fnc_animateDoors;

	Returns:
	NOTHING
*/

params [
    ["_veh",objNull,[objNull]],
    ["_phase",0,[0]],
    ["_now",false,[false]],
    ["_blacklist",[],[[]]],
    "_doors",
    "_d"
];

_doors = configProperties [configfile >> "CfgVehicles" >> typeOf _veh >> "AnimationSources", "getText (_x >> 'source') == 'door'", true];
[_doors, [], {configName _x}] call JEPP_fnc_apply;
{
    [_doors, [_x], {_x != _input0 && _x != _input0}] call JEPP_fnc_filter;
} forEach _blacklist;

{
    _veh animateDoor [_x, _phase, _now];
} forEach _doors;