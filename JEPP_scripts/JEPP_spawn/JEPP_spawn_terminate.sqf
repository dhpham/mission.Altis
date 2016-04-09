// terminate scripts
{
    _center = _x;
    _s = _center getVariable ["JEPP_spawn_script", scriptNull];
    terminate _s;
} forEach JEPP_spawn_centers;