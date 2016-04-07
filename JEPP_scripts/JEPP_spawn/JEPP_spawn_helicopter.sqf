_minDist = 15;
_maxDist = 150;
_objDist = 15;
_maxGradient = 0.5;
_gradRad = 5;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

_helicopter = "B_Heli_Light_01_f";

// helicopter
_pos = [getPos player, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
_dir = random 360;
_group = createGroup side player;
_a1 = [_pos, _dir, _helicopter, _group] call BIS_fnc_spawnVehicle;
_a2 = [[_pos, [30, 135], _dir] call JEPP_fnc_polarShift, _dir, _helicopter, _group] call BIS_fnc_spawnVehicle;
helicopter = leader _group;