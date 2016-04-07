// terminate scripts
{
    _center = _x;
    _s = _center getVariable ["JEPP_spawn_script", ""];
    _center setVariable ["JEPP_spawn_script", ""];
    terminate _s;
} forEach JEPP_spawn_centers;