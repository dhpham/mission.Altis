_minDist = 50;
_maxDist = 500;
_objDist = 0;
_maxGradient = 0;
_gradRad = 0;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

_plane = "RHS_A10";

// plane
_pos = [getPos player, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
_dir = random 360;
_group = createGroup side player;
_p = [_pos, _dir, _plane, _group] call BIS_fnc_spawnVehicle;
plane = vehicle leader _group;

// ip
_center = [worldSize/2, worldSize/2];
_minDist = 0;
_maxDist = worldSize/2;
_objDist = 1;
_maxGradient = 1000;
_gradRad = 0;
_waterMode = 1;
_shoreMode = false;
_posBlacklist = [];
_pos = [_center, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
_ip = createMarker ["ip", _pos];
_ip setMarkerType "mil_dot";
_ip setMarkerText "IP";