#include "briefing.sqf";

player removeWeapon "Binocular";
player addMagazine "Laserbatteries";
player addWeapon "Laserdesignator";

// spawn
_spawn = [] execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_init.sqf";
waitUntil {scriptDone _spawn};
// artillery
_artillery = [player, [group artillery]] execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_init.sqf";
waitUntil {scriptDone _artillery};
_spg = [group spg] execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_addBattery.sqf";
waitUntil {scriptDone _spg};
// helicopter
_helicopter = [player, [group helicopter]] execVM "JEPP_scripts\JEPP_helicopter\JEPP_helicopter_init.sqf";
waitUntil {scriptDone _helicopter};
// cas
_cas = [player, [plane], ["ip"]] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_init.sqf";
waitUntil {scriptDone _cas};

/*
// clean up
[] spawn {
    while {true} do {
        {deleteVehicle _x} forEach allDeadMen;
        sleep 300;
    };
};
*/