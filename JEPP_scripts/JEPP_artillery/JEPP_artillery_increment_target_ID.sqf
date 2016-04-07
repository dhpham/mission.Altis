_number = parseNumber ([JEPP_artillery_targetID, count JEPP_artillery_targetID_code] call BIS_fnc_trimString);
_numberStr = "";
if (_number < parseNumber JEPP_artillery_targetID_max) then {
    _numberStr = str(_number + 1);
    // add leading zeros
    for "_x" from 1 to (4 - (count _numberStr)) do {
        _numberStr = "0" + _numberStr;
    };
} else {
    _numberStr = JEPP_artillery_targetID_min;
};
JEPP_artillery_targetID = JEPP_artillery_targetID_code + _numberStr;

// check if target ID already exists and increment again if so
// to be filled in later