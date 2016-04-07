_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

// target type
_inf = lbAdd [68001, "Infantry"];
lbSetValue [68001, _inf, 0];
lbSetData [68001, _inf, "Man"];
_car = lbAdd [68001, "Vehicle"];
lbSetValue [68001, _car, 1];
lbSetData [68001, _car, "Car"];
_armor = lbAdd [68001, "Armor"];
lbSetValue [68001, _armor, 2];
lbSetData [68001, _armor, "Tank"];
_static = lbAdd [68001, "Static weapon"];
lbSetValue [68001, _static, 3];
lbSetData [68001, _static, "StaticWeapon"];
_building = lbAdd [68001, "Building"];
lbSetValue [68001, _building, 4];
lbSetData [68001, _building, "NonStrategic"];
_other = lbAdd [68001, "Other"];
lbSetValue [68001, _other, 5];
lbSetData [68001, _other, "Land"];

// direction
_N = lbAdd [68002, "N"];
lbSetValue [68002, _N, 0];
_NE = lbAdd [68002, "NE"];
lbSetValue [68002, _NE, 1];
_E = lbAdd [68002, "E"];
lbSetValue [68002, _E, 2];
_SE = lbAdd [68002, "SE"];
lbSetValue [68002, _SE, 3];
_S = lbAdd [68002, "S"];
lbSetValue [68002, _S, 4];
_SW = lbAdd [68002, "SW"];
lbSetValue [68002, _SW, 5];
_W = lbAdd [68002, "W"];
lbSetValue [68002, _W, 6];
_NW = lbAdd [68002, "NW"];
lbSetValue [68002, _NW, 7];

lbSetCurSel [68001, _plane getVariable ["JEPP_cas_desc", 0]];
lbSetCurSel [68002, 0];
ctrlSetText [68003, ""];