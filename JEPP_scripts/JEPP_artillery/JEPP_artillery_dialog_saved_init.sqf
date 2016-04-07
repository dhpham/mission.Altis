// add targets to combo box
_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_savedTargetsArray = _batteryGroup getVariable ["JEPP_artillery_savedTargets", []];
{
    _id = lbAdd [36002, _x];
} forEach _savedTargetsArray;

// select first target in combo box as default
lbSetCurSel [36002, 0];