_batteryGroup = player getVariable ["JEPP_artillery_currentBatteryGroup", grpNull];
_ammo = _this select 0;
_leader = vehicle leader _batteryGroup;
_targetPos = _batteryGroup getVariable ["JEPP_artillery_targetPos", []];

// check if in range
if !([_leader, _targetPos] call JEPP_fnc_IDF_inRange) exitWith {
    _leader sideChat "Target out of range.";
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "start"];
};

// calculate firing solution
_idf = [_leader, _targetPos, false] call JEPP_fnc_IDF;
if (_idf isEqualTo []) exitWith {
    _leader sideChat format ["No firing solution."];
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "start"];
};
_tof = _idf select 0;
_dir = _idf select 1;
_angle = _idf select 2;
_weapon = _idf select 3;
_mode = _idf select 4;

_leader sideChat format["Time of flight %1 seconds.", round(_tof)];
// _leader sideRadio "beepRecv";

sleep 3;

player setVariable ["JEPP_artillery_dialog", "hold"];

_id = _leader addEventHandler ["fired",
    {
        _leader = _this select 0;
        _leader setVariable ["JEPP_artillery_shot", true];
    }
];



// shot and splash
_s = [_tof, _leader, _id] spawn {
    _tof = _this select 0;
    _leader = _this select 1;
    _id = _this select 2;
    _weapon = currentWeapon _leader;
    _roundCount = _leader ammo currentWeapon _leader;
    
    waitUntil {
        _leader getVariable ["JEPP_artillery_shot", false];
    };
    _leader setVariable ["JEPP_artillery_shot", false];
    _leader removeEventHandler ["fired", _id];
    _leader sideChat "Shot.";
    // _leader sideRadio "beepRecv";
    _leader setAmmo [_weapon, _roundCount]; // unlimited adjustment rounds
    
    sleep (_tof - 5);
    _leader sideChat "Splash.";
    // _leader sideRadio "beepRecv";
    player setVariable ["JEPP_artillery_dialog", "adjust"];
};
// save script handle for terminate
[_batteryGroup, "JEPP_artillery_scriptHandles", _s] call JEPP_fnc_appendArrayVar;




// load ammo
if (_leader currentMagazineTurret [0] != _ammo) then {
    _leader loadMagazine [[0], _weapon, _ammo];
};

// aim
_leader doWatch ([getPos _leader, [10^10, _dir, _angle]] call JEPP_fnc_polarShift);
waitUntil {
    _weapDir = (_leader weaponDirection _weapon) call JEPP_fnc_cartesianToSpherical select 1;
    _weapDir = _weapDir call JEPP_fnc_formatDegrees;
    _weapAngle = (_leader weaponDirection _weapon) call JEPP_fnc_cartesianToSpherical select 2;
    // player sideChat format ["%1, %2", abs(_weapDir - _dir), abs(_weapAngle - _angle)];
    abs(_weapDir - _dir) < 10 && abs(_weapAngle - _angle) < 10;
};
sleep 3;

// fire
_leader action ["UseWeapon", _leader, gunner _leader, _mode];