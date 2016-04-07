/*
	Author: JEPP

	Description:
    Find an area that is flat and empty around a center position.
	
	Parameter(s):
    _this select 0: ARRAY - Center of search area
    _this select 1: NUMBER - Minimum distance from center
    _this select 2: NUMBER - Maximum distance from center
    _this select 3: NUMBER - Minimum object distance
    _this select 4: NUMBER - Maximum terrain gradient
    _this select 4: NUMBER - Gradient radius
    _this select 6: NUMBER - Water mode (Optional, default: 0)
                                0: cannot be in water
                                1: can either be in water or not
                                2: must be in water
    _this select 7: BOOLEAN - Shore mode (Optional, default: false)
                                false: Does not have to be on shore
                                true: Must be on shore
    _this select 8: BOOLEAN - Road mode (Optional, default: true)
                                true: Can be on road
                                false: Cannot be on road
    _this select 9: ARRAY or STRING - Blacklist of positions defined by marker area
    _this select 10: ARRAY - Blacklist of object classnames
    
    Example:
    _LZ = [_markPos, _minDist, _maxDist, _objDist, _maxGradient, _gradientRadius, 0, false, true, [], ["Land_HelipadEmpty_F"]] call JEPP_fnc_findFlatEmpty;

	Returns:
    ARRAY - LZ position. Returns empty array if not found.
*/

params [
    ["_pos",[],[[]]],
    ["_minDist",0,[0]],
    ["_maxDist",0,[0]],
    ["_objDist",0,[0]],
    ["_maxGradient",0,[0]],
    ["_gradientRadius",0,[0]],
    ["_onWater",0,[0]],
    ["_onShore",false,[true]],
    ["_posBlacklist",[],[[], ""]],
    ["_objBlacklist",[],[[]]],
    "_type",
    "_maxIter",
    "_testPos",
    "_isFlat",
    "_inPos"
];

if (_posBlacklist isEqualType "") then {
    _posBlacklist = [_posBlacklist];
};

scopeName "main";
_maxIter = 1000;
for "_x" from 1 to _maxIter do {
    _testPos = [_pos, [_minDist + random (_maxDist - _minDist), random 360]] call JEPP_fnc_polarShift;
    _isFlat = _testPos isFlatEmpty [_objDist, -1, _maxGradient, _gradientRadius, _onWater, _onShore, objNull];
    _inPos = false;
    {
        if (_testPos inArea _x) then {
            _inPos = true;
        };
    } forEach _posBlacklist;
    if !(_isFlat isEqualTo [] || isOnRoad _testPos || _inPos) then {
        _isFlat = true;
        {
            if !(_testPos nearObjects [_x, _objDist] isEqualTo []) then {
                _isFlat = false;
            };
        } forEach _objBlacklist;
        if (_isFlat) then {
            _pos = _testPos;
            breakTo "main";
        };
    };
    if (_x == _maxIter) then {
        _pos = [];
    };
};

_pos;