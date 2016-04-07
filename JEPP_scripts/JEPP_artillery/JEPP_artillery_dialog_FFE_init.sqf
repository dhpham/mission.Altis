_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_batteryArray = player getVariable ["JEPP_artillery_currentBatteryArray", []];

// no longer needed, so reset to empty
player setVariable ["JEPP_artillery_grid", ""];
player setVariable ["JEPP_artillery_savedTargetStr", ""];

// create a pairs array of the battery's ammo types and their counts
_ammo = []; // [...[type,rounds],[type,rounds]...]
{
    {
        _ammo = [_ammo, _x select 0, _x select 1] call BIS_fnc_addToPairs;
    } forEach magazinesAmmoFull _x;
} forEach _batteryArray;

// update group's ammo count variable
_batteryGroup setVariable ["JEPP_artillery_ammo", _ammo];

// gun count
_count = {canFire _x} count _batteryArray;
// check if battery has ammo/can fire
if ((_ammo isEqualTo []) || _count == 0) then {
    vehicle leader _batteryGroup sideChat "Cannot fire.";
    // vehicle leader _batteryGroup sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "end"];
    execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf';
    closeDialog 3300;
};

// check for pluralization
_s = "s";
if (_count == 1) then {_s = ""};
ctrlSetText [33003,format["x%1 gun%2", _count, _s]];

// add to combo box
{
    _displayName = getText (configfile >> "CfgMagazines" >> _x select 0 >> "displayName");
    _roundCount = (_x select 1)/_count; // don't really need to count the entire battery's rounds, but fuck it
    _id = lbAdd [33001, format["%1 %2", _roundCount, _displayName]];
    lbSetValue [33001, _id, _forEachIndex];
} forEach _ammo;

// select first ammo type in combo box as default
lbSetCurSel [33001, 0];