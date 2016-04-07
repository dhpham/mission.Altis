/*
    Author: JEPP

    Description:
    Returns the grid position.
    cf. mapGridPosition
    
    Parameter(s):
    _this select 0: ARRAY - Cartesian position
    _this select 1: NUMBER - Resolution (1 to 5)

    Example:
    [getPos target] call JEPP_fnc_mapGridPosition;

    Returns:
    STRING
*/

params [
    ["_pos",[0,0,0],[[], objNull],[2,3]],
    ["_res",5,[0]],
    "_easting",
    "_northing",
    "_n"
];

if (_pos isEqualType objNull) then {
    _pos = getPos _pos;
};
if !(_res >= 1 && _res <= 5) exitWith {
    ["Resolution must be between 1 and 5"] call BIS_fnc_error;
    "";
};

_easting = str round (_pos select 0);
_northing = str round (_pos select 1);

_easting = [_easting, 5] call JEPP_fnc_leadingZeros;
_northing = [_northing, 5] call JEPP_fnc_leadingZeros;

// _easting = ([mapGridPosition _pos, 0, 2] call BIS_fnc_trimString) + str (round (_pos select 0) % 100);
// _northing = ([mapGridPosition _pos, 3] call BIS_fnc_trimString) + str (round (_pos select 1) % 100);

_easting = [_easting, 0, _res - 1] call BIS_fnc_trimString;
_northing = [_northing, 0, _res - 1] call BIS_fnc_trimString;

_easting + _northing;