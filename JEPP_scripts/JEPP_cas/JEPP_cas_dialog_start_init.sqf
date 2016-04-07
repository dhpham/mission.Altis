// add all available aircraft to the combo box
{
    _plane = _x;
	_onStation = _plane getVariable ["JEPP_cas_onStation", false];
	if (alive _plane && canMove _plane && _onStation) then {
		_id = lbAdd [61001, groupID group _plane];
		lbSetValue [61001, _id, _forEachIndex];
	};
} forEach JEPP_cas_planes;
lbSort (findDisplay 6100 displayCtrl 61001);

_type1 = lbAdd [61002, "Type 1"];
lbSetValue [61002, _type1, 1];
_type2 = lbAdd [61002, "Type 2"];
lbSetValue [61002, _type2, 2];
_type3 = lbAdd [61002, "Type 3"];
lbSetValue [61002, _type3, 3];

// select first in combo box as default
lbSetCurSel [61001, 0];
lbSetCurSel [61002, 1];