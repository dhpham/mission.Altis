_plane = player getVariable ["JEPP_cas_currentPlane", objNull];

// continue
if !(_plane getVariable ["JEPP_cas_continue", false]) then {
	ctrlSetText [6401, "Continue"];
	findDisplay 6400 displayCtrl 6401 buttonSetAction "
		findDisplay 6400 displayCtrl 6401 buttonSetAction '';
		execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_continue.sqf';
	";
};

// mark is on the deck, lasing
if ((_plane getVariable ["JEPP_cas_continue", false]) && !(_plane getVariable ["JEPP_cas_contactMark", false])) then {
	_markType = _plane getVariable ["JEPP_cas_mark", 1];
	
	if (_markType == 1 || _markType == 4) then {
		// mark is on the deck
		ctrlSetText [6401, "Mark is on the deck"];
		findDisplay 6400 displayCtrl 6401 buttonSetAction "
			findDisplay 6400 displayCtrl 6401 buttonSetAction '';
			execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_markOnDeck.sqf';
		";
	};
	if (_markType == 2) then {
		// lasing
		ctrlSetText [6401, "Lasing"];
		findDisplay 6400 displayCtrl 6401 buttonSetAction "
			findDisplay 6400 displayCtrl 6401 buttonSetAction '';
			execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_lasing.sqf';
		";
	};
	if (_markType == 3) then {
		// sparkle
		ctrlSetText [6401, "Sparkle"];
		findDisplay 6400 displayCtrl 6401 buttonSetAction "
			findDisplay 6400 displayCtrl 6401 buttonSetAction '';
			execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_sparkle.sqf';
		";
	};
};

// cleared hot
if ((_plane getVariable ["JEPP_cas_continue", false]) && (_plane getVariable ["JEPP_cas_tallyTarget", false]) && !(_plane getVariable ["JEPP_cas_clearedHot", false])) then {
	
	ctrlSetText [6401, "Cleared Hot"];
	findDisplay 6400 displayCtrl 6401 buttonSetAction "
		findDisplay 6400 displayCtrl 6401 buttonSetAction '';
		execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_clearedHot.sqf';
	";
};