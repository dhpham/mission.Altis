_index = [_this,0,0,[0]] call BIS_fnc_param;
_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_batteryArray = player getVariable ["JEPP_artillery_currentBatteryArray", []];
_ammoArray = _batteryGroup getVariable ["JEPP_artillery_ammo", []];
_ammo = _ammoArray select _index select 0; // magazine classname
_maxRoundsTotal = _ammoArray select _index select 1; // total rounds available per battery
_gunCount = count _batteryArray;
_maxRoundsPerGun = _maxRoundsTotal / _gunCount;
_rounds = [_this,1,0,[0]] call BIS_fnc_param; // rounds requested
_displayName = getText (configfile >> "CfgMagazines" >> _ammo >> "displayNameShort");
_leader = vehicle leader _batteryGroup;
_reloadTime = getNumber (configfile >> "CfgWeapons" >> currentWeapon _leader >> "reloadTime");
_targetPos = _batteryGroup getVariable ["JEPP_artillery_targetPos", []];

// check if in range
if !([_leader, _targetPos] call JEPP_fnc_IDF_inRange) exitWith {
    _leader sideChat "Target out of range.";
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "start"];
};

// check for pluralization
_s = "s";
if (_rounds == 1) then {_s = "";};
// send message
_adjustMessageFFE = player getVariable ["JEPP_artillery_adjustMessageFFE", ""];
player sideChat format["%1%2 round%3 %4. Fire for effect.", _adjustMessageFFE, _rounds, _s, _displayName];
// player sideRadio "beepSend";
player setVariable ["JEPP_artillery_adjustMessageFFE", ""]; // reset message

sleep 3;

// check if each gun has enough ammo
if (_rounds > _maxRoundsPerGun) then {_rounds = _maxRoundsPerGun};

// calculate time of flight
_tof = [];
scopeName "main";
{
    _idf = [_x, _targetPos, false] call JEPP_fnc_IDF;
    if (_idf isEqualTo []) then {
        _tof = [];
        breakTo "main";
    } else {
        _tof pushBack (_idf select 0);
    };
} forEach _batteryArray;
if (_tof isEqualTo []) exitWith {
    _leader sideChat "Unable to comply.";
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "start"];
};
_tof = [_tof, 0] call BIS_fnc_findExtreme;

_displayName = getText (configfile >> "CfgMagazines" >> _ammo >> "displayNameShort");
_leader sideChat format["%1 rounds %2, fire for effect. Time of flight %3 seconds.", _rounds, _displayName, round(_tof)];
// _leader sideRadio "beepRecv";

sleep 3;

{
    _id = _x addEventHandler ["fired",
        {
            _gun = _this select 0;
            _gun setVariable ["JEPP_artillery_shot", true];
            _shots = _gun getVariable ["JEPP_artillery_shots", 0];
            _shots = _shots + 1;
            _gun setVariable ["JEPP_artillery_shots", _shots];
        }
    ];
    _x setVariable ["JEPP_artillery_firedEH_id", _id];
} forEach _batteryArray;




// shot and splash
_s = [_tof, _leader, _batteryArray] spawn {
    _tof = _this select 0;
    _leader = _this select 1;
    _batteryArray = _this select 2;
    
    _shot = false;
    waitUntil {
        {
            if (_x getVariable ["JEPP_artillery_shot", false]) then {
                _shot = true
            };
        } forEach _batteryArray;
        _shot;
    };
    _leader sideChat "Shot.";
    // _leader sideRadio "beepRecv";
    
    sleep (_tof - 5);
    _leader sideChat "Splash.";
    // _leader sideRadio "beepRecv";
};
// save script handle for terminate
[_batteryGroup, "JEPP_artillery_scriptHandles", _s] call JEPP_fnc_appendArrayVar;



// rounds complete
_s = [_rounds, _leader, _gunCount, _batteryArray] spawn {
    _rounds = _this select 0;
    _leader = _this select 1;
    _gunCount = _this select 2;
    _batteryArray = _this select 3;
    
    waitUntil {
        _complete = true;
        {
            if !(_x getVariable ["JEPP_artillery_complete", false]) then {
                _complete = false;
            };
        } forEach _batteryArray;
        _complete;
    };
    {
        _x setVariable ["JEPP_artillery_shot", false];
        _x setVariable ["JEPP_artillery_complete", false];
        _id = _x getVariable ["JEPP_artillery_firedEH_id", 0];
        _x removeEventHandler ["fired", _id];
    } forEach _batteryArray;
    _leader sideChat format["Rounds complete."];
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "end"];
};
// save script handle for terminate
[_batteryGroup, "JEPP_artillery_scriptHandles", _s] call JEPP_fnc_appendArrayVar;



// execute fire mission
{
    _idf = [_x, _targetPos, false] call JEPP_fnc_IDF;
    _s = [_x, _idf, _rounds, _ammo] spawn {
        _gun = _this select 0;
        _idf = _this select 1;
        _rounds = _this select 2;
        _ammo = _idf select 3;
        
        _dir = _idf select 1;
        _angle = _idf select 2;
        _weapon = _idf select 3;
        _mode = _idf select 4;
        
        // load ammo
        if (_gun currentMagazineTurret [0] != _ammo) then {
            _gun loadMagazine [[0], _weapon, _ammo]
        };
        
        // aim
        _gun doWatch ([getPos _gun, [10^10, _dir, _angle]] call JEPP_fnc_polarShift);
        waitUntil {
            _weapDir = (_gun weaponDirection _weapon) call JEPP_fnc_cartesianToSpherical select 1;
            _weapDir = _weapDir call JEPP_fnc_formatDegrees;
            _weapAngle = (_gun weaponDirection _weapon) call JEPP_fnc_cartesianToSpherical select 2;
            abs(_weapDir - _dir) < 10 && abs(_weapAngle - _angle) < 10;
        };
        sleep 3;
        
        // fire
        /*
        while {
            _shots = _gun getVariable ["JEPP_artillery_shots", 0];
            _shots < _rounds
        } do {
            _gun action ["UseWeapon", _gun, gunner _gun, _mode];
            waitUntil {
                _gun getVariable ["JEPP_artillery_shot", false];
            };
            _gun setVariable ["JEPP_artillery_shot", false];
        };
        _gun setVariable ["JEPP_artillery_complete", true];
        */
        
        waitUntil {
            _gun action ["UseWeapon", _gun, gunner _gun, _mode];
            _shots = _gun getVariable ["JEPP_artillery_shots", 0];
            _shots == _rounds;
        };
        
        _gun setVariable ["JEPP_artillery_complete", true];
    };
    // save script handle for terminate
    [_batteryGroup, "JEPP_artillery_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
} forEach _batteryArray;