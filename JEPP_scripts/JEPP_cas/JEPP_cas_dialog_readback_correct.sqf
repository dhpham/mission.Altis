player setVariable ["JEPP_cas_dialog", "hold"];

closeDialog 6900;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_type = _plane getVariable ["JEPP_cas_type", 1];
if (_type == 3) then {
	player sideChat "Readback correct. Commence engagement.";
	// player sideRadio "beepSend";
	
	// start mission
	_s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_executeMission_type3.sqf";
	
	// save script handle for terminate
	[_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
} else {
	player sideChat "Readback correct. Report IP inbound.";
	// player sideRadio "beepSend";
	
	// start mission
	_s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_executeMission.sqf";
	
	// save script handle for terminate
	[_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
};