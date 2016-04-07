player setVariable ["JEPP_cas_dialog", "hold"];

_ip = lbValue [62001, lbCurSel 62001];
_ipText = lbText [62001, lbCurSel 62001];
_hdg = ctrlText 62002;
_dist = ctrlText 62003;
_elev = ctrlText 620041;
_elevUnits = lbValue [620042, lbCurSel 620042];
_desc = lbValue [62005, lbCurSel 62005];
_descText = lbText [62005, lbCurSel 62005];
_descType = lbData [62005, lbCurSel 62005];
_loc = ctrlText 62006;
_mark = lbValue [62007, lbCurSel 62007];
_markText = lbText [62007, lbCurSel 62007];
_friendliesDir = lbValue [620081, lbCurSel 620081];
_friendliesDirText = lbText [620081, lbCurSel 620081];
_friendliesDist = ctrlText 620082;
_egress = lbValue [62009, lbCurSel 62009];
_egressText = lbText [62009, lbCurSel 62009];

closeDialog 6200;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_ip", _ip];
_plane setVariable ["JEPP_cas_hdg", _hdg];
_plane setVariable ["JEPP_cas_dist", _dist];
_plane setVariable ["JEPP_cas_elev", _elev];
_plane setVariable ["JEPP_cas_elevUnits", _elevUnits];
_plane setVariable ["JEPP_cas_desc", _desc];
_plane setVariable ["JEPP_cas_descType", _descType];
_plane setVariable ["JEPP_cas_loc", _loc];
_plane setVariable ["JEPP_cas_mark", _mark];
_plane setVariable ["JEPP_cas_friendliesDir", _friendliesDir];
_plane setVariable ["JEPP_cas_friendliesDirText", _friendliesDirText];
_plane setVariable ["JEPP_cas_friendliesDist", _friendliesDist];
_plane setVariable ["JEPP_cas_egress", _egress];
_plane setVariable ["JEPP_cas_egressText", _egressText];

if (_ip != 0 && _hdg == "") exitWith {
	hint "No heading entered!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (_ip != 0 && _dist == "") exitWith {
	hint "No distance entered!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (_ip == 0 && _hdg == "") then {
	_hdg = "N/A";
};
if (_ip == 0 && _dist == "") then {
	_dist = "N/A";
};
if (_elev == "") exitWith {
	hint "No elevation entered!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (_elev != "") then {
    _elev = [_elev, "0123456789"] call BIS_fnc_filterString;
};
if (_loc == "") exitWith {
	hint "No location entered!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
_elevMeters = [parseNumber _elev, _elevUnits, 0, 0, -1] call BIS_fnc_convertUnits; // convert to meters
_elevFeet = [parseNumber _elev, _elevUnits, 4, 0, -1] call BIS_fnc_convertUnits; // convert to feet
_pos = [_loc, _elevMeters] call JEPP_fnc_gridPos;
_plane setVariable ["JEPP_cas_locPos", _pos];
if (count _pos == 0) exitWith {
	hint "Location must be a valid grid!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (sunOrMoon > 0.75 && (_mark == 3 || _mark == 4)) exitWith {
	hint "Must be night to use IR!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (_friendliesDir != 8 && _friendliesDist == "") exitWith {
	hint "Friendlies' distance not entered!";
	player setVariable ["JEPP_cas_dialog", "9line"];
};
if (_friendliesDir != 8 && _friendliesDist != "") then {
    _friendliesDist = [_friendliesDist, "0123456789"] call BIS_fnc_filterString;
};

_friendliesMsg = "No factor";
if (_friendliesDir != 8) then {
	_friendliesMsg = format ["%1 %2", _friendliesDirText call JEPP_fnc_cardinalLong call JEPP_fnc_capitalize, _friendliesDist];
};
_egressMsg = format ["Egress %1", toLower _egressText];

player sideChat format ["%1. %2. %3. %4. %5. %6. %7. %8. %9. Advise when ready for remarks.", _ipText, _hdg, _dist, round _elevFeet, _descText, _loc, _markText, _friendliesMsg, _egressMsg];
// player sideRadio "beepSend";
sleep 3;

_plane sideRadio "readyRemarks";
// _plane sideChat "beepRecv";

player setVariable ["JEPP_cas_dialog", "remarks"];