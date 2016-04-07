_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;

// laser on
_plane sideRadio "laserOn";
// _plane sideRadio "beepRecv";

// lasing
player setVariable ["JEPP_cas_dialog", "mission"];
waitUntil {
	_plane getVariable ["JEPP_cas_lasing", false];
};
sleep 3;

_laserObj = laserTarget player;
_markPos = getPos _laserObj;

// negative laser
_locPos = _plane getVariable ["JEPP_cas_locPos", []];
if (_laserObj isEqualTo objNull || _locPos distance _markPos > 1000) exitWith {
	// _plane sideChat format ["Negative laser."];
    _plane sideRadio "noJoy";
	// _plane sideRadio "beepRecv";
	[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactLaser.sqf";
};

// spot
_plane setVariable ["JEPP_cas_contactMark", true];
_plane sideRadio "spot";
// _plane sideRadio "beepRecv";

// set markPos
_plane setVariable ["JEPP_cas_markPos", _markPos];

// tally target
_ordnance = _plane getVariable ["JEPP_cas_ordnance", ""];
_profile = [JEPP_cas_ordnance, _ordnance, "NONE"] call BIS_fnc_getFromPairs;
if (_profile != "LGB") then {
    [_plane, _markPos] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_tallyTarget.sqf";
} else {
    _plane setVariable ["JEPP_cas_tgtObj", _laserObj];
    _plane setVariable ["JEPP_cas_tallyTarget", true];
};