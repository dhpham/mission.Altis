player setVariable ["JEPP_cas_dialog", "hold"];

closeDialog 6800;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_tgtObj = _plane getVariable ["JEPP_cas_tgtObj", objNull];
_name = "";
if (_tgtObj isEqualTo objNull) then {
    player sideChat format ["Engage."];
    // player sideRadio "beepSend";
    
    _mark = _plane getVariable ["JEPP_cas_mark", 0];
    if (_mark == 2) then {
        _tgtObj = laserTarget player;
        _plane setVariable ["JEPP_cas_tgtObj", _tgtObj];
        
        _name = "laser target";
    } else {
        _tgtObj = _plane getVariable ["JEPP_cas_markPos"];
        _plane setVariable ["JEPP_cas_tgtObj", _tgtObj];
        
        _name = "target";
    };
} else {
    player sideChat format ["That is your target."];
    // player sideRadio "beepSend";
    
    _name = getText (configfile >> "CfgVehicles" >> typeOf _tgtObj >> "displayName");
};

sleep 3;

_plane setVariable ["JEPP_cas_tallyTarget", true];
_grid = _tgtObj call JEPP_fnc_mapGridPosition;
_plane sideChat format ["Engaging %1 at grid %2.", _name, _grid];
[_plane, _grid] call JEPP_fnc_speak;
// _plane sideRadio "beepRecv";