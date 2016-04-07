_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_ammoIndex = [_this,0,0,[0]] call BIS_fnc_param; // magazine classname
_batteryGroup setVariable ["JEPP_artillery_adjustAmmoIndex", _ammoIndex];
_ammoArray = _batteryGroup getVariable ["JEPP_artillery_ammo", []];
_ammo = _ammoArray select _ammoIndex select 0;
_directionStr = [_this,1,"",[""]] call BIS_fnc_param;
_directionUnits = [_this,2,"",[""]] call BIS_fnc_param;
_deviation = [_this,3,0,[0]] call BIS_fnc_param;
_range = [_this,4,0,[0]] call BIS_fnc_param;



// convert direction to mils
switch _directionUnits do {
    case "mils" : {
        _directionStr = _directionStr;
    };
    case "deg" : {
        _directionStr = str (round(parseNumber(_directionStr) * (6400/360)));
    };
};

// format direction
_direction = (parseNumber _directionStr) % 6400;
if (_direction < 0) then {_direction = 6400 + _direction};
_directionStr = [str(_direction), 4] call JEPP_fnc_leadingZeros;

// check for changed direction
_directionStrOld = player getVariable ["JEPP_artillery_directionStr", ""];
_directionChanged = false;
if (_directionStr != _directionStrOld) then {
    player setVariable ["JEPP_artillery_directionStr", _directionStr];
    _directionChanged = true;
};



// format radio message
_message = "";

_dirMsg = "";
if (_directionChanged) then {
    _dirMsg = format["Direction %1. ", [parseNumber _directionStr, 10] call JEPP_fnc_roundNum];
};

_roundTypeMsg = "";
if (false) then {_roundTypeMsg = format["%1.",_ammo]};

_devMsg = "";
if (_deviation > 0) then {_devMsg = format["Right %1. ", abs _deviation]};
if (_deviation < 0) then {_devMsg = format["Left %1. ", abs _deviation]};

_rangeMsg = "";
if (_range > 0) then {_rangeMsg = format["Add %1. ", abs _range]};
if (_range < 0) then {_rangeMsg = format["Drop %1. ", abs _range]};

_message = _dirMsg + _roundTypeMsg + _devMsg + _rangeMsg;



// update target position
_targetPosOld = _batteryGroup getVariable ["JEPP_artillery_targetPos", []];
_OTdir = parseNumber _directionStr; // direction from the observer to target
_targetPos = [_targetPosOld, _OTdir, _deviation, _range] call JEPP_fnc_adjustPos;

// update target
_batteryGroup setVariable ["JEPP_artillery_targetPos", _targetPos];



// execute mission
_missionType = player getVariable ["JEPP_artillery_dialog", "start"];
switch _missionType do {
    case "adjust" : {
        if (_message == "") then {_message = "Repeat."} else {_message = [_message,0,-1] call BIS_fnc_trimString};
        player sideChat _message;
        // player sideRadio "beepSend";
        [_ammo] execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_fire_spotting.sqf";
    };
    case "FFE" : {
        player setVariable ["JEPP_artillery_adjustMessageFFE", _message];
        execVM "JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf";
    };
};