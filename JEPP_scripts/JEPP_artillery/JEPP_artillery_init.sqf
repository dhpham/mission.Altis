_observer = [_this,0,objNull,[objNull]] call BIS_fnc_param; // object
_batteries = [_this,1,[],[[]]] call BIS_fnc_param; // array of groups
JEPP_artillery_batteries = [];

// target id parameters
JEPP_artillery_targetMarkerAlpha = 1; // set to 0 to hide target markers
JEPP_artillery_targetID_code = "TGT"; // target id prefix
JEPP_artillery_targetID_min = "0001"; // 4 digit target id
JEPP_artillery_targetID_max = "3000"; // max value before restarting
JEPP_artillery_targetID = JEPP_artillery_targetID_code + JEPP_artillery_targetID_min;

// add comm menu item
[_observer, "JEPP_comm_artillery"] call BIS_fnc_addCommMenuItem;

// add battery
_batteries execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_addBattery.sqf";