/*
	Author: JEPP

	Description:
	Appends an element to an array saved as a variable.
	
	Parameter(s):
	_this select 0: OBJECT or GROUP
	_this select 1: STRING - Variable name
	_this select 2: ANY - Element to append

	Returns:
	ARRAY
*/

params [
    ["_unit",objNull,[objNull, grpNull]],
    ["_arrayName","",[""]],
    "_element",
    "_array"
];

_array = _unit getVariable [_arrayName, []];
_array pushBack _element;
_unit setVariable [_arrayName, _array];

_array;