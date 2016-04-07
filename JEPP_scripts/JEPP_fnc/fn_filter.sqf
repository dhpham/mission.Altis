/*
	Author: JEPP

	Description:
	Returns a subset of the array that satisfies the condition.
    cf. BIS_fnc_conditionalSelect
	
	Parameter(s):
	_this select 0: ARRAY
    _this select 1: ARRAY - Input parameters. Referenced by _input0, ..., _input9
	_this select 2: CODE (or string)
	_this select 3: BOOLEAN - Modify original (default true)

	Returns:
	ARRAY
*/

params [
    ["_arrayOld",[],[[]]],
    ["_inputParams",[],[[]]],
    ["_filter",{},[{},""]],
    ["_bool",true,[false]],
    "_array",
    "_index"
];
_inputParams params [
    ["_input0", objNull],
    ["_input1", objNull],
    ["_input2", objNull],
    ["_input3", objNull],
    ["_input4", objNull],
    ["_input5", objNull],
    ["_input6", objNull],
    ["_input7", objNull],
    ["_input8", objNull],
    ["_input9", objNull]
];

if (_filter isEqualType "") then {
    _filter = compile _filter;
};

_array = +_arrayOld;
if (_bool) then {
    _array = _arrayOld;
};

_index = 0;
while {_index < count _array} do {
    _x = _array select _index;
    if !(call _filter) then {
        _array deleteAt _index;
    } else {
        _index = _index + 1;
    };
};

_array;