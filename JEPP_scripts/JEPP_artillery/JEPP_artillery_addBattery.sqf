JEPP_artillery_batteries append _this; // array of groups
{
    {
        // muzzle
        _x doWatch ([getPos _x, [10^10, getDir _x, 45]] call JEPP_fnc_polarShift);
        _x disableAI "MOVE";
        vehicle _x allowCrewInImmobile true;
    } forEach units _x;
} forEach JEPP_artillery_batteries;