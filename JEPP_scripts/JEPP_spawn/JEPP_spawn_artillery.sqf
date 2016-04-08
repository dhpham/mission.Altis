_minDist = 55;
_maxDist = 100;
_objDist = 10;
_maxGradient = 0.5;
_gradRad = 1;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

_artillery = "rhsusf_m109d_usarmy";
_spg = "RHS_M119_D";

// artillery
_pos = [getPos player, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
_dir = random 360;
_group = createGroup side player;
_a1 = [_pos, _dir, _artillery, _group] call BIS_fnc_spawnVehicle;
_a2 = [[_pos, [15, 135], _dir] call JEPP_fnc_polarShift, _dir, _artillery, _group] call BIS_fnc_spawnVehicle;
artillery = leader _group;
_group setGroupID ["artillery"];

// spg
_pos = [getPos player, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
_dir = random 360;
_group = createGroup side player;
_a1 = [_pos, _dir, _spg, _group] call BIS_fnc_spawnVehicle;
_a2 = [[_pos, [15, 135]] call JEPP_fnc_polarShift, _dir, _spg, _group] call BIS_fnc_spawnVehicle;
spg = leader _group;
_group setGroupID ["spg"];