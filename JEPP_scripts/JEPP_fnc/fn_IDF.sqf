/*
	Author: JEPP

	Description:
	Calculate firing solution for indirect fire.
	
	Parameter(s):
	_this select 0: OBJECT - Shooter
    _this select 1: ARRAY or OBJECT - Target
    _this select 2: BOOLEAN - Force high angle (OPTIONAL, default false)
    _this select 2: BOOLEAN - Draw trajectory (OPTIONAL, default false)

	Example:

	Returns:
    ARRAY - [_tof, _dir, _angle, _weapon, _mode, _ammo];
*/

params [
    ["_unit",objNull,[objNull]],
    ["_pos",[0,0,0],[objNull,[]],3],
    ["_HA",false,[true]],
    ["_debug",false,[true]],
    "_unitPos",
    "_inf",
    "_g",
    "_dist",
    "_dir",
    "_elev",
    "_weapon",
    "_modes",
    "_mode",
    "_m",
    "_v",
    "_maxDist",
    "_tofArray",
    "_tof",
    "_angle",
    "_coll",
    "_c"
];

// check if artillery
if (getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "artilleryScanner") != 1) exitWith {
    ["Unit is not capable of indirect fire."] call BIS_fnc_error;
    [];
};

// check range
if !([_unit, _pos] call JEPP_fnc_IDF_inRange) exitWith {
    ["Target not in range."] call BIS_fnc_error;
    [];
};

if (_pos isEqualType objNull) then {
    _pos = getPosASL _pos;
};
_inf = 10e10;
_g = 9.8;
_unitPos = getPosASL _unit;
_dist = _unitPos distance2D _pos;
_dir = [_unitPos, _pos] call BIS_fnc_dirTo;
_elev = (_pos select 2) - (_unitPos select 2); // elevation difference of target wrt shooter
_weapon = weapons _unit select 0;
_modes = getArray (configfile >> "CfgWeapons" >> _weapon >> "modes");
_parents = [configfile >> "CfgWeapons" >> _weapon, true] call BIS_fnc_returnParents;
if ("mortar_155mm_AMOS" in _parents) then {
    _m = [154, 243, 388.5, 648, 810];
};
if ("mortar_82mm" in _parents) then {
    _m = [70, 140, 200];
    _HA = true;
};
if ("rocket_230mm_GAT" in _parents) then {
    _m = [212.5, 425, 637.5, 850];
    _HA = true;
};
_m resize (count _modes / 2);



// find smallest TOF without terrain collision
// low angle
if !(_HA) then {
    _c = {
        _v = _x;
        _g = _input0;
        _dir = _input1;
        _dist = _input2;
        _elev = _input3;
        _maxDist = _v*(_v + sqrt(_v^2 - 4*_g*_elev))/(2*_g);
        if (_dist < _maxDist) then {
            _angle = (_v^2 - sqrt(_v^4 - _g*(_g*_dist^2 + 2*_elev*_v^2))) atan2 (_g*_dist);
            _coll = [_unitPos, 100, _v, _dir, _angle, _elev, _unit] call JEPP_fnc_IDF_collision;
            _tof = (_v*sin(_angle) + sqrt(_v^2 * sin(_angle)^2 - 2*_g*_elev))/_g;
            if !(_coll) then {
                _tof;
            } else {
                _inf;
            };
        } else {
            _inf;
        };
    };
    _tofArray = [_m, [_g, _dir, _dist, _elev], _c, false] call JEPP_fnc_apply;
    _tof = [_tofArray, 0] call BIS_fnc_findExtreme;
    _mode = _tofArray find _tof;
    _v = _m select _mode;
    _angle = (_v^2 - sqrt(_v^4 - _g*(_g*_dist^2 + 2*_elev*_v^2))) atan2 (_g*_dist);
    
    if (_tof == _inf) then {
        _HA = true;
    };
};

// high angle
if (_HA) then {
    _c = {
        _v = _x;
        _g = _input0;
        _dir = _input1;
        _dist = _input2;
        _elev = _input3;
        _maxDist = _v*(_v + sqrt(_v^2 - 4*_g*_elev))/(2*_g);
        if (_dist < _maxDist) then {
            _angle = (_v^2 + sqrt(_v^4 - _g*(_g*_dist^2 + 2*_elev*_v^2))) atan2 (_g*_dist);
            _coll = [_unitPos, 100, _v, _dir, _angle, _elev, _unit] call JEPP_fnc_IDF_collision;
            _tof = (_v*sin(_angle) + sqrt(_v^2 * sin(_angle)^2 - 2*_g*_elev))/_g;
            if !(_coll) then {
                _tof;
            } else {
                _inf;
            };
        } else {
            _inf;
        };
    };
    _tofArray = [_m, [_g, _dir, _dist, _elev], _c, false] call JEPP_fnc_apply;
    _tof = [_tofArray, 0] call BIS_fnc_findExtreme;
    _mode = _tofArray find _tof;
    _v = _m select _mode;
    _angle = (_v^2 + sqrt(_v^4 - _g*(_g*_dist^2 + 2*_elev*_v^2))) atan2 (_g*_dist);
};



if (_debug) then {
    [true, _unitPos, 100, _v, _dir, _angle, _elev] call JEPP_fnc_trajectory;
    player sideChat format ["HA: %1, TOF: %2", _HA, _tofArray];
};

// firing solution
if (_tof == _inf) then {
    ["Unable to find firing solution."] call BIS_fnc_error;
    [];
} else {;
    [_tof, _dir, _angle, _weapon, _mode];
};