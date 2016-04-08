_config = configfile >> "CfgGroups" >> "Empty" >> "Guerrilla" >> "Camps";
_camps = "true" configClasses _config;
_side = if (side player != BLUFOR) then {BLUFOR} else {OPFOR};

_worldCenter = [worldSize/2, worldSize/2];
_minDist = 0;
_maxDist = worldSize/2;
_objDist = 10;
_maxGradient = 0.5;
_gradRad = 10;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

_r1 = 300;
JEPP_spawn_centers = [];
{
    _camp = _x;
    _name = getText (_camp >> "name");
    _pos = [_worldCenter, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
    if !(_pos isEqualTo []) then {
        //[_pos, _side, _camp] call BIS_fnc_spawnGroup;
        _center = "Sign_Sphere200cm_F" createVehicle _pos;
        _center setVariable ["JEPP_spawn_centerSide", _side];
        JEPP_spawn_centers pushBack _center;
        
        _a1 = '
            _center = thisTrigger getVariable ["JEPP_spawn_center", objNull];
            [_center] execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_spawn.sqf";
        ';
        _d1 = '
            _center = thisTrigger getVariable ["JEPP_spawn_center", objNull];
            {
                terminate _x;
            } forEach [
                _center getVariable ["JEPP_spawn_script", ""]
            ];
            [_center] execVM "JEPP_scripts\JEPP_spawn\JEPP_spawn_despawn.sqf";
        ';
        _t1 = createTrigger ["EmptyDetector", _center];
        _t1 setTriggerArea [_r1, _r1, 0, false, _r1];
        _t1 setTriggerActivation ["ANY", "PRESENT", true];
        _t1 setTriggerStatements ["player in thisList", _a1, _d1];
        _t1 setVariable ["JEPP_spawn_center", _center];
        
        _m = createMarker [format["%1", _name], _pos];
        _m setMarkerType "hd_objective";
        _m setMarkerText format ["%1", _name];
        _m setMarkerColor "ColorRed";
        _m setMarkerAlpha 1;
    };
} forEach _camps;