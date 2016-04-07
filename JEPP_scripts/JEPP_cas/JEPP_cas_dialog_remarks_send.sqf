player setVariable ["JEPP_cas_dialog", "hold"];

_ordnance = lbData [63001, lbCurSel 63001];
_atkHdg1 = ctrlText 63002;
_atkHdg2 = ctrlText 63003;
_threat = lbValue [63004, lbCurSel 63004];
_threatText = lbText [63004, lbCurSel 63004];
_threatDir = lbValue [63005, lbCurSel 63005];
_threatDirText = lbText [63005, lbCurSel 63005];
_threatDist = ctrlText 63006;

closeDialog 6300;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_ordnance", _ordnance];
_plane setVariable ["JEPP_cas_atkHdg1", _atkHdg1];
_plane setVariable ["JEPP_cas_atkHdg2", _atkHdg2];
_plane setVariable ["JEPP_cas_threat", _threat];
_plane setVariable ["JEPP_cas_threatDir", _threatDir];
_plane setVariable ["JEPP_cas_threatDirText", _threatDirText];
_plane setVariable ["JEPP_cas_threatDist", _threatDist];

if (_atkHdg1 != "") then {
    _atkHdg1 = [_atkHdg1, "0123456789"] call BIS_fnc_filterString;
};

if (_atkHdg1 != "" && (parseNumber _atkHdg1 > 360 || parseNumber _atkHdg1 < 0)) exitWith {
	hint "Invalid heading!";
	player setVariable ["JEPP_cas_dialog", "remarks"];
};

if (_atkHdg2 != "" && (parseNumber _atkHdg2 > 360 || parseNumber _atkHdg2 < 0)) exitWith {
	hint "Invalid heading!";
	player setVariable ["JEPP_cas_dialog", "remarks"];
};

if (_atkHdg2 != "") then {
    _atkHdg2 = [_atkHdg2, "0123456789"] call BIS_fnc_filterString;
};

if (_threat != 0 && _threatDist != "") then {
    _threatDist = [_threatDist, "0123456789"] call BIS_fnc_filterString;
};



_name = getText (configfile >> "CfgWeapons" >> _ordnance >> "displayName");
_ordnanceMsg = format ["Request %1.", _name];

_atkHdg = -1;
_atkHdgMsg = "";
if (_atkHdg1 != "" && _atkHdg2 == "") then {
	_atkHdg = parseNumber _atkHdg1;
	_atkHdgMsg = format [" Final attack heading %1.", _atkHdg1];
};
if (_atkHdg1 == "" && _atkHdg2 != "") then {
	_atkHdg = parseNumber _atkHdg2;
	_atkHdgMsg = format [" Final attack heading %1.", _atkHdg2];
};
if (_atkHdg1 != "" && _atkHdg2 != "") then {
	_atkHdg = [parseNumber _atkHdg1, parseNumber _atkHdg2] call JEPP_fnc_bisectDegrees;
	_atkHdgMsg = format [" Final attack heading %1-%2.", _atkHdg1, _atkHdg2];
};
_plane setVariable ["JEPP_cas_atkHdg", _atkHdg];

_threatMsg = "";
_threatDistMsg = "";
if (_threatDist != "") then {
	_threatDistMsg = " " + _threatDist;
};
if (_threat != 0) then {
	_threatMsg = format [" %1, %2%3.", _threatText, _threatDirText call JEPP_fnc_cardinalLong, _threatDistMsg];
};

player sideChat format ["%1%2%3", _ordnanceMsg, _atkHdgMsg, _threatMsg];
// player sideRadio "beepSend";
sleep 3;

_elev = _plane getVariable ["JEPP_cas_elev", ""];
_elevUnits = _plane getVariable ["JEPP_cas_elevUnits", ""];
_elevFeet = str round ([parseNumber _elev, _elevUnits, 4, 0, -1] call BIS_fnc_convertUnits); // convert to feet
_grid = _plane getVariable "JEPP_cas_loc";
_plane sideChat format ["%1. %2.%3", _elevFeet, _grid, _atkHdgMsg];

[_plane, _elevFeet] call JEPP_fnc_speak;
sleep 0.5;
[_plane, _grid] call JEPP_fnc_speak;

if (_atkHdgMsg != "") then {
    sleep 0.5;
    _plane sideRadio "finalAtkHdg";
    [_plane, _atkHdg1] call JEPP_fnc_speak;
    sleep 0.5;
    [_plane, _atkHdg2] call JEPP_fnc_speak;
};
// _plane sideRadio "beepRecv";

player setVariable ["JEPP_cas_dialog", "readback"];