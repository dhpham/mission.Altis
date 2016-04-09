_rad = 25;

_configs = 'getText (_x >> "nameSound") != "" && getText (_x >> "name") == getText (_x >> "nameSound")' configClasses (configfile >> "CfgIdentities");
_configs = _configs call BIS_fnc_arrayShuffle;
_names = [_configs, [], {getText (_x >> "name")}, false] call JEPP_fnc_apply;
_names = [];
_identities = [];
{
    _config = _x;
    _name = getText (_config >> "name");
    if !(_name in _names) then {
        _names pushBack _name;
        _identities pushBack configName _config;
    };
} forEach _configs;

_f11 = "rhsusf_usmc_marpat_wd_teamleader";
_f12 = "rhsusf_usmc_marpat_wd_autorifleman";
_f13 = "rhsusf_usmc_marpat_wd_rifleman";
_f14 = "rhsusf_usmc_marpat_wd_rifleman_m590";

_f21 = "rhsusf_usmc_marpat_wd_teamleader";
_f22 = "rhsusf_usmc_marpat_wd_machinegunner";
_f23 = "rhsusf_usmc_marpat_wd_marksman";
_f24 = "rhsusf_usmc_marpat_wd_machinegunner_ass";

_md = "rhsusf_navy_marpat_wd_medic";
_md = group player createUnit [_md, getPos player, [], _rad, "FORM"];
_md setIdentity (_identities call BIS_fnc_arrayPop);
_md setPitch (0.85 + random 0.15);
_md setRank "CORPORAL";
_md setSkill 0.85;
_md joinAsSilent [group player, 2];

// ft1
_a1 = group player createUnit [_f11, getPos player, [], _rad, "FORM"];
_a1 setIdentity (_identities call BIS_fnc_arrayPop);
_a1 setPitch (0.85 + random 0.15);
_a1 setRank "SERGEANT";
_a1 setSkill 0.9;
_a1 joinAsSilent [group player, 3];

_a2 = group player createUnit [_f12, getPos player, [], _rad, "FORM"];
_a2 setIdentity (_identities call BIS_fnc_arrayPop);
_a2 setPitch (0.85 + random 0.15);
_a2 setRank "CORPORAL";
_a2 setSkill 0.8;
_a2 joinAsSilent [group player, 4];

_a3 = group player createUnit [_f13, getPos player, [], _rad, "FORM"];
_a3 setIdentity (_identities call BIS_fnc_arrayPop);
_a3 setPitch (0.85 + random 0.15);
_a3 setRank "PRIVATE";
_a3 setSkill 0.75;
_a3 joinAsSilent [group player, 5];

_a4 = group player createUnit [_f14, getPos player, [], _rad, "FORM"];
_a4 setIdentity (_identities call BIS_fnc_arrayPop);
_a4 setPitch (0.85 + random 0.15);
_a4 setRank "PRIVATE";
_a4 setSkill 0.7;
_a4 joinAsSilent [group player, 6];

// ft2
_b1 = group player createUnit [_f21, getPos player, [], _rad, "FORM"];
_b1 setIdentity (_identities call BIS_fnc_arrayPop);
_b1 setPitch (0.85 + random 0.15);
_b1 setRank "SERGEANT";
_b1 setSkill 0.85;
_b1 joinAsSilent [group player, 7];

_b2 = group player createUnit [_f22, getPos player, [], _rad, "FORM"];
_b2 setIdentity (_identities call BIS_fnc_arrayPop);
_b2 setPitch (0.85 + random 0.15);
_b2 setRank "CORPORAL";
_b2 setSkill 0.7;
_b2 joinAsSilent [group player, 8];

_b3 = group player createUnit [_f23, getPos player, [], _rad, "FORM"];
_b3 setIdentity (_identities call BIS_fnc_arrayPop);
_b3 setPitch (0.85 + random 0.15);
_b3 setRank "PRIVATE";
_b3 setSkill 0.65;
_b3 joinAsSilent [group player, 9];

_b4 = group player createUnit [_f24, getPos player, [], _rad, "FORM"];
_b4 setIdentity (_identities call BIS_fnc_arrayPop);
_b4 setPitch (0.85 + random 0.15);
_b4 setRank "PRIVATE";
_b4 setSkill 0.6;
_b4 joinAsSilent [group player, 10];

{_x assignTeam "RED"} forEach [_a1, _a2, _a3, _a4];
{_x assignTeam "GREEN"} forEach [_b1, _b2, _b3, _b4];

/*
{
    _x assignItem "rhsusf_ANPVS_14";
} forEach [player, _a1, _a2, _a3, _a4, _b1, _b2, _b3, _b4, _md];
*/