_center = _this select 0;
_groups = _center getVariable ["JEPP_spawn_center_groups", []];
[_groups, [], {count units _x > 0}, true] call JEPP_fnc_filter;
_groupsArray = [];
{
    _group = _x;
    _unitsArray = [];
    {
        _unit = _x;
        _unitsArray pushBack typeOf _unit;
        deleteVehicle _unit;
    } forEach units _group;
    _groupsArray pushBack _unitsArray;
    deleteGroup _group;
    // to do: save more info, ie ammo, identity, etc
    // vehicles, crew position, ...
    // world position
} forEach _groups;
_center setVariable ["JEPP_spawn_center_groupsArray", _groupsArray];
_center setVariable ["JEPP_spawn_center_groups", []];

player sideChat format ["despawn: %1", _groupsArray];