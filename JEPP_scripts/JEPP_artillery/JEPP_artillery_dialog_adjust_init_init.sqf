_group = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_array = player getVariable ["JEPP_artillery_currentBatteryArray", []];

ctrlSetText [35002, player getVariable ["JEPP_artillery_directionStr", ""]];

// create a pairs array of the battery's ammo types and their counts
_ammo = []; // [...[type,rounds],[type,rounds]...]
{
    {
        _ammo = [_ammo, _x select 0, _x select 1] call BIS_fnc_addToPairs;
    } forEach magazinesAmmoFull _x;
} forEach _array;

// update group's ammo count variable
_group setVariable ["JEPP_artillery_ammo", _ammo];

// check if battery has ammo/can fire
_canFire = true;
{if !(canFire _x) then {_canFire = false;};} forEach _array;
if ((_ammo isEqualTo []) && _canFire) then {
    vehicle leader _group sideChat "Cannot fire.";
    // vehicle leader _group sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "end"];
    execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf';
    closeDialog 3500;
};

// add to combo box
{
    _displayName = getText (configfile >> "CfgMagazines" >> _x select 0 >> "displayName");
    _id = lbAdd [35001, format["%1", _displayName]];
    lbSetValue [35001, _id, _forEachIndex];
} forEach _ammo;

// select first ammo type in combo box as default
//_group setVariable ["JEPP_artillery_adjustAmmoIndex", 0];
lbSetCurSel [35001, _group getVariable ["JEPP_artillery_adjustAmmoIndex", 0]];



// add units to direction combo box
lbAdd [35003, "mils"];
lbAdd [35003, "deg"];
// set mils as default
lbSetCurSel [35003,0];