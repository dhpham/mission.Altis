/*
	Author: JEPP

	Description:
	Draw trajectory.
	
	Parameter(s):
    _this select 0: ARRAY - Position ASL
    _this select 1: NUMBER - Number of segments
    _this select 2: NUMBER - Muzzle velocity
    _this select 3: NUMBER - Direction of target
    _this select 4: NUMBER - Gun elevation angle
    _this select 5: NUMBER - Relative target elevation

	Example:

	Returns:
    BOOLEAN
*/

params [
    ["_draw",false,[true]],
    ["_pos",[0,0,0],[[]],[3]],
    ["_n",100,[0]],
    ["_v",0,[0]],
    ["_dir",0,[0]],
    ["_angle",0,[0]],
    ["_h",0,[0]],
    "_a",
    "_g",
    "_tof",
    "_r",
    "_t",
    "_d",
    "_h",
    "_p",
    "_s"
];

_a = [];
_g = 9.8;
_tof = (_v*sin(_angle) + sqrt(_v^2 * sin(_angle)^2 - 2*_g*_h))/_g;
_r = _v*cos(_angle)*_tof;
_t = _tof/_n;
for "_x" from 0 to _n do {
    _d = _v*(_t*_x)*cos(_angle);
    _h = _v*(_t*_x)*sin(_angle) - 0.5*_g*(_t*_x)^2;
    
    _p = [_pos, [_d, _dir]] call JEPP_fnc_polarShift;
    _p set [2, _h + (_pos select 2)];
    
    _a pushBack _p;
    
    if (_draw) then {
        _s = "Sign_Sphere200cm_F" createVehicle [0,0,0];
        _s setPosASL _p;
    };
};

if (_draw) then {
    for "_x" from 0 to (count _a - 2) do {
        [format ["%1_trajectory", _pos], "onEachFrame", {
            _a = _this;
            for "_x" from 0 to (count _a - 2) do {
                drawLine3D [ASLToAGL (_a select _x), ASLToAGL (_a select (_x + 1)), [1,0,1,1]];
            };
        }, _a] call BIS_fnc_addStackedEventHandler;
    };
};

[_a, _tof, _r];