_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_savedTargetsArray = _batteryGroup getVariable ["JEPP_artillery_savedTargets", []];
_index = [_this,0,0,[0]] call BIS_fnc_param; // index of the target in _savedTargetsArray for the current battery
_savedTargetsArray = [_savedTargetsArray, _index] call BIS_fnc_removeIndex; // delete marker from array
_batteryGroup setVariable ["JEPP_artillery_savedTargets", _savedTargetsArray]; // update array