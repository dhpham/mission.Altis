player setVariable ["JEPP_cas_dialog", "hold"];

_markDir = lbValue [67001, lbCurSel 67001];
_markDirText = lbText [67001, lbCurSel 67001];
_markDist = ctrlText 67002;

closeDialog 6700;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_markDir", _markDir];
_plane setVariable ["JEPP_cas_markDirText", _markDirText];
_markDist = [_markDist, "0123456789"] call BIS_fnc_filterString;
_plane setVariable ["JEPP_cas_markDist", _markDist];

if (_markDist == "") exitWith {
	hint "No distance entered!";
	player setVariable ["JEPP_cas_dialog", "mark"];
};

player sideChat format ["From the mark, %1 %2.", _markDirText, _markDist];
// player sideRadio "beepSend";

_plane setVariable ["JEPP_cas_adjustMark", true];