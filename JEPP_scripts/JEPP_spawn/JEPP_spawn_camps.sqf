_config = configfile >> "CfgGroups" >> "Empty" >> "Guerrilla" >> "Camps";
_camps = "true" configClasses _config;
_side = if (side player != BLUFOR) then {BLUFOR} else {OPFOR};

_worldCenter = [worldSize/2, worldSize/2];
_minDist = 0;
_maxDist = worldSize/2;
_objDist = 10;
_maxGradient = 0.5;
_gradRad = 5;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];

JEPP_spawn_centers = [];
{
    _camp = _x;
    _name = getText (_camp >> "name");
    _pos = [_worldCenter, _minDist, _maxDist, _objDist, _maxGradient, _gradRad, _waterMode, _shoreMode, _posBlacklist] call JEPP_fnc_findFlatEmpty;
    if !(_pos isEqualTo []) then {
        [_pos, _side, _camp] call BIS_fnc_spawnGroup;
        _center = "Sign_Sphere200cm_F" createVehicle _pos;
        JEPP_spawn_centers pushBack _center;
        
        _m = createMarker [format["%1", _name], _pos];
        _m setMarkerType "hd_objective";
        _m setMarkerText format ["%1", _name];
        _m setMarkerColor "ColorRed";
        _m setMarkerAlpha 1;
    };
} forEach _camps;