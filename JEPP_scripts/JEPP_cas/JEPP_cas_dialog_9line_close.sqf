_ip = lbValue [62001, lbCurSel 62001];
_hdg = ctrlText 62002;
_dist = ctrlText 62003;
_elev = ctrlText 620041;
_desc = lbValue [62005, lbCurSel 62005];
_loc = ctrlText 62006;
_mark = lbValue [62007, lbCurSel 62007];
_friendliesDir = lbValue [620081, lbCurSel 620081];
_friendliesDist = ctrlText 620082;
_egress = lbValue [62009, lbCurSel 62009];

closeDialog 6200;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_ip", _ip];
_plane setVariable ["JEPP_cas_hdg", _hdg];
_plane setVariable ["JEPP_cas_dist", _dist];
_plane setVariable ["JEPP_cas_elev", _elev];
_plane setVariable ["JEPP_cas_desc", _desc];
_plane setVariable ["JEPP_cas_loc", _loc];
_plane setVariable ["JEPP_cas_mark", _mark];
_plane setVariable ["JEPP_cas_friendliesDir", _friendliesDir];
_plane setVariable ["JEPP_cas_friendliesDist", _friendliesDist];
_plane setVariable ["JEPP_cas_egress", _egress];