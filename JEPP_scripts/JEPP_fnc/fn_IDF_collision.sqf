/*
	Author: JEPP

	Description:
	Returns true if the trajectory collides with terrain.
	
	Parameter(s):
    _this select 0: OBJECT - Unit
    _this select 1: NUMBER - Spacing
    _this select 2: NUMBER - Muzzle velocity
    _this select 3: NUMBER - Direction of target
    _this select 4: NUMBER - Gun elevation angle
    _this select 5: NUMBER - Relative target elevation

	Example:

	Returns:
    BOOLEAN
*/

params [
    ["_pos",[0,0,0],[[],objNull],[3]],
    ["_n",100,[0]],
    ["_v",0,[0]],
    ["_dir",0,[0]],
    ["_angle",0,[0]],
    ["_elev",0,[0]],
    ["_obj1",objNull,[objNull]],
    ["_obj2",objNull,[objNull]],
    "_pos",
    "_g",
    "_tof",
    "_r",
    "_t",
    "_i",
    "_d1",
    "_h1",
    "_p1",
    "_d2",
    "_h2",
    "_p2",
    "_coll"
];

if (_pos isEqualType objNull) then {
    _pos = getPosASL _pos;
};
_traj = [false, _pos, _n, _v, _dir, _angle, _elev] call JEPP_fnc_trajectory;
_a = _traj select 0;
_r = _traj select 2;
_coll = false;
scopeName "main";
for "_x" from 0 to (_n - 1) do {
    _p1 = _a select _x;
    _p2 = _a select (_x + 1);
    
    if ((_p2 distance2D _pos) < (_r - 50) && !(lineIntersectsSurfaces [_p1, _p2, _obj1, _obj2] isEqualTo [])) then {
        _coll = true;
        breakTo "main";
    };
};

_coll;