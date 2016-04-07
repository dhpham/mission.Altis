_groupId = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_grid = [_this,2,"",[""]] call BIS_fnc_param;
_group = [JEPP_helicopter_groups, _groupId] call BIS_fnc_getFromPairs;

{
    _heli = _x;
    sleep 3;
    _s = [_heli, _type, _grid] spawn {
        _heli = _this select 0;
        _type = _this select 1;
        _grid = _this select 2;
        _s = [_heli, _grid] execVM format["JEPP_scripts\JEPP_helicopter\JEPP_helicopter_%1.sqf", _type];
        // save script handle for terminate
        if (_type != "RTB") then {
            [_heli, "JEPP_helicopter_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
        };
    };
} forEach _group;