// add all available transports to the combo box
{
    _groupId = _x select 0;
    _vehArray = _x select 1;
    if ({canMove _x; alive driver _x} count _vehArray > 0) then {
        _id = lbAdd [41001, _groupId];
        lbSetData [41001, _id, _groupId];
    };
} forEach JEPP_helicopter_groups;

ctrlSetText [41002, player getVariable "JEPP_helicopter_grid"];

// select first transport in combo box as default
lbSetCurSel [41001, 0];