player setVariable ["JEPP_cas_dialog", "hold"];

_desc = lbValue [68001, lbCurSel 68001];
_descText = lbText [68001, lbCurSel 68001];
_descType = lbData [68001, lbCurSel 68001];
_tgtDir = lbValue [68002, lbCurSel 68002];
_tgtDirText = lbText [68002, lbCurSel 68002];
_tgtDist = ctrlText 68003;

closeDialog 6800;
/*
if (_tgtDirText != "") then {
    _tgtDirText = [_tgtDirText, "0123456789"] call BIS_fnc_filterString;
};
*/

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_desc", _desc];
_plane setVariable ["JEPP_cas_descType", _descType];

_msg = "";
if (_tgtDist != "") then {
    _dirMsg = _tgtDirText call JEPP_fnc_cardinalLong;
    _msg = ", " + _dirMsg + ", " + _tgtDist;
};
player sideChat format ["%1%2.", _descText, _msg];
// player sideRadio "beepSend";


_tgtObjOld = _plane getVariable ["JEPP_cas_tgtObj", objNull];
_markPosOld = getPos _tgtObjOld;
if (_tgtObjOld isEqualTo objNull) then {
    _markPosOld = _plane getVariable ["JEPP_cas_locPos", []];
};
_dir = _tgtDirText call JEPP_fnc_cardinaltoDegrees;
_dist = parseNumber _tgtDist;
_markPos = [_markPosOld, [_dist, _dir]] call JEPP_fnc_polarShift;
_plane setVariable ["JEPP_cas_markPos", _markPos];

// tally target
[_plane, _markPos] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_tallyTarget.sqf";