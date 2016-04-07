/*
	Author: JEPP

	Description:
	Speak the string.
	
	Parameter(s):
	_this select 0: OBJECT - Unit to speak
	_this select 1: STRING
	_this select 2: BOOLEAN - Is number, default false

	Example:
	["123 ABC"] call JEPP_fnc_speak;

	Returns:
	NOTHING
*/

params [
    ["_unit",player,[objNull]],
    ["_str","",[""]],
    ["_isNumber",false,[true]],
    "_numbers",
    "_letters",
    "_cnt",
    "_num",
    "_decimal"
];

if (_str == "") exitWith {
    ["I have nothing to say."] call BIS_fnc_error;
};

_numbers = ["0","1","2","3","4","5","6","7","8","9"];
_letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

if (_isNumber) then {
    _str = [_str, "0123456789."] call BIS_fnc_filterString;
    _num = parseNumber _str;
    if (_num >= 1000000) exitWith {
        ["I can't count that high!"] call BIS_fnc_error;
    };
    
    _num = _str;
    _str = _num splitString "." select 0 splitString "";
    _cnt = count _str;
    
    for "_x" from 0 to (_cnt - 1) do {
        switch (10^(_cnt - _x - 1)) do {
            case 1 : {
                if (_cnt > 1) then {
                    if (_str select _x != "0") then {
                        if (_str select (_x - 1) == "1") then {
                            _str set [_x, "continue1" + (_str select _x)];
                        } else {
                            _str set [_x, "continue" + (_str select _x)];
                        };
                    } else {
                        if (_str select (_x - 1) == "1") then {
                            _str set [_x, "continue1" + (_str select _x)];
                        };
                    };
                } else {
                    if (_str select _x != "0") then {
                        _str set [_x, "continue" + (_str select _x)];
                    };
                };
            };
            case 10 : {
                if (_str select _x != "0" && _str select _x != "1") then {
                    _str set [_x, "continue" + (_str select _x) + "0"];
                };
            };
            case 100 : {
                if (_str select _x != "0") then {
                    _str set [_x, "continue" + (_str select _x) + "00"];
                };
            };
            case 1000 : {
                if (_cnt > 4) then {
                    if (_str select _x != "0") then {
                        if (_str select (_x - 1) == "1") then {
                            _str set [_x, "continue1" + (_str select _x)];
                        } else {
                            _str set [_x, "continue" + (_str select _x)];
                        };
                    } else {
                        if (_str select (_x - 1) == "1") then {
                            _str set [_x, "continue1" + (_str select _x)];
                        };
                    };
                } else {
                    if (_str select _x != "0") then {
                        _str set [_x, "continue" + (_str select _x) + "000"];
                    };
                };
            };
            case 10000 : {
                if (_str select _x != "0" && _str select _x != "1") then {
                    _str set [_x, "continue" + (_str select _x) + "0"];
                };
            };
            case 100000 : {
                if (_str select _x != "0") then {
                    _str set [_x, "continue" + (_str select _x) + "00"];
                };
            };
        };
    };
    
    if (_cnt > 4) then {
        _str = [_str, ["continue1000s"], _cnt - 3] call BIS_fnc_arrayInsert;
    };
    [_str, [], {_x != "0" && _x != "1"}] call JEPP_fnc_filter;
    
    if (parseNumber _num % 1 != 0) then {
        _decimal = _num splitString "." select 1 splitString "";
        
        _str pushBack "point";
        {
            _str pushBack "continue" + _x;
        } forEach _decimal;
    };
    
    _cnt = count _str;
    _str set [0, "begin" + ([_str select 0, "0123456789s"] call BIS_fnc_filterString)];
    _str set [_cnt - 1, "end" + ([_str select (_cnt - 1), "0123456789s"] call BIS_fnc_filterString)];
    
    {
        _unit sideRadio _x;
    } forEach _str;
} else {
    _str = toUpper _str splitString "";
    _cnt = count _str;
    {
        if (_x == " ") then {
            _unit sideRadio "silence";
        };
        if (_x == ".") then {
            _unit sideRadio "point";
        };
        if (_x == "+") then {
            _unit sideRadio "plus";
        };
        if (_x in _numbers) then {
            switch (_forEachIndex) do {
                case 0 : {
                    _unit sideRadio ("begin" + _x);
                };
                case (_cnt - 1) : {
                    _unit sideRadio ("end" + _x);
                };
                default {
                    _unit sideRadio ("continue" + _x);
                };
            };
        };
        if (_x in _letters) then {
            switch (_forEachIndex) do {
                case 0 : {
                    _unit sideRadio ("begin" + _x);
                };
                case (_cnt - 1) : {
                    _unit sideRadio ("continue" + _x);
                };
                default {
                    _unit sideRadio ("continue" + _x);
                };
            };
        };
    } forEach _str;
};