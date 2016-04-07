/*
	Author: JEPP

	Description:
	Converts a grid coordinate to world position.
    Grid can be any resolution from 1 (10000 meter) to 5 (1 meter).
	
	Parameter(s):
	_this select 0: STRING - Grid code
	_this select 1: NUMBER - Elevation

	Example:
	["123123"] call JEPP_fnc_gridPos;

	Returns:
	ARRAY - Position
*/

params [
    ["_grid","",[""]], // grid coordinate as a string
    ["_posZ",0,[0]],
    "_cnt",
    "_easting",
    "_northing",
    "_posX",
    "_posY"
];

_grid = [_grid, "0123456789"] call BIS_fnc_filterString;
_cnt = count _grid;
if (_cnt%2==0 && _cnt>0 && _cnt <= 10) then {
	_easting = parseNumber ([_grid, 0, (_cnt/2 - 1)] call BIS_fnc_trimString);
	_northing = parseNumber ([_grid, _cnt/2, (_cnt - 1)] call BIS_fnc_trimString);
	_posX = _easting*(10 ^ (5 - _cnt/2)) + 5*(10 ^ (4 - _cnt/2));
	_posY = _northing*(10 ^ (5 - _cnt/2)) + 5*(10 ^ (4 - _cnt/2));
	// [_posX, _posY, getTerrainHeightASL [_posX, _posY]];
	[_posX, _posY, _posZ];
} else {
	["Invalid grid."] call BIS_fnc_error;
	[];
};