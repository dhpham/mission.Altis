// Arma 3/Curator/Addons/modules_f_curator/CAS/Functions/fn_moduleCAS.sqf

_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_tgtPos = [_this,1,[],[[]]] call BIS_fnc_param;
_elev = [_this,2,0,[0]] call BIS_fnc_param;
_tgtPos set [2, (_tgtPos select 2) + _elev];
_weapon = [_this,3,"",[""]] call BIS_fnc_param;
_speed = [_this,4,[speed _plane, 3, 2] call BIS_fnc_convertUnits,[0]] call BIS_fnc_param;

_profile = [JEPP_cas_ordnance, _weapon, "NONE"] call BIS_fnc_getFromPairs;
_dir = [_plane, _tgtPos] call BIS_fnc_dirTo;
_offset1 = if (_profile == "GUN") then {25} else {45};
_offset2 = 45;
_tgtPos = [_tgtPos, [_offset1, _dir]] call JEPP_fnc_polarShift;


    
// transition
_duration = 1;

_planePos1 = getPosASL _plane;
_vectorDir1 = vectorDir _plane;
_vectorUp1 = vectorUp _plane;
// _velocity1 = [_vectorDir1, [speed _plane, 3, 2] call BIS_fnc_convertUnits] call bis_fnc_vectorMultiply;
_velocity1 = velocity _plane;

_vectorDir2 = [_planePos1, _tgtPos] call bis_fnc_vectorFromXtoY;
_v = _vectorDir2 call JEPP_fnc_cartesianToSpherical;
_shift = [_duration * (_speed + ([speed _plane, 3, 2] call BIS_fnc_convertUnits)) / 2, _v select 1, _v select 2];
_planePos2 = [_planePos1, _shift] call JEPP_fnc_polarShift;
if (_v select 2 > 0) then {
    _v set [1, _v select 1 - 180];
    _v set [2, 90 - (_v select 2)];
} else {
    _v set [2, 90 + (_v select 2)];
};
_vectorUp2 = _v call JEPP_fnc_sphericalToCartesian;
_velocity2 = [_vectorDir2, _speed] call bis_fnc_vectorMultiply;

_time = time;
waitUntil {
    _plane setVelocityTransformation [
        _planePos1, _planePos2,
        _velocity1, _velocity2,
        _vectorDir1, _vectorDir2,
        _vectorUp1, _vectorUp2,
        (time - _time) / _duration
    ];
    _plane setVelocity velocity _plane;
    time > _time + _duration;
};



_planePos = getPosASL _plane;
_vectorDir = [_planePos, _tgtPos] call bis_fnc_vectorFromXtoY;
_velocity = [_vectorDir, _speed] call bis_fnc_vectorMultiply;
_vectorUp = vectorUp _plane;

_alt = _planePos select 2;
_dis = _plane distance2D _tgtPos;
_duration = ([0, 0] distance [_dis, _alt]) / _speed;

//--- Approach
_fire = [] spawn {waitUntil {false}};
[_plane, "JEPP_cas_scriptHandles", _fire] call JEPP_fnc_appendArrayVar;
_fireNull = true;
_time = time;
waitUntil {
    _fireProgress = _plane getVariable ["fireProgress",0];
    
    //--- Set the plane approach vector
    _plane setVelocityTransformation [
        _planePos, [_tgtPos select 0, _tgtPos select 1, (_tgtPos select 2) - _fireProgress^2 * _offset2],
        _velocity, _velocity,
        _vectorDir, _vectorDir,
        _vectorUp, _vectorUp,
        (time - _time) / _duration
    ];
    _plane setVelocity velocity _plane;

    //--- Fire!
    if ((getPosASL _plane) distance _tgtPos < 2000 && _fireNull) then {
        _fireNull = false;
        
        if (_profile == "GUN") then {
            _plane sideRadio "guns";
            // _plane sideRadio "beepRecv";
        } else {
            _plane sideRadio "rockets";
            // _plane sideRadio "beepRecv";
        };
        sleep 0.1;
        
        terminate _fire;
        _fire = [_plane, _weapon, _tgtPos] spawn {
            _plane = _this select 0;
            _weapon = _this select 1;
            _tgtPos = _this select 2;
            /*
            _modes = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
            _mode = _modes select count _modes - 1;
            */
            
			_duration = 3;
			_time = time + _duration;
            waitUntil {
                //_plane forceWeaponFire [_weapon, _mode];
                _plane fireAtTarget [objNull, _weapon];
                _plane setVariable ["fireProgress",(1 - ((_time - time) / _duration)) max 0 min 1];
                sleep 0.1;
                time > _time || (getPosASL _plane) distance _tgtPos < 500 || getPosATL _plane select 2 < 250;
            };
            sleep 1;
        };
        [_plane, "JEPP_cas_scriptHandles", _fire] call JEPP_fnc_appendArrayVar;
    };

    sleep 0.01;
    scriptDone _fire;
};