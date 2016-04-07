_planes = _this;

// init aircraft
{
	[_x, getMarkerPos (selectRandom JEPP_cas_ip)] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_aircraft_init.sqf";
    _x execVM "JEPP_scripts\JEPP_cas\JEPP_cas_bingo.sqf";
} forEach _planes;

// weapon profiles
{
    {
        {
            _mag = _x select 0;
            _weapon = _x select 4;
            _ammo = configFile >> "CfgAmmo" >> (getText (configFile >> "CfgMagazines" >> _mag >> "ammo"));
            _parents = [_ammo, true] call BIS_fnc_returnParents;
            _airLock = getNumber (_ammo >> "airLock");
            _irLock = getNumber (_ammo >> "irLock");
            _laserLock = getNumber (_ammo >> "laserLock");
            
            _type = "NONE";
            if (_airLock > 0) then {
                if ("BulletCore" in _parents) then {
                    _type = "GUN";
                } else {
                    _type = "AA";
                };
            };
            
            if ("CMflareAmmo" in _parents) then {
                _type = "CM";
            };
            
            if ("LaserBombCore" in _parents) then {
                _type = "LGB";
            };
            
            if ("Rocket_04_HE_F" in _parents || "RocketCore" in _parents) then {
                _type = "RKT";
            };
            
            if ("Missile_AGM_02_F" in _parents || "M_Scalpel_AT" in _parents) then {
                _type = "AGM";
            };
            
            if (_weapon != "" && [JEPP_cas_ordnance, _weapon] call BIS_fnc_findInPairs == -1) then {
                JEPP_cas_ordnance pushBack [_weapon, _type];
            };
        } forEach magazinesAmmoFull vehicle _x;
    } forEach units _x;
} forEach _planes;

/*
// [weapon, [type, airlock, irlock, laserlock]]
[
    ["CMFlareLauncher",["CM",0,0,0]],
    ["missiles_ASRAAM",["AA",2,1,0]],
    ["missiles_Zephyr",["AA",2,1,0]],
    ["Missile_AA_03_Plane_CAS_02_F",["AA",2,1,0]],
    ["Missile_AA_04_Plane_CAS_01_F",["AA",2,1,0]],
    ["rhs_weap_r73_Launcher",["AA",1,1,1]],
    ["rhs_weap_SidewinderLauncher",["AA",1,1,0]],
    ["Cannon_30mm_Plane_CAS_02_F",["GUN",1,0,0]],
    ["Twin_Cannon_20mm",["GUN",1,0,0]],
    ["RHS_weap_gau8",["GUN",1,0,0]],
    ["Gatling_30mm_Plane_CAS_01_F",["GUN",1,0,0]],
    ["RHS_weap_GSh30",["GUN",1,0,0]],
    ["rhs_weap_Ch29_Launcher",["AGM",0,1,1]],
    ["missiles_SCALPEL",["AGM",0,1,1]],
    ["rhs_weap_agm65",["AGM",0,1,1]],
    ["Missile_AGM_02_Plane_CAS_01_F",["AGM",0,1,0]],
    ["Missile_AGM_01_Plane_CAS_02_F",["AGM",0,1,0]],
    ["rhs_weap_s8",["RKT",0,0,0]],
    ["Rocket_03_HE_Plane_CAS_02_F",["RKT",0,0,0]],
    ["Rocket_03_AP_Plane_CAS_02_F",["RKT",0,0,0]],
    ["rhs_weap_FFARLauncher",["RKT",0,0,0]],
    ["Rocket_04_HE_Plane_CAS_01_F",["RKT",0,0,0]],
    ["Rocket_04_AP_Plane_CAS_01_F",["RKT",0,0,0]],
    ["Bomb_03_Plane_CAS_02_F",["LGB",0,0,1]],
    ["Bomb_04_Plane_CAS_01_F",["LGB",0,0,1]],
    ["GBU12BombLauncher",["LGB",0,0,1]],
    ["rhs_weap_gbu12",["LGB",0,0,1]],
    ["rhs_weap_fab250",["LGB",0,0,1]]
]
*/

JEPP_cas_planes append _planes;