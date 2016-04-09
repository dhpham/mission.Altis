_center = _this select 0;
_side = _center getVariable ["JEPP_spawn_center_side", CIVILIAN];
_types = ["LOP_AFR_Infantry_SL", "LOP_AFR_Infantry_TL", "LOP_AFR_Infantry_Rifleman", "LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_AT_Asst", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_AR_Asst", "LOP_AFR_Infantry_Marksman"];

_groupsArray = _center getVariable ["JEPP_spawn_center_groupsArray", []];
{
    _unitsArray = _x;
    _group = createGroup _side;
    _groups pushBackUnique _group;
    _center setVariable ["JEPP_spawn_center_groups", _groups];
    {
        _type = _x;
        _unit = _group createUnit [_type, getPos _center, [], 25, "NONE"];
        _unit joinSilent _group;
    } forEach _unitsArray;
    [_group, getPos _center, 100 + random 200] call BIS_fnc_taskPatrol;
} forEach _groupsArray;



_n = [1,2,3,4,5,6,7,8,9,10];
_w = [0.02, 0.02, 0.1, 0.32, 0.04, 0.04, 0.04, 0.16, 0.16, 0.1];
_maxGroups = 5;
while {true} do {
    _groups = _center getVariable ["JEPP_spawn_center_groups", []];
    [_groups, [], {count units _x > 0}, true] call JEPP_fnc_filter;
    _numGroups = count _groups;
    if (_numGroups < _maxGroups) then {
        _group = createGroup _side;
        _groups pushBack _group;
        _center setVariable ["JEPP_spawn_center_groups", _groups];
        _num = [_n, _w] call BIS_fnc_selectRandomWeighted;
        for "_x" from 1 to _num do {
            _type = selectRandom _infantry;
            _unit = _group createUnit [_type, getPos _center, [], 25, "NONE"];
            [_unit] joinSilent _group;
        };
        
        [_group, getPos _center, 100 + random 200] call BIS_fnc_taskPatrol;
        sleep 30;
    };
};