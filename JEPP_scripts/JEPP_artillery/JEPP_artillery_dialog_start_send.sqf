_index = lbValue [31001, lbCurSel 31001];
_grid = ctrlText 31002;
_type1 = lbText [31003, lbCurSel 31003];
_type2 = lbText [31004, lbCurSel 31004];

closeDialog 3100;

_group = JEPP_artillery_batteries select _index;
player setVariable ["JEPP_artillery_currentBatteryGroup", _group];
player setVariable ["JEPP_artillery_grid", _grid];
player setVariable ["JEPP_artillery_targetType1", _type1];
player setVariable ["JEPP_artillery_targetType2", _type2];

_battery = [];
{
    // array of all guns (vehicles) in currently controlled battery group
    _battery pushBackUnique vehicle _x;
} forEach units _group;

// save variable
player setVariable ["JEPP_artillery_currentBatteryArray", _battery];

// no need to update target pos for saved missions
if (player getVariable ["JEPP_artillery_dialog", "start"] != "saved") then {
    _pos = _grid call JEPP_fnc_gridPos;
    // check for valid grid
    if (_pos isEqualTo []) exitWith {
        vehicle leader _group sideChat "No grid entered.";
        player setVariable ["JEPP_artillery_dialog", "start"];
    };
    _pos set [2, getTerrainHeightASL _pos];
    _group setVariable ["JEPP_artillery_targetPos", _pos];
};

if (player getVariable ["JEPP_artillery_dialog", ""] == "FFE") then {
    _type = "";
    _savedTargetStr = player getVariable ["JEPP_artillery_savedTargetStr", ""];
    if (_grid == "") then {_type = "target "};
    if (_savedTargetStr == "") then {_type = "grid "};
    _message = format ["%1, %2%3%4. %5 %6. Request ", groupId _group, _type, _savedTargetStr, _grid, _type1, _type2];
    player setVariable ["JEPP_artillery_adjustMessageFFE", _message];
};

execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf";