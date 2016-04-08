_center = _this select 0;
_groups = _center getVariable ["JEPP_spawn_centerGroups", []];
_groupsArray = [];
{
    _group = _x;
    _unitsArray = [];
    {
        _unitsArray pushBack typeOf _x;
    } forEach units _group;
    _groupsArray pushBack _unitsArray;
    // to do: save more info, ie ammo, identity, etc
} forEach _groups;
_center setVariable ["JEPP_spawn_centerGroupsArray", _groupsArray];