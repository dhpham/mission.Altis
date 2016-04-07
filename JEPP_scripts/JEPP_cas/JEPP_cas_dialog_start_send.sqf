player setVariable ["JEPP_cas_dialog", "hold"];

_index = lbValue [61001, lbCurSel 61001];
_type = lbValue [61002, lbCurSel 61002];
closeDialog 6100;

if (lbSize 61001 == 0) exitWith {
	hint "No aircraft available!";
	player setVariable ["JEPP_cas_dialog", "start"];
};


_plane = JEPP_cas_planes select _index;
player setVariable ["JEPP_cas_currentPlane", _plane];

_plane setVariable ["JEPP_cas_type", _type];


player sideChat format ["%1, this is %2. Type %3 in effect. Advise when ready for 9-line.", groupID group _plane, groupID group player, _type];
// player sideRadio "beepSend";
sleep 3;

_plane sideRadio "readyToCopy";
// _plane sideRadio "beepRecv";

player setVariable ["JEPP_cas_dialog", "9line"];