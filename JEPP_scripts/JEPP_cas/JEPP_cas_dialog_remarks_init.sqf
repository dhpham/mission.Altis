_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

// ordnance
{
	_magazine = _x select 0;
	_rounds = _x select 1;
	_weapon = _x select 4;
	_name = getText (configfile >> "CfgWeapons" >> _weapon >> "displayName");
	
	_profile = [JEPP_cas_ordnance, _weapon, "NONE"] call BIS_fnc_getFromPairs;
	if (_profile != "NONE") then {
		if (["_HE_", _weapon] call BIS_fnc_inString) then {
			_name = _name + " (HE)";
		};
		if (["_AP_", _weapon] call BIS_fnc_inString) then {
			_name = _name + " (AP)";
		};
		
		// add weapons to combo box
		if (_profile != "AA" && _profile != "CM") then {
			_id = lbAdd [63001, _name];
			lbSetData [63001, _id, _weapon];
		};
	};
} forEach magazinesAmmoFull _plane;
lbSort (findDisplay 6300 displayCtrl 63001);

// final attack heading
ctrlSetText [63002, _plane getVariable ["JEPP_cas_atkHdg1", ""]];
ctrlSetText [63003, _plane getVariable ["JEPP_cas_atkHdg2", ""]];

// air defences
_none = lbAdd [63004, "None"];
lbSetValue [63004, _none, 0];
_aaa = lbAdd [63004, "AAA"];
lbSetValue [63004, _aaa, 1];
_sam = lbAdd [63004, "SAM"];
lbSetValue [63004, _sam, 2];

_N = lbAdd [63005, "N"];
lbSetValue [63005, _N, 0];
_NE = lbAdd [63005, "NE"];
lbSetValue [63005, _NE, 1];
_E = lbAdd [63005, "E"];
lbSetValue [63005, _E, 2];
_SE = lbAdd [63005, "SE"];
lbSetValue [63005, _SE, 3];
_S = lbAdd [63005, "S"];
lbSetValue [63005, _S, 4];
_SW = lbAdd [63005, "SW"];
lbSetValue [63005, _SW, 5];
_W = lbAdd [63005, "W"];
lbSetValue [63005, _W, 6];
_NW = lbAdd [63005, "NW"];
lbSetValue [63005, _NW, 7];

ctrlSetText [63006, _plane getVariable ["JEPP_cas_threatDist", ""]];

// combo box defaults
lbSetCurSel [63001, 0];
lbSetCurSel [63004, _plane getVariable ["JEPP_cas_threat", 0]];
lbSetCurSel [63005, _plane getVariable ["JEPP_cas_threatDir", 0]];