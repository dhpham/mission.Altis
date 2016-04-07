_type = player getVariable ["JEPP_artillery_targetType1", ""];

execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_reset.sqf";

player sideChat format ["End of mission. %1 destroyed.", _type];
// player sideRadio "beepSend";