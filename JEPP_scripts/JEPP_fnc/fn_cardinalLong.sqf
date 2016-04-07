/*
	Author: JEPP

	Description:
	Converts a cardinal direction to long format.
	
	Parameter(s):
	_this select 0: STRING - Cardinal direction (short)

	Returns:
	STRING - Cardinal direction
*/

params [
    ["_dir","",[""]]
];

_dir = toUpper _dir;
switch _dir do {
    case "N" : {_dir = "north"};
    case "NE" : {_dir = "northeast"};
    case "E" : {_dir = "east"};
    case "SE" : {_dir = "southeast"};
    case "S" : {_dir = "south"};
    case "SW" : {_dir = "southwest"};
    case "W" : {_dir = "west"};
    case "NW" : {_dir = "northwest"};
    default {_dir = ""};
};

_dir;