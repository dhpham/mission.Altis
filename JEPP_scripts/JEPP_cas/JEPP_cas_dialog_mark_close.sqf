_markDir = lbValue [67001, lbCurSel 67001];
_markDist = ctrlText 67002;

closeDialog 6700;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_markDir", _markDir];
_plane setVariable ["JEPP_cas_markDist", _markDist];