/*
	Author: JEPP

	Description:
	Converts a cardinal direction to degrees.
	
	Parameter(s):
	_this select 0: STRING - Cardinal direction

	Returns:
	NUMBER - degrees
*/

params [
    ["_dirStr","",[""]],
    "_dir"
];

_dirStr = toUpper _dirStr;
switch _dirStr do {
    case "N" : {_dir = 0};
    case "NORTH" : {_dir = 0};
    case "NE" : {_dir = 45};
    case "NORTHEAST" : {_dir = 45};
    case "E" : {_dir = 90};
    case "EAST" : {_dir = 90};
    case "SE" : {_dir = 135};
    case "SOUTHEAST" : {_dir = 135};
    case "S" : {_dir = 180};
    case "SOUTH" : {_dir = 180};
    case "SW" : {_dir = 225};
    case "SOUTHWEST" : {_dir = 225};
    case "W" : {_dir = 270};
    case "WEST" : {_dir = 270};
    case "NW" : {_dir = 315};
    case "NORTHWEST" : {_dir = 315};
    default {_dir = 0};
};

_dir;