_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_batteryArray = player getVariable ["JEPP_artillery_currentBatteryArray", []];

ctrlSetText [32001, player getVariable ["JEPP_artillery_directionStr", ""]];

// create a pairs array of the battery's ammo types and their counts
_ammo = []; // [...[type,rounds],[type,rounds]...]
{
    {
        _ammo = [_ammo, _x select 0, _x select 1] call BIS_fnc_addToPairs;
    } forEach magazinesAmmoFull _x;
} forEach _batteryArray;

// update group's ammo count variable
_batteryGroup setVariable ["JEPP_artillery_ammo", _ammo];

// check if battery has ammo/can fire
_canFire = true;
{if !(canFire _x) then {_canFire = false;};} forEach _batteryArray;
if ((_ammo isEqualTo []) && _canFire) then {
    vehicle leader _batteryGroup sideChat "Cannot fire.";
    // vehicle leader _batteryGroup sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "end"];
    execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf';
    closeDialog 3200;
};

// add to combo box
{
    _displayName = getText (configfile >> "CfgMagazines" >> _x select 0 >> "displayName");
    _id = lbAdd [32000, format["%1", _displayName]];
    lbSetValue [32000, _id, _forEachIndex];
} forEach _ammo;

// add left/right and add/drop to combo box
_leftID = lbAdd [32002, "Left"];
lbSetValue [32002, _leftID, -1];
_rightID = lbAdd [32002, "Right"];
lbSetValue [32002, _rightID, 1];
// select left as default
lbSetCurSel [32002, 0];

_addID = lbAdd [32004, "Add"];
lbSetValue [32004, _addID, 1];
_dropID = lbAdd [32004, "Drop"];
lbSetValue [32004, _dropID, -1];
// select right as default
lbSetCurSel [32004, 0];

// select previously selected ammo type in combo box as default
lbSetCurSel [32000, _batteryGroup getVariable ["JEPP_artillery_adjustAmmoIndex", 0]];



// add units to direction combo box
lbAdd [32006, "mils"];
lbAdd [32006, "deg"];
// set mils as default
lbSetCurSel [32006,0];