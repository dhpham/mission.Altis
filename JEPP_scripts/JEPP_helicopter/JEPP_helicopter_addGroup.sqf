_heliArray = _this;
{
	_heliGroup = _x;
    _id = groupId _heliGroup;
    
    _heliVeh = [];
    {
        _heliVeh pushBackUnique vehicle _x;
    } forEach units _heliGroup;
    
    _group = [];
    {
        _heli = _x;
        _group pushBack _heli;
        _base = nearestObjects [_heli, "Helipad_base_F", 10];
        if (_base isEqualTo []) then {
            //_base = "Land_HelipadEmpty_f" createVehicle getPos _heli;
            _base = "Land_HelipadCircle_f" createVehicle getPos _heli;
        } else {
            _base = _base select 0;
        };
        _heli setVariable ["JEPP_helicopter_base", _base];
        _heli allowCrewInImmobile true;
        
        // open doors
        if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
            [_heli, 1, true, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
        };
        
        _g = createGroup side _heli;
        crew _heli join _g;
        _g setBehaviour "CARELESS";
    } forEach _heliVeh;
    
    JEPP_helicopter_groups pushBack [_id, _heliVeh];
    
    // land
    [_id, "RTB"] execVM "JEPP_scripts\JEPP_helicopter\JEPP_helicopter_exec.sqf";
} forEach _heliArray;