params [
    ["_heli",objNull,[objNull]],
    ["_grid","",[""]]
];

_n = [JEPP_helicopter_groups, _heli] call BIS_fnc_findNestedElement;
_groupId = JEPP_helicopter_groups select (_n select 0) select 0;
_n = _n select 2;
group _heli setGroupId [format ["%1 %2", _groupId, _n + 1]];

if (_grid == "") exitWith {
    _heli sideChat "No grid entered.";
};
_pos = _grid call JEPP_fnc_gridPos;
if (_pos isEqualTo []) exitWith {
    _heli sideChat "Invalid grid.";
};
player setVariable ["JEPP_helicopter_grid", ""];

group driver _heli setBehaviour "CARELESS";

// close doors
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 0, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};

// create pick up waypoint
_radius = 50;
{deleteWaypoint _x;} forEach waypoints group _heli;
_wpLoiter = group _heli addWaypoint [_pos,0];
_wpLoiter setWaypointType "LOITER";
_wpLoiter setWaypointLoiterType "CIRCLE";
_wpLoiter setWaypointLoiterRadius _radius;

waitUntil {!isTouchingGround _heli};

_heli sideChat "Transport en route.";

_smokeDist = 1000; // range when helicopter asks for smoke
waitUntil {(_heli distance2D _pos) < _smokeDist};

// find helicopter ingress direction
_dir = [_pos, _heli] call BIS_fnc_dirTo;
_dirStr = [_dir] call JEPP_fnc_degreeToCardinal;

_heli sideChat format["Approaching from the %1. Mark LZ.", _dirStr];

// define valid mark types
_smokeTypes = ["SmokeShell", "SmokeShellRed", "SmokeShellOrange", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellBlue", "SmokeShellPurple"];
_chemTypes = ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"];
_IRtypes = ["B_IR_Grenade", "I_IR_Grenade", "O_IR_Grenade"];
_rhs_usf_smoke = ["rhs_ammo_an_m8hc", "rhs_ammo_m18_green", "rhs_ammo_m18_purple", "rhs_ammo_m18_red", "rhs_ammo_m18_yellow"];
_rhs_arf_smoke = ["rhs_ammo_rdg2_white", "rhs_ammo_rdg2_black", "rhs_ammo_nspd"];
_rhs_arf_flare = ["rhs_ammo_nspn_yellow", "rhs_ammo_nspn_red", "rhs_ammo_nspn_green"];
_ace_flare = ["ACE_F_Hand_White", "ACE_F_Hand_Red", "ACE_F_Hand_Green", "ACE_F_Hand_Yellow"];
_markTypes = [];

// change the type of mark required depending on night or day
if (sunOrMoon == 1) then {_markTypes = _smokeTypes + _rhs_usf_smoke + _rhs_arf_smoke}; // day
if (sunOrMoon > 0 && sunOrMoon < 1) then {_markTypes = _smokeTypes + _rhs_usf_smoke + _rhs_arf_smoke + _chemTypes + _IRtypes + _rhs_arf_flare + _ace_flare}; // dusk/dawn
if (sunOrMoon == 0) then {_markTypes = _chemTypes + _IRtypes + _rhs_arf_flare + _ace_flare}; // night

// check if player has required mark types in inventory and add if not
_magazines = magazines player;
_intersection = _magazines arrayIntersect _markTypes;
if (_intersection isEqualTo []) then {player addItem (selectRandom _markTypes)};

// find smoke position
_markPos = [player,_markTypes] call JEPP_fnc_impactPos;

// smoke too far
if (_pos distance2D _markPos > _smokeDist) then {
	_heli sideChat "Can't find smoke.";
	
	// check if player has required mark types in inventory and add if not
	_magazines = magazines player;
    _intersection = _magazines arrayIntersect _markTypes;
	if (_intersection isEqualTo []) then {player addItem (selectRandom _markTypes)};

	_markPos = [player,_markTypes] call JEPP_fnc_impactPos;
};

// find a suitable LZ near the smoke pos
_minDist = 0;
_maxDist = 70;
_objDist = 15;
_maxGradient = 0.2;
_gradientRadius = 5;
_waterMode = 0;
_shoreMode = false;
_posBlacklist = [];
_objBlacklist = ["Land_HelipadEmpty_F"];
_LZ = [_markPos, _minDist, _maxDist, _objDist, _maxGradient, _gradientRadius, _waterMode, _shoreMode, _posBlacklist, _objBlacklist] call JEPP_fnc_findFlatEmpty;
while {
    _LZ isEqualTo [];
} do {
	_heli sideChat "No valid LZ. Mark a new LZ.";
	
	// check if player has required mark types in inventory and add if not
	_magazines = magazines player;
    _intersection = _magazines arrayIntersect _markTypes;
	if (_intersection isEqualTo []) then {player addItem (selectRandom _markTypes)};

	_markPos = [player,_markTypes] call JEPP_fnc_impactPos;
	_LZ = [_markPos, _minDist, _maxDist, _objDist, _maxGradient, _gradientRadius, _waterMode, _shoreMode, _posBlacklist, _objBlacklist] call JEPP_fnc_findFlatEmpty;
};

_heli sideChat "Inbound for landing.";

// create pick up waypoint
_helipad = "Land_HelipadEmpty_F" createVehicle _LZ;
{deleteWaypoint _x;} forEach waypoints group _heli;
_wpLand = group _heli addWaypoint [_LZ,0];
_wpLand setWaypointType "MOVE";
_wpLand setWaypointCompletionRadius 100;
_wpLand setWaypointStatements ["true", 'vehicle this land "GET IN";'];

// open doors
waitUntil {getPosATL _heli select 2 < 5};
if (_heli getVariable ["JEPP_helicopter_doors", true]) then {
    [_heli, 1, false, ["DoorL", "DoorR"]] call JEPP_fnc_animateDoors;
};