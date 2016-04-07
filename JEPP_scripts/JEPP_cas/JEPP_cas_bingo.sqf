_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;

// bingo
_s = [_plane] spawn {
    _plane = _this select 0;
    while {alive _plane} do {
        if (fuel _plane < 0.2) then {
            _plane sideRadio "bingo";
            // _plane sideRadio "beepRecv";
            _plane execVM "JEPP_scripts\JEPP_cas\JEPP_cas_rtb.sqf";
        };
        sleep 5;
    };
};