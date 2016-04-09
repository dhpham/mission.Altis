_config = configfile >> "CfgGroups" >> "Empty" >> "Guerrilla" >> "Camps";
_camps = "true" configClasses _config;
_side = OPFOR;

_worldCenter = [worldSize/2, worldSize/2];
_minDist = 0;
_maxDist = worldSize/2;
_objDist = 10;
_maxGradient = 0.5;
_gradRad = 10;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

_r1 = 1500;
JEPP_spawn_centers = [];
{
    _camp = _x;
    _name = getText (_camp >> "name");
    _pos = [_worldCenter, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
    if !(_pos isEqualTo []) then {
        [_pos, _side, _camp] call BIS_fnc_spawnGroup;
        _center = "Sign_Sphere200cm_F" createVehicle _pos;
        _center setVariable ["JEPP_spawn_center_side", _side];
        JEPP_spawn_centers pushBack _center;
        
        _a = '
            _center = thisTrigger getVariable ["JEPP_spawn_center", objNull];
            _s = [_center] execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_spawn.sqf";
            _center setVariable ["JEPP_spawn_script", _s];
        ';
        _d = '
            _center = thisTrigger getVariable ["JEPP_spawn_center", objNull];
            terminate (_center getVariable ["JEPP_spawn_script", scriptNull]);
            [_center] execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_despawn.sqf";
        ';
        _t = createTrigger ["EmptyDetector", _center];
        _t setTriggerArea [_r1, _r1, 0, false, _r1];
        _t setTriggerActivation ["ANY", "PRESENT", true];
        _t setTriggerStatements ["player in thisList", _a, _d];
        _t setVariable ["JEPP_spawn_center", _center];
        _center setVariable ["JEPP_spawn_center_trg", _t];
        
        _m = createMarker [format["%1", _name], _pos];
        _m setMarkerType "hd_objective";
        _m setMarkerText format ["%1", _name];
        _m setMarkerColor "ColorRed";
        _m setMarkerAlpha 1;
    };
} forEach _camps;