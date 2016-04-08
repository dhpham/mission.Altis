_units = ["LOP_AFR_Infantry_Rifleman", "LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_Marksman"];
_center = _this select 0;
_side = _center getVariable ["JEPP_spawn_centerSide", OPFOR];

_groupsArray = _center getVariable ["JEPP_spawn_centerGroupsArray", []];
{
    _unitsArray = _x;
    _group = createGroup _side;
    _groups pushBack _group;
    _center setVariable ["JEPP_spawn_centerGroups", _groups];
    {
        _type = _x;
        _unit = _group createUnit [_type, getPos _center, [], 25, "NONE"];
        [_group, getPos _center, 150 + random 150] call BIS_fnc_taskPatrol;
    } forEach _unitsArray;
    sleep 1;
} forEach _groupsArray;

_s = [_center, _side, _units] spawn {
    _center = _this select 0;
    _side = _this select 1;
    _units = _this select 2;
    
    _n = [1,2,3,4,5,6,7,8,9,10];
    _w = [0.02, 0.02, 0.1, 0.32, 0.04, 0.04, 0.04, 0.16, 0.16, 0.1];
    
    _maxGroups = 5;
    _groups =  getVariable ["JEPP_spawn_centerGroups", []];
    while {count _groups < _maxGroups} do {
        _group = createGroup _side;
        _groups pushBack _group;
        _center setVariable ["JEPP_spawn_centerGroups", _groups];
        _num = [_n, _w] call BIS_fnc_selectRandomWeighted;
        for "_x" from 1 to _num do {
            _type = selectRandom _units;
            _unit = _group createUnit [_type, getPos _center, [], 25, "NONE"];
        };
        
        [_group, getPos _center, 300 + random 200] call BIS_fnc_taskPatrol;
        sleep 20;
    };
};

_center setVariable ["JEPP_spawn_script", _s];