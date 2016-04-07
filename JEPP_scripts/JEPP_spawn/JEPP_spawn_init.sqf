_worldCenter = [worldSize/2, worldSize/2];
_minDist = 0;
_maxDist = worldSize/2;
_objDist = 100;
_maxGradient = 1;
_gradRad = 10;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = []; 
//_pos = [_worldCenter, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
//player setPos _pos;


_squad = execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_squad.sqf";
waitUntil {scriptDone _squad};
_artillery = execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_artillery.sqf";
waitUntil {scriptDone _artillery};
_helicopter = execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_helicopter.sqf";
waitUntil {scriptDone _helicopter};
_plane = execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_plane.sqf";
waitUntil {scriptDone _plane};
_camps = execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_camps.sqf";
waitUntil {scriptDone _camps};