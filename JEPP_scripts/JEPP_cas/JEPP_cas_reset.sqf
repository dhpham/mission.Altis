_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;

// terminate scripts that use waitUntil
// contactMark
// contactLaser
// contactPointer
// weaponsRelease
// executeMission
// guns
_handles = _plane getVariable ["JEPP_cas_scriptHandles", []];
_plane setVariable ["JEPP_cas_scriptHandles", []];
{terminate _x;} forEach _handles;

_plane setVariable ["JEPP_cas_scriptHandles", []];



// reset variables
player setVariable ["JEPP_cas_dialog", "start"];
player setVariable ["JEPP_cas_currentPlane", grpNull];
_plane setVariable ["JEPP_cas_type", 1];

// 9 line
_plane setVariable ["JEPP_cas_ip", 0];
_plane setVariable ["JEPP_cas_hdg", ""];
_plane setVariable ["JEPP_cas_dist", ""];
_plane setVariable ["JEPP_cas_elev", ""];
_plane setVariable ["JEPP_cas_elevUnits", ""];
_plane setVariable ["JEPP_cas_desc", 0];
_plane setVariable ["JEPP_cas_descType", "Land"];
_plane setVariable ["JEPP_cas_loc", ""];
_plane setVariable ["JEPP_cas_locPos", []]; // position from 9-line
_plane setVariable ["JEPP_cas_mark", 0];
_plane setVariable ["JEPP_cas_friendliesDir", 8];
_plane setVariable ["JEPP_cas_friendliesDirText", ""];
_plane setVariable ["JEPP_cas_friendliesDist", ""];
_plane setVariable ["JEPP_cas_egress", 0];
_plane setVariable ["JEPP_cas_egressText", ""];

// remarks
_plane setVariable ["JEPP_cas_ordnance", ""];
_plane setVariable ["JEPP_cas_atkHdg1", ""];
_plane setVariable ["JEPP_cas_atkHdg2", ""];
_plane setVariable ["JEPP_cas_atkHdg", -1];
_plane setVariable ["JEPP_cas_threat", 0];
_plane setVariable ["JEPP_cas_threatDir", 0];
_plane setVariable ["JEPP_cas_threatDirText", ""];
_plane setVariable ["JEPP_cas_threatDist", ""];

// mission variables
_plane setVariable ["JEPP_cas_inbound", false];
_plane setVariable ["JEPP_cas_continue", false];
_plane setVariable ["JEPP_cas_in", false];
_plane setVariable ["JEPP_cas_clearedHot", false];
_plane setVariable ["JEPP_cas_off", false];

_plane setVariable ["JEPP_cas_contactMark", false];
_plane setVariable ["JEPP_cas_lasing", false];
_plane setVariable ["JEPP_cas_sparkle", false];
_plane setVariable ["JEPP_cas_markOnDeck", false];

_plane setVariable ["JEPP_cas_markDir", 0];
_plane setVariable ["JEPP_cas_markDirText", ""];
_plane setVariable ["JEPP_cas_markDist", ""];
_plane setVariable ["JEPP_cas_adjustMark", false];

_plane setVariable ["JEPP_cas_markPos", []];
_plane setVariable ["JEPP_cas_tgtObj", objNull];
_plane setVariable ["JEPP_cas_tallyTarget", false];
_plane setVariable ["JEPP_cas_weaponsReleased", false];

_plane setVariable ["JEPP_cas_bombEH", 0];
_plane setVariable ["JEPP_cas_bomb", false];
_plane setVariable ["JEPP_cas_flares", false];

// return to IP
[_plane, getMarkerPos (selectRandom JEPP_cas_ip)] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_aircraft_init.sqf";