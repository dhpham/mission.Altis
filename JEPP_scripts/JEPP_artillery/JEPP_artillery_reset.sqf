_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_batteryArray = player getVariable ["JEPP_artillery_currentBatteryArray", []];

// terminate scripts
_handles = _batteryGroup getVariable ["JEPP_artillery_scriptHandles", []];
_batteryGroup setVariable ["JEPP_artillery_scriptHandles", []];
{terminate _x;} forEach _handles;

// remove eventhandlers
{
    _id = _x getVariable ["JEPP_artillery_firedEH_id", 0];
    _x removeEventHandler ["fired", _id];
    _x setVariable ["JEPP_artillery_shot", false];
    _x setVariable ["JEPP_artillery_shots", 0];
    _x setVariable ["JEPP_artillery_complete", false];
    
    // muzzle
    _x doWatch ([getPos _x, [10^10, getDir _x, 45]] call JEPP_fnc_polarShift);
} forEach _batteryArray;

// ensure all guns have the same number of rounds
_leader = vehicle leader _batteryGroup;
_magazines = magazinesAmmoFull _leader;
{
    _gun = _x;
    {
        _mag = _x select 0;
        _cnt = _x select 1;
        _gun removeMagazine _mag;
        _gun addMagazine [_mag, _cnt];
    } forEach _magazines;
} forEach _batteryArray;

// reset variables
player setVariable ["JEPP_artillery_dialog", "start"];
player setVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
player setVariable ["JEPP_artillery_currentBatteryArray", []];
player setVariable ["JEPP_artillery_directionStr", ""];
player setVariable ["JEPP_artillery_grid", ""];
player setVariable ["JEPP_artillery_savedTargetStr", ""];
player setVariable ["adjustMessageFFE", ""];
player setVariable ["targetType1", ""];
player setVariable ["targetType2", ""];
_batteryGroup setVariable ["JEPP_artillery_ammo", []];
_batteryGroup setVariable ["JEPP_artillery_adjustAmmoIndex", 0];
_batteryGroup setVariable ["targetPos", []];
