_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_ammoIndex = [_this,0,0,[0]] call BIS_fnc_param;
_batteryGroup setVariable ["JEPP_artillery_adjustAmmoIndex", _ammoIndex];
_directionStr = [_this,1,"",[""]] call BIS_fnc_param;
_directionUnits = [_this,2,"",[""]] call BIS_fnc_param;
_ammoArray = _batteryGroup getVariable ["JEPP_artillery_ammo", []];
_ammo = _ammoArray select _ammoIndex select 0;
_leader = vehicle leader _batteryGroup;
_targetPos = _batteryGroup getVariable ["JEPP_artillery_targetPos", []];
_displayName = getText (configfile >> "CfgMagazines" >> _ammo >> "displayNameShort");

// convert direction to mils
switch _directionUnits do {
    case "mils" : {
        _directionStr = _directionStr;
    };
    case "deg" : {
        _directionStr = str (round(parseNumber(_directionStr) * (6400/360)));
    };
};

// format direction
_direction = (parseNumber _directionStr) % 6400;
if (_direction < 0) then {_direction = 6400 + _direction};
_directionStr = [str(_direction), 4] call JEPP_fnc_leadingZeros;
// save direction
player setVariable ["JEPP_artillery_directionStr", _directionStr];

// check whether grid or saved target and format message
_type = "";
_grid = player getVariable ["JEPP_artillery_grid", ""];
_savedTargetStr = player getVariable ["JEPP_artillery_savedTargetStr", ""];
if (_grid == "") then {_type = "Target "};
if (_savedTargetStr == "") then {_type = "Grid "};
_type1 = player getVariable ["JEPP_artillery_targetType1", ""];
_type2 = player getVariable ["JEPP_artillery_targetType2", ""];
_directionStr = [parseNumber _directionStr, 10] call JEPP_fnc_roundNum;
player sideChat format["%1, adjust fire. %2%3%4. %5 %6. Direction %7. Request %8.", groupId _batteryGroup, _type, _savedTargetStr, _grid, _type1, _type2, _directionStr, _displayName];
// player sideRadio "beepSend";

player setVariable ["JEPP_artillery_grid", ""]; // no longer needed, so reset to empty.

sleep 3;

// fire spotting round
[_ammo] execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_fire_spotting.sqf";