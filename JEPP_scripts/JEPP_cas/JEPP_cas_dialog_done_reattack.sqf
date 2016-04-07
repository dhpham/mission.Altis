player setVariable ["JEPP_cas_dialog", "hold"];

closeDialog 6500;
_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

player sideChat format ["Target not destroyed. Re-attack is authorized. Report IP inbound."];
// player sideRadio "beepSend";



// winchester
_ammo = [];
{
    {
        _magazine = _x select 0;
        _rounds = _x select 1;
        _weapon = _x select 4;
        [_ammo, _weapon, _rounds] call BIS_fnc_addToPairs;
    } forEach magazinesAmmoFull vehicle _x;
} forEach ([units _plane, {_x == driver vehicle _x}] call BIS_fnc_conditionalSelect);

_ordnance = _plane getVariable ["JEPP_cas_ordnance", ""];
_rounds = [_ammo, _ordnance, 0] call BIS_fnc_getFromPairs;
_winchester = false;
if (_rounds == 0) then {
    _winchester = true;
};

if (_winchester) then {
    [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_reset.sqf";
    
    sleep 3;
    
    _plane sideRadio "unable";
    // _plane sideRadio "beepSend";
} else {
    // reset mission variables
    _plane setVariable ["JEPP_cas_inbound", false];
    _plane setVariable ["JEPP_cas_continue", false];
    _plane setVariable ["JEPP_cas_in", false];
    _plane setVariable ["JEPP_cas_clearedHot", false];
    _plane setVariable ["JEPP_cas_off", false];
    
    _plane setVariable ["JEPP_cas_contactMark", false];
    _plane setVariable ["JEPP_cas_lasing", false];
    _plane setVariable ["JEPP_cas_sparkle", false];
    _plane setVariable ["JEPP_cas_markOnDeck", false];
    
    _plane setVariable ["JEPP_cas_markDir", 0];
    _plane setVariable ["JEPP_cas_markDirText", ""];
    _plane setVariable ["JEPP_cas_markDist", ""];
    _plane setVariable ["JEPP_cas_adjustMark", false];
    
    _plane setVariable ["JEPP_cas_markPos", []];
    // _plane setVariable ["JEPP_cas_tgtObj", objNull];
    _plane setVariable ["JEPP_cas_tallyTarget", false];
    _plane setVariable ["JEPP_cas_weaponsReleased", false];
    
    _plane setVariable ["JEPP_cas_flares", false];
    
    // reattack
    _s = [_plane] execVM "JEPP_scripts\JEPP_cas\JEPP_cas_executeMission.sqf";
        
    // save script handle for terminate
    [_plane, "JEPP_cas_scriptHandles", _s] call JEPP_fnc_appendArrayVar;
};