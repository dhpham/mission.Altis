_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_threat = _plane getVariable ["JEPP_cas_threat", 0];

_freq = 5;

if (_threat != 0) then {
    for "_i" from 1 to 15 do {
        _plane fireAtTarget [objNull, "CMFlareLauncher"];
        sleep (1/_freq);
    };
};