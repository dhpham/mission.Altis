closeDialog 6500;
_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

[_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_reset.sqf";

_time = [daytime, "ARRAY"] call BIS_fnc_timeToString;
_hh = _time select 0;
_mm = _time select 1;
_plane sideChat format ["Attack complete at time %1:%2.", _hh, _mm];
_plane sideRadio "complete";
[_plane, _hh, true] call JEPP_fnc_speak;
[_plane, _mm, true] call JEPP_fnc_speak;
// _plane sideRadio "beepRecv";