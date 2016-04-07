_ordnance = lbData [63001, lbCurSel 63001];
_atkHdg1 = ctrlText 63002;
_atkHdg2 = ctrlText 63003;
_threat = lbValue [63004, lbCurSel 63004];
_threatDir = lbValue [63005, lbCurSel 63005];
_threatDist = ctrlText 63006;

closeDialog 6300;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_ordnance", _ordnance];
_plane setVariable ["JEPP_cas_atkHdg1", _atkHdg1];
_plane setVariable ["JEPP_cas_atkHdg2", _atkHdg2];
_plane setVariable ["JEPP_cas_threat", _threat];
_plane setVariable ["JEPP_cas_threatDir", _threatDir];
_plane setVariable ["JEPP_cas_threatDist", _threatDist];