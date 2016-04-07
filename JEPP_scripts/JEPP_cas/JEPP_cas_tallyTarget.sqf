_plane = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_markPos = [_this,1,[],[[]]] call BIS_fnc_param;

sleep 3;

_tgtType = _plane getVariable ["JEPP_cas_descType", "Land"];
_tgtObjArray = nearestObjects [_markPos, [_tgtType], 250];
if (_tgtObjArray isEqualTo []) then {
    _plane sideRadio "noJoy";
	// _plane sideRadio "beepRecv";
} else {
	_tgtObj = _tgtObjArray select 0;
    _plane setVariable ["JEPP_cas_tgtObj", _tgtObj];
	_name = getText (configfile >> "CfgVehicles" >> typeOf _tgtObj >> "displayName");
    _grid = _tgtObj call JEPP_fnc_mapGridPosition;
	_plane sideChat format ["Contact %1 at %2.", _name, _grid];
    _plane sideRadio "contact";
	// _plane sideRadio "beepRecv";
};

player setVariable ["JEPP_cas_dialog", "adjustTGT"];