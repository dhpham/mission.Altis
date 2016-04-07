_desc = lbValue [68001, lbCurSel 68001];
_tgtDir = lbValue [68002, lbCurSel 68002];
_tgtDist = ctrlText 68003;

closeDialog 6800;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_desc", _desc];