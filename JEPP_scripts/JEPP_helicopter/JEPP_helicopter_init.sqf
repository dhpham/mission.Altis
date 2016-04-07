_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; // object
_heliArray = [_this,1,[],[[]]] call BIS_fnc_param;// array of groups
JEPP_helicopter_groups = []; // [["group id", [v1, v2, ...]], ["group id", [v1, ...], ...]

// add groups
_heliArray execVM "JEPP_scripts\JEPP_helicopter\JEPP_helicopter_addGroup.sqf";

// add comm menu item
[_unit, "JEPP_comm_helicopter"] call BIS_fnc_addCommMenuItem;