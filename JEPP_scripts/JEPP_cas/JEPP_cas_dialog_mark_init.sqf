_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

_N = lbAdd [67001, "N"];
lbSetValue [67001, _N, 0];
_NE = lbAdd [67001, "NE"];
lbSetValue [67001, _NE, 1];
_E = lbAdd [67001, "E"];
lbSetValue [67001, _E, 2];
_SE = lbAdd [67001, "SE"];
lbSetValue [67001, _SE, 3];
_S = lbAdd [67001, "S"];
lbSetValue [67001, _S, 4];
_SW = lbAdd [67001, "SW"];
lbSetValue [67001, _SW, 5];
_W = lbAdd [67001, "W"];
lbSetValue [67001, _W, 6];
_NW = lbAdd [67001, "NW"];
lbSetValue [67001, _NW, 7];

lbSetCurSel [67001, _plane getVariable ["JEPP_cas_markDir", 0]];

ctrlSetText [67002, _plane getVariable ["JEPP_cas_markDist", ""]];