_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;

// sparkle
_plane sideRadio "sparkle";
// _plane sideRadio "beepRecv";

// sparkle
player setVariable ["JEPP_cas_dialog", "mission"];
waitUntil {
	_plane getVariable ["JEPP_cas_sparkle", false];
};
sleep 3;

// no joy
_locPos = _plane getVariable ["JEPP_cas_locPos", []];
_markPos = aimPos player;
if (!(player isIRLaserOn currentWeapon player) || _locPos distance _markPos > 1000) exitWith {
    _plane sideRadio "noJoy";
	// _plane sideRadio "beepRecv";
	[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactPointer.sqf";
};

// contact mark
_plane setVariable ["JEPP_cas_contactMark", true];
_plane sideRadio "contactSparkle";
// _plane sideRadio "beepRecv";

// set markPos
_plane setVariable ["JEPP_cas_markPos", _markPos];

// tally target
[_plane, _markPos] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_tallyTarget.sqf";