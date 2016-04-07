_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_tgtObj = _plane getVariable ["JEPP_cas_tgtObj", objNull];
_ordnance = _plane getVariable ["JEPP_cas_ordnance", ""];
_elev = _plane getVariable ["JEPP_cas_elev", ""];
_elevUnits = _plane getVariable ["JEPP_cas_elevUnits", ""];
_elev = [parseNumber _elev, _elevUnits, 0, 0, -1] call BIS_fnc_convertUnits;

waitUntil {
    _plane getVariable ["JEPP_cas_clearedHot", false];
};

sleep 3;

// weapons profile
_profile = [JEPP_cas_ordnance, _ordnance, "NONE"] call BIS_fnc_getFromPairs;

// weapons release
_minDist = 500;
switch _profile do {
    case "AGM": {
        _dist = _plane distance2D _tgtObj;
        if (_dist > _minDist) then {
            _plane sideRadio "rifle";
            // _plane sideRadio "beepRecv";
            
            _plane fireAtTarget [_tgtObj, _ordnance];
            
            _plane setVariable ["JEPP_cas_weaponsReleased", true];
            
            sleep 3;
        } else {
            _plane sideRadio "off";
            // _plane sideRadio "beepRecv";
        };
    };
    case "LGB": {
        _mark = _plane getVariable ["JEPP_cas_mark", 0];
        if (_mark == 2) then {
            _tgtObj = laserTarget player;
            _plane setVariable ["JEPP_cas_tgtObj", _tgtObj];
        };
        if !(_tgtObj isEqualTo objNull) then {
            _dist = _plane distance2D _tgtObj;
            if (_dist > _minDist) then {
                if !(_tgtObj isKindOf "LaserTarget") then {
                    _laser = switch (side _plane) do {
                        case EAST : {
                            "LaserTargetE";
                        };
                        case WEST : {
                            "LaserTargetW";
                        };
                    };
                    _bbr = boundingBoxReal _tgtObj;
                    _h = (_bbr select 1 select 2) - (_bbr select 0 select 2);
                    _laserObj = _laser createVehicle [0,0,0];
                    _laserObj setPosASL ([getPosASL _tgtObj, [0,0,_h]] call JEPP_fnc_shiftPos);
                    _laserObj attachTo [_tgtObj, [0,0,_h]];
                    _tgtObj = _laserObj;
                };
                
                _magazines = magazinesAmmoFull _plane;
                {
                    _mag = _x select 0;
                    _weap = _x select 4;
                    if (_weap != _ordnance) then {
                        _plane removeMagazine _mag;
                    };
                } forEach _magazines;
                
                driver _plane reveal [_tgtObj, 4];
                driver _plane doTarget _tgtObj;
                
                _id = _plane addEventHandler ["Fired", {
                    _plane = _this select 0;
                    _weapon = _this select 1;
                    _id = _plane getVariable ["JEPP_cas_bombEH", 0];
                    _plane removeEventHandler ["Fired", _id];
                    driver _plane doTarget objNull;
                    group _plane setVariable ["JEPP_cas_weaponsReleased", true];
                    _plane sideRadio "bombs";
                    // _plane sideRadio "beepRecv";
                }];
                _plane setVariable ["JEPP_cas_bombEH", _id];
                
                scopeName "main";
                while {!(_plane getVariable ["JEPP_cas_weaponsReleased", false])} do {
                    _dist = _plane distance2D _tgtObj;
                    if (_tgtObj isEqualTo objNull || _dist < _minDist) then {
                        _plane removeEventHandler ["Fired", _id];
                        driver _plane doTarget objNull;
                        _plane sideRadio "off";
                        // _plane sideRadio "beepRecv";
                        breakTo "main";
                    };
                };
                
                {
                    _mag = _x select 0;
                    _weap = _x select 4;
                    _cnt = _x select 1;
                    if (_weap != _ordnance) then {
                        _plane addMagazine [_mag, _cnt];
                    };
                } forEach _magazines;
                
                if !(isNil "_laserObj") then {
                    deleteVehicle _laserObj;
                };
                
                sleep 3;
            } else {
                _plane sideRadio "off";
                // _plane sideRadio "beepRecv";
            };
        } else {
            _plane sideRadio "noJoy";
            // _plane sideRadio "beepRecv";
        };
    };
    case "GUN": {
        _dist = _plane distance2D _tgtObj;
        if (_dist > _minDist) then {
            waitUntil {
                _dist = _plane distance2D _tgtObj;
                _dist/sqrt(3) <= _plane getVariable ["JEPP_cas_altitude", 1000];
            };
            
            _s = [_plane, getPosATL _tgtObj, _elev, _ordnance, 150] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_guns.sqf";
            [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
            
            waitUntil {scriptDone _s};
            _plane setVariable ["JEPP_cas_weaponsReleased", true];
        } else {
            _plane sideRadio "off";
            // _plane sideRadio "beepRecv";
        };
    };
    case "RKT": {
        _dist = _plane distance2D _tgtObj;
        if (_dist > _minDist) then {
            waitUntil {
                _dist = _plane distance2D _tgtObj;
                _dist/sqrt(3) <= _plane getVariable ["JEPP_cas_altitude", 1000];
            };
            
            _s = [_plane, getPosATL _tgtObj, _elev, _ordnance, 150] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_guns.sqf";
            [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
            
            waitUntil {scriptDone _s};
            _plane setVariable ["JEPP_cas_weaponsReleased", true];
        } else {
            _plane sideRadio "off";
            // _plane sideRadio "beepRecv";
        };
    };
};

[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_egress.sqf";