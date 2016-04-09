// terminate scripts
{
    _center = _x;
    _s = _center getVariable ["JEPP_spawn_script", scriptNull];
    terminate _s;
    _t = _center getVariable ["JEPP_spawn_center_trg", objNull];
    deleteVehicle _t;
} forEach JEPP_spawn_centers;