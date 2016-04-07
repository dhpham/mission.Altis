class JEPP_helicopter_dialog
{
	idd = 4100;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_helicopter\JEPP_helicopter_dialog_init.sqf';";
	onKeyDown = "if (_this select 1 == 0x01) then {player setVariable ['JEPP_helicopter_grid', ctrlText 41002];};"; // save grid when dialog is closed with escape key
	
	class Controls
	{
		class JEPP_helicopter_back: IGUIBack
		{
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = 0.42;
			moving = true;
		};
		class JEPP_helicopter_transports_text: RscText
		{
			idc = -1;
			text = "Transports";
			x = 0.375;
			y = 0.212;
			w = 0.25;
			h = 0.04;
		};
		class JEPP_helicopter_transports_combo: RscCombo
		{
			idc = 41001;
			x = 0.375;
			y = 0.252;
			w = 0.25;
			h = 0.04;
		};
		class JEPP_helicopter_grid_text: RscText
		{
			idc = -1;
			text = "Grid";
			x = 0.3975;
			y = 0.312;
			w = 0.05;
			h = 0.04;
		};
		class JEPP_helicopter_grid_edit: RscEdit
		{
			idc = 41002;
			x = 0.46;
			y = 0.312;
			w = 0.1375;
			h = 0.04;
		};
		class JEPP_helicopter_pickUp_button: RscButton
		{
			idc = 41003;
			text = "Pick Up";
			x = 0.4;
			y = 0.372;
			w = 0.2;
			h = 0.04;
			action = "buttonSetAction [41003, '']; [lbData [41001, lbCurSel 41001], 'pickUp', ctrlText 41002] execVM 'JEPP_scripts\JEPP_helicopter\JEPP_helicopter_exec.sqf'; closeDialog 4100;";
		};
		class JEPP_helicopter_dropOff_button: RscButton
		{
			idc = 41004;
			text = "Drop Off";
			x = 0.4;
			y = 0.432;
			w = 0.2;
			h = 0.04;
			action = "buttonSetAction [41004, '']; [lbData [41001, lbCurSel 41001], 'dropOff', ctrlText 41002] execVM 'JEPP_scripts\JEPP_helicopter\JEPP_helicopter_exec.sqf'; closeDialog 4100;";
		};
		class JEPP_helicopter_RTB_button: RscButton
		{
			idc = 41005;
			text = "RTB";
			x = 0.4;
			y = 0.492;
			w = 0.2;
			h = 0.04;
			action = "buttonSetAction [41005, '']; [lbData [41001, lbCurSel 41001], 'RTB'] execVM 'JEPP_scripts\JEPP_helicopter\JEPP_helicopter_exec.sqf'; closeDialog 4100;";
		};
		class JEPP_helicopter_close_button: RscButton
		{
			idc = -1;
			text = "Close";
			x = 0.4;
			y = 0.552;
			w = 0.2;
			h = 0.04;
			action = "player setVariable ['JEPP_helicopter_grid', ctrlText 41002]; closeDialog 4100;";
		};
	};
};