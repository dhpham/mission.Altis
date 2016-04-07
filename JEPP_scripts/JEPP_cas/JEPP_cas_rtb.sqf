_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_plane setVariable ["JEPP_cas_RTB", true];
[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_reset.sqf";
JEPP_cas_planes deleteAt ([JEPP_cas_planes, _plane] call BIS_fnc_arrayFindDeep select 0);