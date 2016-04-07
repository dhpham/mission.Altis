_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_savedTargetsArray = _batteryGroup getVariable ["JEPP_artillery_savedTargets", []];
_index = [_this,0,0,[0]] call BIS_fnc_param; // index of the target in _savedTargetsArray for the current battery
_markerName = _savedTargetsArray select _index;
_batteryGroup setVariable ["JEPP_artillery_targetPos", getMarkerPos _markerName];
player setVariable ["JEPP_artillery_savedTargetStr", _markerName]; // saved target missions send target id instead of grid to adjust init. only used in radio messages
execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf';