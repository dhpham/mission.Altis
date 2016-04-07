class JEPP_cas_dialog_start
{
	idd = 6100;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_start_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_start_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.26;
			moving = true;
		};
		class JEPP_cas_start_callsign_text: RscText
		{
			idc = -1;
			text = "Callsign";
			x = 0.325;
			y = 0.22;
			w = 0.125;
			h = 0.04;
		};
		class JEPP_cas_start_callsign_combo: RscCombo
		{
			idc = 61001;
			x = 0.45;
			y = 0.22;
			w = 0.225;
			h = 0.04;
		};
		class JEPP_cas_start_type_text: RscText
		{
			idc = -1;
			text = "Control";
			x = 0.325;
			y = 0.28;
			w = 0.125;
			h = 0.04;
		};
		class JEPP_cas_start_type_combo: RscCombo
		{
			idc = 61002;
			x = 0.45;
			y = 0.28;
			w = 0.225;
			h = 0.04;
		};
		class JEPP_cas_start_send_button: RscButton
		{
			idc = 6101;
			text = "Send";
			x = 0.325;
			y = 0.34;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6101, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_start_send.sqf';";
		};
		class JEPP_cas_start_close_button: RscButton
		{
			idc = 6102;
			text = "Close";
			x = 0.325;
			y = 0.4;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6102, '']; closeDialog 6100;";
		};
	};
};

class JEPP_cas_dialog_9line
{
	idd = 6200;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_9line_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_9line_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.78;
			moving = true;
		};
		class JEPP_cas_9line_ip_text: RscText
		{
			idc = -1;
			text = "IP";
			x = 0.325;
			y = 0.24;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_ip_combo: RscCombo
		{
			idc = 62001;
			x = 0.5;
			y = 0.24;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_hdg_text: RscText
		{
			idc = -1;
			text = "Heading";
			x = 0.325;
			y = 0.3;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_hdg_edit: RscEdit
		{
			idc = 62002;
			x = 0.5;
			y = 0.3;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_dist_text: RscText
		{
			idc = -1;
			text = "Distance";
			x = 0.325;
			y = 0.36;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_dist_edit: RscEdit
		{
			idc = 62003;
			x = 0.5;
			y = 0.36;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_elev_text: RscText
		{
			idc = -1;
			text = "Elevation";
			x = 0.325;
			y = 0.42;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_elev_edit: RscEdit
		{
			idc = 620041;
			x = 0.5;
			y = 0.42;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_9line_elev_combo: RscCombo
		{
			idc = 620042;
			x = 0.5875;
			y = 0.42;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_9line_desc_txt: RscText
		{
			idc = -1;
			text = "Description";
			x = 0.325;
			y = 0.48;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_desc_combo: RscCombo
		{
			idc = 62005;
			x = 0.5;
			y = 0.48;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_loc_text: RscText
		{
			idc = -1;
			text = "Location";
			x = 0.325;
			y = 0.54;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_loc_edit: RscEdit
		{
			idc = 62006;
			x = 0.5;
			y = 0.54;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_mark_text: RscText
		{
			idc = -1;
			text = "Mark Type";
			x = 0.325;
			y = 0.6;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_mark_combo: RscCombo
		{
			idc = 62007;
			x = 0.5;
			y = 0.6;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_friendlies_text: RscText
		{
			idc = -1;
			text = "Friendlies";
			x = 0.325;
			y = 0.66;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_friendlies_combo: RscCombo
		{
			idc = 620081;
			x = 0.5;
			y = 0.66;
			w = 0.1;
			h = 0.04;
		};
		class JEPP_cas_9line_friendlies_edit: RscEdit
		{
			idc = 620082;
			x = 0.6;
			y = 0.66;
			w = 0.075;
			h = 0.04;
		};
		class JEPP_cas_9line_egress_text: RscText
		{
			idc = -1;
			text = "Egress";
			x = 0.325;
			y = 0.72;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_egress_combo: RscCombo
		{
			idc = 62009;
			x = 0.5;
			y = 0.72;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_9line_send_button: RscButton
		{
			idc = 6201;
			text = "Send";
			x = 0.325;
			y = 0.78;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6201, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_9line_send.sqf';";
		};
		class JEPP_cas_9line_cancel_button: RscButton
		{
			idc = 6202;
			text = "Cancel";
			x = 0.325;
			y = 0.84;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6202, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_cancel.sqf'; closeDialog 6200;";
		};
		class JEPP_cas_9line_close_button: RscButton
		{
			idc = 6203;
			text = "Close";
			x = 0.325;
			y = 0.9;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6203, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_9line_close.sqf';";
		};
	};
};

class JEPP_cas_dialog_remarks
{
	idd = 6300;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_remarks_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_remarks_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.42;
			moving = true;
		};
		class JEPP_cas_remarks_ordnance_text: RscText
		{
			idc = -1;
			text = "Ordnance";
			x = 0.325;
			y = 0.24;
			w = 0.1125;
			h = 0.04;
		};
		class JEPP_cas_remarks_ordnance_combo: RscCombo
		{
			idc = 63001;
			x = 0.4375;
			y = 0.24;
			w = 0.2375;
			h = 0.04;
		};
		class JEPP_cas_remarks_attack_hdg_text: RscText
		{
			idc = -1;
			text = "Attack Heading";
			x = 0.325;
			y = 0.3;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_remarks_attack_hdg_edit1: RscEdit
		{
			idc = 63002;
			x = 0.5;
			y = 0.3;
			w = 0.075;
			h = 0.04;
		};
		class JEPP_cas_remarks_attack_hdg_text2: RscText
		{
			idc = -1;
			text = "-";
			x = 0.575;
			y = 0.296;
			w = 0.025;
			h = 0.04;
		};
		class JEPP_cas_remarks_attack_hdg_edit2: RscEdit
		{
			idc = 63003;
			x = 0.6;
			y = 0.3;
			w = 0.075;
			h = 0.04;
		};
		class JEPP_cas_remarks_threat_text: RscText
		{
			idc = -1;
			text = "Threat";
			x = 0.325;
			y = 0.36;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_remarks_threat_type_combo: RscCombo
		{
			idc = 63004;
			x = 0.4125;
			y = 0.36;
			w = 0.1;
			h = 0.04;
		};
		class JEPP_cas_remarks_threat_dir_combo: RscCombo
		{
			idc = 63005;
			x = 0.5125;
			y = 0.36;
			w = 0.075;
			h = 0.04;
		};
		class JEPP_cas_remarks_threat_dist_edit: RscEdit
		{
			idc = 63006;
			x = 0.5875;
			y = 0.36;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_remarks_send_button: RscButton
		{
			idc = 6301;
			text = "Send";
			x = 0.325;
			y = 0.42;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6301, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_remarks_send.sqf';";
		};
		class JEPP_cas_remarks_cancel_button: RscButton
		{
			idc = 6302;
			text = "Cancel";
			x = 0.325;
			y = 0.48;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6302, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_cancel.sqf'; closeDialog 6300;";
		};
		class JEPP_cas_remarks_close_button: RscButton
		{
			idc = 6303;
			text = "Close";
			x = 0.325;
			y = 0.54;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6303, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_remarks_close.sqf';";
		};
	};
};

class JEPP_cas_dialog_mission
{
	idd = 6400;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mission_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_mission_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.24;
			moving = true;
		};
		class JEPP_cas_mission_button1: RscButton
		{
			idc = 6401;
			x = 0.35;
			y = 0.24;
			w = 0.3;
			h = 0.04;
		};
		class JEPP_cas_mission_button2: RscButton
		{
			idc = 6402;
			text = "Abort";
			x = 0.35;
			y = 0.3;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6402, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_abort.sqf'; closeDialog 6400;";
		};
		class JEPP_cas_mission_button3: RscButton
		{
			idc = 6403;
			text = "Close";
			x = 0.35;
			y = 0.36;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6403, '']; closeDialog 6400;";
		};
	};
};

class JEPP_cas_dialog_done
{
	idd = 6500;
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class JEPP_cas_mission_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.24;
			moving = true;
		};
		class JEPP_cas_mission_button1: RscButton
		{
			idc = 6501;
			text = "Attack Complete";
			x = 0.35;
			y = 0.24;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6501, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_done_complete.sqf';";
		};
		class JEPP_cas_mission_button2: RscButton
		{
			idc = 6502;
			text = "Re-attack";
			x = 0.35;
			y = 0.3;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6502, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_done_reattack.sqf';";
		};
		class JEPP_cas_mission_button3: RscButton
		{
			idc = 6503;
			text = "Close";
			x = 0.35;
			y = 0.36;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6503, '']; closeDialog 6500;";
		};
	};
};

class JEPP_cas_dialog_hold
{
	idd = 6600;
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class JEPP_cas_mission_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.18;
			moving = true;
		};
		class JEPP_cas_mission_button1: RscButton
		{
			idc = 6601;
			text = "Abort";
			x = 0.35;
			y = 0.24;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6601, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_abort.sqf'; closeDialog 6600;";
		};
		class JEPP_cas_mission_button3: RscButton
		{
			idc = 6602;
			text = "Close";
			x = 0.35;
			y = 0.3;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6602, '']; closeDialog 6600;";
		};
	};
};

class JEPP_cas_dialog_mark
{
	idd = 6700;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mark_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_mark_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.3;
			moving = true;
		};
		class JEPP_cas_mark_text: RscText
		{
			idc = -1;
			text = "From the mark:";
			x = 0.325;
			y = 0.24;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_mark_combo: RscCombo
		{
			idc = 67001;
			x = 0.5;
			y = 0.24;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_mark_edit: RscEdit
		{
			idc = 67002;
			x = 0.5875;
			y = 0.24;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_mark_send_button: RscButton
		{
			idc = 6701;
			text = "Send";
			x = 0.325;
			y = 0.3;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6701, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mark_send.sqf';";
		};
		class JEPP_cas_mark_abort_button: RscButton
		{
			idc = 6702;
			text = "Abort";
			x = 0.325;
			y = 0.36;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6702, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_abort.sqf'; closeDialog 6700;";
		};
		class JEPP_cas_mark_close_button: RscButton
		{
			idc = 6703;
			text = "Close";
			x = 0.325;
			y = 0.42;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6703, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_mark_close.sqf';";
		};
	};
};

class JEPP_cas_dialog_adjustTGT
{
	idd = 6800;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_adjustTGT_init.sqf';";
	
	class Controls
	{
		class JEPP_cas_adjustTGT_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.36;
		};
		class JEPP_cas_adjustTGT_confirm_button: RscButton
		{
			idc = 6801;
			text = "Confirm";
			x = 0.325;
			y = 0.24;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6801, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_adjustTGT_confirm.sqf';";
		};
		class JEPP_cas_adjustTGT_type_combo: RscCombo
		{
			idc = 68001;
			x = 0.325;
			y = 0.3;
			w = 0.175;
			h = 0.04;
		};
		class JEPP_cas_adjustTGT_dir_combo: RscCombo
		{
			idc = 68002;
			x = 0.5;
			y = 0.3;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_adjustTGT_range_edit: RscEdit
		{
			idc = 68003;
			x = 0.5875;
			y = 0.3;
			w = 0.0875;
			h = 0.04;
		};
		class JEPP_cas_adjustTGT_update_button: RscButton
		{
			idc = 6802;
			text = "Update";
			x = 0.325;
			y = 0.36;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6802, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_adjustTGT_update.sqf';";
		};
		class JEPP_cas_adjustTGT_abort_button: RscButton
		{
			idc = 6803;
			text = "Abort";
			x = 0.325;
			y = 0.42;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6803, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_abort.sqf'; closeDialog 6700;";
		};
		class JEPP_cas_adjustTGT_close_button: RscButton
		{
			idc = 6804;
			text = "Close";
			x = 0.325;
			y = 0.48;
			w = 0.35;
			h = 0.04;
			action = "buttonSetAction [6804, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_adjustTGT_close.sqf';";
		};
	};
};

class JEPP_cas_dialog_readback
{
	idd = 6900;
	movingEnable = 1;
	enableSimulation = 1;
	
	class Controls
	{
		class JEPP_cas_readback_back: IGUIBack
		{
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.4;
			h = 0.24;
			moving = true;
		};
		class JEPP_cas_readback_button1: RscButton
		{
			idc = 6901;
			text = "Readback correct";
			x = 0.35;
			y = 0.24;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6901, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_readback_correct.sqf';";
		};
		class JEPP_cas_readback_button2: RscButton
		{
			idc = 6902;
			text = "Cancel";
			x = 0.35;
			y = 0.3;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6902, '']; execVM 'JEPP_scripts\JEPP_cas\JEPP_cas_dialog_cancel.sqf'; closeDialog 6900;";
		};
		class JEPP_cas_readback_close_button: RscButton
		{
			idc = 6903;
			text = "Close";
			x = 0.35;
			y = 0.36;
			w = 0.3;
			h = 0.04;
			action = "buttonSetAction [6903, '']; closeDialog 6900;";
		};
	};
};