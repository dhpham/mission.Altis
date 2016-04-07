_controller = [_this,0,objNull,[objNull]] call BIS_fnc_param; // object
_planes = [_this,1,[],[[]]] call BIS_fnc_param; // array of objects
JEPP_cas_ip = [_this,2,[],[[]]] call BIS_fnc_param;
JEPP_cas_planes = []; // array of objects
JEPP_cas_ordnance = [];

// add planes
_planes execVM "JEPP_scripts\JEPP_cas\JEPP_cas_addPlane.sqf";

// add comm menu item
[_controller, "JEPP_comm_cas"] call BIS_fnc_addCommMenuItem;

// variables
_smoke = ["SmokeShell", "SmokeShellRed", "SmokeShellOrange", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellBlue", "SmokeShellPurple"];
_smokeGren = ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell"];
_chem = ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"];
_IR = ["B_IR_Grenade", "I_IR_Grenade", "O_IR_Grenade"];
_rhs_usf_smoke = ["rhs_ammo_an_m8hc", "rhs_ammo_m18_green", "rhs_ammo_m18_purple", "rhs_ammo_m18_red", "rhs_ammo_m18_yellow"];
_rhs_arf_smoke = ["rhs_ammo_rdg2_white", "rhs_ammo_rdg2_black", "rhs_ammo_nspd"];
_rhs_arf_flare = ["rhs_ammo_nspn_yellow", "rhs_ammo_nspn_red", "rhs_ammo_nspn_green"];
_ace_flare = ["ACE_F_Hand_White", "ACE_F_Hand_Red", "ACE_F_Hand_Green", "ACE_F_Hand_Yellow"];

JEPP_cas_smoke = _smoke + _smokeGren + _rhs_arf_smoke + _rhs_usf_smoke;
JEPP_cas_IR = _IR;