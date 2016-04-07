_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_reset.sqf";

player sideChat format ["Cancel task"];
// player sideRadio "beepSend";