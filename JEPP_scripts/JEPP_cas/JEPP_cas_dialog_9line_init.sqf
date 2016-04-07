_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_type = _plane getVariable ["JEPP_cas_type", 1];

switch _type do {
    case 1 : {
        // line 1: IP
        {
            _ip = lbAdd [62001, markerText _x];
            lbSetValue [62001, _ip, _forEachIndex];
        } forEach JEPP_cas_ip;
        
        // line 2: heading
        ctrlSetText [62002, _plane getVariable ["JEPP_cas_hdg",""]];
        
        // line 3: distance
        ctrlSetText [62003, _plane getVariable ["JEPP_cas_dist",""]];
    };
    case 2 : {
        // line 1: IP
        _na = lbAdd [62001, "N/A"];
        lbSetValue [62001, _na, 0];
        
        // line 2: heading
        ctrlSetText [62002, "N/A"];
        
        // line 3: distance
        ctrlSetText [62003, "N/A"];
    };
    case 3 : {
        // line 1: IP
        _na = lbAdd [62001, "N/A"];
        lbSetValue [62001, _na, 0];
        
        // line 2: heading
        ctrlSetText [62002, "N/A"];
        
        // line 3: distance
        ctrlSetText [62003, "N/A"];
    };
};

// line 4: target elevation
ctrlSetText [620041, _plane getVariable ["JEPP_cas_elev",""]];
_ft = lbAdd [620042, "ft"];
lbSetValue [620042, _ft, 4];
_m = lbAdd [620042, "m"];
lbSetValue [620042, _m, 0];
/*
	0: m (meters)
	1: km (kilometers)
	2: ms (meters per second)
	3: kmh (kilometers per hour)
	4: ft (feet)
	5: mi (miles)
	6: fts (feet per second)
	7: mph (miles per hour)
	8: nm (nautical miles)
	9: kts (knots)
*/

// line 5: description
_inf = lbAdd [62005, "Infantry"];
lbSetValue [62005, _inf, 0];
lbSetData [62005, _inf, "Man"];
_car = lbAdd [62005, "Vehicle"];
lbSetValue [62005, _car, 1];
lbSetData [62005, _car, "Car"];
_armor = lbAdd [62005, "Armor"];
lbSetValue [62005, _armor, 2];
lbSetData [62005, _armor, "Tank"];
_static = lbAdd [62005, "Static weapon"];
lbSetValue [62005, _static, 3];
lbSetData [62005, _static, "StaticWeapon"];
_building = lbAdd [62005, "Building"];
lbSetValue [62005, _building, 4];
lbSetData [62005, _building, "NonStrategic"];
_other = lbAdd [62005, "Other"];
lbSetValue [62005, _other, 5];
lbSetData [62005, _other, "AllVehicles"];

// line 6: target location
ctrlSetText [62006, _plane getVariable ["JEPP_cas_loc",""]];

// line 7: mark type
_none = lbAdd [62007, "None"];
lbSetValue [62007, _none, 0];
_smoke = lbAdd [62007, "Smoke"];
lbSetValue [62007, _smoke, 1];
_laser = lbAdd [62007, "Laser"];
lbSetValue [62007, _laser, 2];
_IRpointer = lbAdd [62007, "IR Pointer"];
lbSetValue [62007, _IRpointer, 3];
_IRstrobe = lbAdd [62007, "IR Strobe"];
lbSetValue [62007, _IRstrobe, 4];

//line 8: friendlies direction
_N = lbAdd [620081, "N"];
lbSetValue [620081, _N, 0];
_NE = lbAdd [620081, "NE"];
lbSetValue [620081, _NE, 1];
_E = lbAdd [620081, "E"];
lbSetValue [620081, _E, 2];
_SE = lbAdd [620081, "SE"];
lbSetValue [620081, _SE, 3];
_S = lbAdd [620081, "S"];
lbSetValue [620081, _S, 4];
_SW = lbAdd [620081, "SW"];
lbSetValue [620081, _SW, 5];
_W = lbAdd [620081, "W"];
lbSetValue [620081, _W, 6];
_NW = lbAdd [620081, "NW"];
lbSetValue [620081, _NW, 7];
_none = lbAdd [620081, "None"];
lbSetValue [620081, _none, 8];
ctrlSetText [620082, _plane getVariable ["JEPP_cas_friendliesDist",""]];

// line 9: egress
_N = lbAdd [62009, "North"];
lbSetValue [62009, _N, 0];
_NE = lbAdd [62009, "Northeast"];
lbSetValue [62009, _NE, 1];
_E = lbAdd [62009, "East"];
lbSetValue [62009, _E, 2];
_SE = lbAdd [62009, "Southeast"];
lbSetValue [62009, _SE, 3];
_S = lbAdd [62009, "South"];
lbSetValue [62009, _S, 4];
_SW = lbAdd [62009, "Southwest"];
lbSetValue [62009, _SW, 5];
_W = lbAdd [62009, "West"];
lbSetValue [62009, _W, 6];
_NW = lbAdd [62009, "Northwest"];
lbSetValue [62009, _NW, 7];

// select combo box defaults
lbSetCurSel [62001, _plane getVariable ["JEPP_cas_ip", 0]];
lbSetCurSel [620042, 0];
lbSetCurSel [62005, _plane getVariable ["JEPP_cas_desc", 0]];
lbSetCurSel [62007, _plane getVariable ["JEPP_cas_mark", 0]];
lbSetCurSel [620081, _plane getVariable ["JEPP_cas_friendliesDir", 8]];
lbSetCurSel [62009, _plane getVariable ["JEPP_cas_egress", 0]];