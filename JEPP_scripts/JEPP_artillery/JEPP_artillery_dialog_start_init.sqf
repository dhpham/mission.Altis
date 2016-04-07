player setVariable ["JEPP_artillery_directionStr", ""];
player setVariable ["JEPP_artillery_savedTargetStr", ""]; // probably need to have this here. is rest in ffe init, but what if abort before then?
// add all available batteries to the combo box
{
    _group = _x;
    _gunners = [];
    {
        _gunners pushBackUnique gunner vehicle _x;
    } forEach units _group;
    if ({canFire vehicle _x; alive _x} count _gunners > 0) then {
        _id = lbAdd [31001, groupID _group];
        lbSetValue [31001, _id, _forEachIndex];
    };
} forEach JEPP_artillery_batteries;

ctrlSetText [31002, player getVariable ["JEPP_artillery_grid", ""]];

lbAdd [31003, "Infantry"];
lbAdd [31003, "Vehicle"];
lbAdd [31003, "Armor"];
lbAdd [31003, "Static weapon"];
lbAdd [31003, "Building"];

lbAdd [31004, "in the open"];
lbAdd [31004, "dug in"];

lbSetCurSel [31001, 0];
lbSetCurSel [31003, 0];
lbSetCurSel [31004, 0];