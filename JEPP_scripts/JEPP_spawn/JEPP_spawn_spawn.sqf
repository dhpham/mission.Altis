_center = _this select 0;
_side = _center getVariable ["JEPP_spawn_center_side", CIVILIAN];
_types = [
    ["LOP_AFR_Infantry_SL", "LOP_AFR_Infantry_Corpsman"
        "LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst", "LOP_AFR_Infantry_Grenadier",
        "LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_AT_Asst", "LOP_AFR_Infantry_Rifleman"],
    ["LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst", "LOP_AFR_Infantry_Rifleman"],
    ["LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst", "LOP_AFR_Infantry_Rifleman_3"],
    ["LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst", "LOP_AFR_Infantry_Grenadier"],
    ["LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_AT_Asst", "LOP_AFR_Infantry_Rifleman"],
    ["LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst"],
    ["LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_AT_Asst"],
    ["LOP_AFR_Infantry_Marksman"],
    ["LOP_AFR_Infantry_Rifleman_3"],
    ["LOP_AFR_Landrover_M2"],
    ["LOP_AFR_Offroad_M2"]
];
_weights = [0.2,0.5,0.5,0.5,0.5,0.4,0.4,0.3,0.3,0.2,0.2];

_types2 = [];

_minDist = 10;
_maxDist = 50;
_objDist = 10;
_maxGradient = 0.1;
_gradRad = 1;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];
_objBlacklist = [];

_groupsArray = _center getVariable ["JEPP_spawn_center_groupsArray", []];
_groups = [];
{
    _unitsArray = _x;
    _pos = [getPos _center, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist, _objBlacklist] call JEPP_fnc_findFlatEmpty;
    _group = [_pos, _side, _unitsArray] call BIS_fnc_spawnGroup;
    _groups pushBack _group;
    _center setVariable ["JEPP_spawn_center_groups", _groups];
    [_group, getPos _center, 100 + random 500] call BIS_fnc_taskPatrol;
} forEach _groupsArray;

_maxGroups = 10;
while {true} do {
    _groups = _center getVariable ["JEPP_spawn_center_groups", []];
    [_groups, [], {{alive _x} count (units _x) > 0}, true] call JEPP_fnc_filter;
    _numGroups = count _groups;
    if (_numGroups < _maxGroups) then {
        _type = [_types, _weights] call BIS_fnc_selectRandomWeighted;
        _pos = [getPos _center, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist, _objBlacklist] call JEPP_fnc_findFlatEmpty;
        _group = [_pos, _side, _type] call BIS_fnc_spawnGroup;
        _groups pushBack _group;
        _center setVariable ["JEPP_spawn_center_groups", _groups];
        [_group, getPos _center, 100 + random 500] call BIS_fnc_taskPatrol;
        sleep 10;
    };
};
// to do: pause spawning if player near