_rad = 25;
_nato = ["Adams", "Armstrong", "Bennett", "Campbell", "Dixon", "Everett", "Franklin", "Frost", "Givens", "Hardy", "Hawkins", "Jackson", "James", "Kerry", "Lacey", "Larkin", "Levine", "Lopez", "Martinez", "McKay", "McKendrick", "Miller", "Mitchell", "Nichols", "Northgate", "OConnor", "Patterson", "Reynolds", "Ryan", "Sykes", "Tanny", "Taylor", "Walker"];

_f11 = "rhsusf_army_ocp_teamleader";
_f12 = "rhsusf_army_ocp_autorifleman";
_f13 = "rhsusf_army_ocp_grenadier";
_f14 = "rhsusf_army_ocp_autoriflemana";
_f21 = "rhsusf_army_ocp_teamleader";
_f22 = "rhsusf_army_ocp_autorifleman";
_f23 = "rhsusf_army_ocp_marksman";
_f24 = "rhsusf_army_ocp_autoriflemana";

_md = "rhsusf_army_ocp_medic";
_md = group player createUnit [_md, getPos player, [], _rad, "FORM"];
_md setRank "CORPORAL";
_md setSkill 0.75;
_md joinAsSilent [group player, 2];

_mg = "rhsusf_army_ocp_machinegunner";
_mg = group player createUnit [_mg, getPos player, [], _rad, "FORM"];
_mg setRank "CORPORAL";
_mg setSkill 0.75;
_mg joinAsSilent [group player, 3];

_mga = "rhsusf_army_ocp_machinegunnera";
_mga = group player createUnit [_mga, getPos player, [], _rad, "FORM"];
_mga setRank "PRIVATE";
_mga setSkill 0.65;
_mga joinAsSilent [group player, 4];


// ft1
_a1 = group player createUnit [_f11, getPos player, [], _rad, "FORM"];
_a1 setRank "SERGEANT";
_a1 setSkill 0.8;
_a1 joinAsSilent [group player, 5];

_a2 = group player createUnit [_f12, getPos player, [], _rad, "FORM"];
_a2 setRank "CORPORAL";
_a2 setSkill 0.7;
_a2 joinAsSilent [group player, 6];

_a3 = group player createUnit [_f13, getPos player, [], _rad, "FORM"];
_a3 setRank "PRIVATE";
_a3 setSkill 0.65;
_a3 joinAsSilent [group player, 7];

_a4 = group player createUnit [_f14, getPos player, [], _rad, "FORM"];
_a4 setRank "PRIVATE";
_a4 setSkill 0.6;
_a4 joinAsSilent [group player, 8];

// ft2
_b1 = group player createUnit [_f21, getPos player, [], _rad, "FORM"];
_b1 setRank "SERGEANT";
_b1 setSkill 0.85;
_b1 joinAsSilent [group player, 9];

_b2 = group player createUnit [_f22, getPos player, [], _rad, "FORM"];
_b2 setRank "CORPORAL";
_b2 setSkill 0.7;
_b2 joinAsSilent [group player, 10];

_b3 = group player createUnit [_f23, getPos player, [], _rad, "FORM"];
_b3 setRank "PRIVATE";
_b3 setSkill 0.65;
_b3 joinAsSilent [group player, 11];

_b4 = group player createUnit [_f24, getPos player, [], _rad, "FORM"];
_b4 setRank "PRIVATE";
_b4 setSkill 0.6;
_b4 joinAsSilent [group player, 12];

{_x assignTeam "RED"} forEach [_a1, _a2, _a3, _a4];
{_x assignTeam "GREEN"} forEach [_b1, _b2, _b3, _b4];
{_x assignTeam "BLUE"} forEach [_md, _mg, _mga];

{
    _x assignItem "rhsusf_ANPVS_14";
} forEach [player, _a1, _a2, _a3, _a4, _b1, _b2, _b3, _b4];