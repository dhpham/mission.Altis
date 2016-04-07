/*
	Author: JEPP

	Description:
	Apply the function to each element in the array.
	
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
    ["_function",{},[{},""]],
    ["_bool",true,[false]],
    "_array"
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

if (_function isEqualType "") then {
    _function = compile _function;
};

_array = +_arrayOld;
if (_bool) then {
    _array = _arrayOld;
};

{
    _array set [_forEachIndex, call _function];
} forEach _arrayOld;

_array;