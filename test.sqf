_config = configfile >> "CfgGroups" >> "Empty" >> "Guerrilla" >> "Camps";
_camps = "true" configClasses _config;
_side = if (side player != BLUFOR) then {BLUFOR} else {OPFOR};

player sideChat format [":%1", _side];

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
        player sideChat format [":%1", _camp];
        //[_pos, _side, _camp] call BIS_fnc_spawnGroup;
        _center = "Sign_Sphere200cm_F" createVehicle _pos;
        JEPP_spawn_centers pushBack _center;
        
        _m = createMarker [format["%1", _name], _pos];
        _m setMarkerType "hd_objective";
        _m setMarkerText format ["%1", _name];
        _m setMarkerColor "ColorRed";
        _m setMarkerAlpha 1;
    };
} forEach _camps;

{
    _center = _x;
    _s = [_center, _side] spawn {
        _center = _this select 0;
        _side = _this select 1;
        _units = ["LOP_AM_Infantry_Rifleman"];
        _min = 1;
        _max = 3;
        _maxPatrols = 10;
        _r1 = 1500;
        _r2 = 2000;
        /*
        _t1 = createTrigger ["None", _center];
        _t1 setTriggerArea [_r1, _r1, 0, false, _r1];
        _t1 setTriggerActivation ["ANY", "PRESENT", true];
        _c = str {player in thisList};
        _a = str {player sideChat "in"};
        _d = str {player sideChat "out"};
        _t1 setTriggerStatements [_c, _a, _d];
        */
        /*
        while {alive _center} do {
            _groupsArray = _center getVariable ["JEPP_spawn_groupsArray", []];
            [_groupsArray, [], {{alive _x} count units _x > 0}] call JEPP_fnc_filter;
            if (player distance _center < _r1) then {
                // spawn patrols
                if (count _groupsArray <= _maxPatrols) then {
                    _group = createGroup _side;
                    for "_x" from _min to (_min + round random _max) do {
                        _unit = _group createUnit [selectRandom _units, getPos _center, [], 25, "NONE"];
                    };
                    _groupsArray pushBack _group;
                    _center setVariable ["JEPP_spawn_groupsArray", _groupsArray];
                    [_group, getPos _center, 100 + random 500] call BIS_fnc_taskPatrol;
                };
                sleep 5 * 2^(count _groupsArray);
            } else {
                // delete patrols
                if (player distance _center > _r2) then {
                    {
                        _group = _x;
                        {
                            _unit = _x;
                            if (alive _unit) then {
                                deleteVehicle _x;
                            };
                        } forEach units _group;
                        deleteGroup _group;
                    } forEach _groupsArray;
                };
                // chase
                _group = _center getVariable ["JEPP_spawn_group", grpNull];
                if (isNull _group) then {
                    _group = createGroup _side;
                    for "_x" from _min to (_min + round random _max) do {
                        _unit = _group createUnit [selectRandom _units, getPos _center, [], 25, "NONE"];
                    };
                    _group setCombatMode "RED";
                    _wp = _group addWaypoint [getPos player, 0];
                    _wp setWaypointType "SAD";
                    _center setVariable ["JEPP_spawn_group", _group];
                } else {
                    if ({alive _x} count units _group == 0) then {
                        deleteGroup _group;
                        _center setVariable ["JEPP_spawn_group", grpNull];
                    } else {
                        _group setCombatMode "RED";
                        _wp = _group addWaypoint [getPos player, 0];
                        _wp setWaypointType "SAD";
                    };
                };
                sleep 5;
            };
        };
        player sideChat "destroyed";
        */
    };
    _center setVariable ["JEPP_spawn_script", _s];
} forEach JEPP_spawn_centers;

// to do: tasks
// to do: on destroy, terminate script
// to do: chase player
// to do: test scripts with CUP
// to do: squad select/enemy select dialog