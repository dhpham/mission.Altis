_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_threat = _plane getVariable ["JEPP_cas_threat", 0];

_freq = 0;
switch _threat do {
    case 1: { // AAA
        _freq = 0.5;
    };
    case 2: { // SAM
        _freq = 1;
    };
};

if (_freq != 0) then {
    while {_plane getVariable ["JEPP_cas_flares", false]} do {
        _plane fireAtTarget [objNull, "CMFlareLauncher"];
        sleep (1/_freq);
    };
};