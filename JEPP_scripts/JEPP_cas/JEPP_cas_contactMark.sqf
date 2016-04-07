_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_markTypes = [_this,1,[],[[]]] call BIS_fnc_param;

// mark target
_plane sideChat format ["Mark the target."];
_plane sideRadio "target";
// leader _group sideRadio "beepRecv";

_markPos = [];
_markPos = [player, _markTypes] call JEPP_fnc_impactPos;

// mark is on the deck
player setVariable ["JEPP_cas_dialog", "mission"];
waitUntil {
	_plane getVariable ["JEPP_cas_markOnDeck", false];
};
sleep 3;

// no joy
_locPos = _plane getVariable ["JEPP_cas_locPos", []];
if (_markPos isEqualTo [] || _locPos distance _markPos > 2500) exitWith {
    _plane sideRadio "noJoy";
	// _plane sideRadio "beepRecv";
	[_plane, _markTypes] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_contactMark.sqf";
};

// contact mark
_plane setVariable ["JEPP_cas_contactMark", true];
_plane sideRadio "contact";
// _plane sideRadio "beepRecv";

// from the mark
player setVariable ["JEPP_cas_dialog", "mark"];

waitUntil {
	_plane getVariable ["JEPP_cas_adjustMark", false];
};

// set markPos
_markDirText = _plane getVariable ["JEPP_cas_markDirText", ""];
_markDist = _plane getVariable ["JEPP_cas_markDist", ""];
_dir = _markDirText call JEPP_fnc_cardinaltoDegrees;
_dist = parseNumber _markDist;
_markPos = [_markPos, [_dist, _dir]] call JEPP_fnc_polarShift;
_plane setVariable ["JEPP_cas_markPos", _markPos];

// tally target
[_plane, _markPos] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_tallyTarget.sqf";