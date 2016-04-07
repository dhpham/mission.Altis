player sideChat "Plot target. End of mission.";
// player sideRadio "beepSend";

_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_targetPos = _batteryGroup getVariable ["JEPP_artillery_targetPos", []];

// create marker
_marker = createMarker [JEPP_artillery_targetID, _targetPos];
_marker setMarkerColor "ColorRed";
_marker setMarkerAlpha JEPP_artillery_targetMarkerAlpha;
_marker setMarkerType "mil_destroy";
_marker setMarkerText JEPP_artillery_targetID;

// save marker in array
_savedTargetsArray = _batteryGroup getVariable ["JEPP_artillery_savedTargets", []];
_savedTargetsArray set [count _savedTargetsArray, JEPP_artillery_targetID];
_batteryGroup setVariable ["JEPP_artillery_savedTargets", _savedTargetsArray];

// increment target ID
execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_increment_target_ID.sqf";