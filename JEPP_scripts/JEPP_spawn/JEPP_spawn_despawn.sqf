_center = _this select 0;
_groups = _center getVariable ["JEPP_spawn_center_groups", []];
[_groups, [], {{alive _x} count (units _x) > 0}, true] call JEPP_fnc_filter;
_groupsArray = [];
{
    _group = _x;
    _unitsArray = [];
    _vehicles = [];
    _units = [units _group, [], {alive _x}] call JEPP_fnc_filter;
    {
        _unit = _x;
        if (_unit == vehicle _unit) then {
            _unitsArray pushBack typeOf _unit;
        } else {
            _vehicle = vehicle _unit;
            _cargo = fullCrew [_vehicle, "cargo"];
            _personTurrets = [fullCrew [_vehicle, "turret"], [], {_x select 4}] call JEPP_fnc_filter;
            _passengers = [_cargo + _personTurrets, [], {_x select 0}] call JEPP_fnc_apply;
            if (_unit in _passengers) then {
                _unitsArray pushBack typeOf _unit;
            } else {
                _vehicles pushBackUnique _vehicle;
            };
        };
        deleteVehicle _unit;
    } forEach _units;
    {
        _vehicle = _x;
        _unitsArray pushback typeOf _vehicle;
        deleteVehicle _vehicle;
    } forEach _vehicles;
    _groupsArray pushBack _unitsArray;
    deleteGroup _group;
    // to do: world position
} forEach _groups;
_center setVariable ["JEPP_spawn_center_groupsArray", _groupsArray];
_center setVariable ["JEPP_spawn_center_groups", []];