class JEPP_artillery_dialog_start
{
    idd = 3100;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_start_init.sqf';";
    onKeyDown = "if (_this select 1 == 0x01) then {player setVariable ['JEPP_artillery_grid', ctrlText 31002];};"; // save grid when dialog is closed with escape key
    
    class Controls
    {
        class JEPP_artillery_start_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.52;
            moving = true;
        };
        class JEPP_artillery_start_batteries_text: RscText
        {
            idc = -1;
            text = "Batteries";
            x = 0.395;
            y = 0.212;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_start_batteries_combo: RscCombo
        {
            idc = 31001;
            x = 0.4;
            y = 0.252;
            w = 0.2;
            h = 0.04;
        };
        class JEPP_artillery_start_grid_text: RscText
        {
            idc = -1;
            text = "Grid";
            x = 0.395;
            y = 0.312;
            w = 0.05;
            h = 0.04;
        };
        class JEPP_artillery_start_grid_edit: RscEdit
        {
            idc = 31002;
            x = 0.455;
            y = 0.312;
            w = 0.145;
            h = 0.04;
        };
        class JEPP_artillery_start_tgt1_combo: RscCombo
        {
            idc = 31003;
            x = 0.4;
            y = 0.372;
            w = 0.2;
            h = 0.04;
        };
        class JEPP_artillery_start_tgt2_combo: RscCombo
        {
            idc = 31004;
            x = 0.4;
            y = 0.412;
            w = 0.2;
            h = 0.04;
        };
        class JEPP_artillery_start_adjust_button: RscButton
        {
            idc = 31005;
            text = "Adjust Fire";
            x = 0.4;
            y = 0.472;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [31005, '']; player setVariable ['JEPP_artillery_dialog', 'adjust_init']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_start_send.sqf';";
        };
        class JEPP_artillery_start_FFE_button: RscButton
        {
            idc = 31006;
            text = "Fire For Effect";
            x = 0.4;
            y = 0.532;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [31006, '']; player setVariable ['JEPP_artillery_dialog', 'FFE']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_start_send.sqf';";
        };
        class JEPP_artillery_start_targets_button: RscButton
        {
            idc = 31007;
            text = "Saved Targets";
            x = 0.4;
            y = 0.592;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [31007, '']; player setVariable ['JEPP_artillery_dialog', 'saved']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_start_send.sqf';";
        };
        class JEPP_artillery_start_close_button: RscButton
        {
            idc = 31008;
            text = "Close";
            x = 0.4;
            y = 0.652;
            w = 0.2;
            h = 0.04;
            action = "player setVariable ['JEPP_artillery_grid', ctrlText 31002]; closeDialog 3100;";
        };
    };
};

class JEPP_artillery_dialog_adjust
{
    idd = 3200;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_adjust_init.sqf';";
    onKeyDown = "if (_this select 1 == 0x01) then {player setVariable ['JEPP_artillery_directionStr', ctrlText 32003];};"; // save direction when dialog is closed with escape key
    
    class Controls
    {
        class JEPP_artillery_adjust_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.54;
            moving = true;
        };
        class JEPP_artillery_adjust_type_text: RscText
        {
            idc = -1;
            text = "Round Type";
            x = 0.375;
            y = 0.212;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_adjust_type_combo: RscCombo
        {
            idc = 32000;
            x = 0.375;
            y = 0.252;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_adjust_direction_text: RscText
        {
            idc = -1;
            text = "Direction";
            x = 0.37;
            y = 0.312;
            w = 0.1;
            h = 0.04;
        };
        class JEPP_artillery_adjust_direction_edit: RscEdit
        {
            idc = 32001;
            x = 0.47;
            y = 0.312;
            w = 0.075;
            h = 0.04;
        };
        class JEPP_artillery_adjust_units_Combo: RscCombo
        {
            idc = 32006;
            x = 0.545;
            y = 0.312;
            w = 0.08;
            h = 0.04;
        };
        class JEPP_artillery_adjust_deviation_combo: RscCombo
        {
            idc = 32002;
            x = 0.4;
            y = 0.38;
            w = 0.1125;
            h = 0.04;
        };
        class JEPP_artillery_adjust_deviation_edit: RscEdit
        {
            idc = 32003;
            x = 0.525;
            y = 0.38;
            w = 0.075;
            h = 0.04;
        };
        class JEPP_artillery_adjust_range_combo: RscCombo
        {
            idc = 32004;
            x = 0.4;
            y = 0.44;
            w = 0.1125;
            h = 0.04;
        };
        class JEPP_artillery_adjust_range_edit: RscEdit
        {
            idc = 32005;
            x = 0.525;
            y = 0.44;
            w = 0.075;
            h = 0.04;
        };
        class JEPP_artillery_adjust_send_button: RscButton
        {
            idc = 32007;
            text = "Send";
            x = 0.4;
            y = 0.5;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [32007, '']; player setVariable ['JEPP_artillery_dialog', 'adjust']; [lbValue [32000, lbCurSel 32000], ctrlText 32001, lbText [32006, lbCurSel 32006], (lbValue [32002, lbCurSel 32002]) * (parseNumber ctrlText 32003), (lbValue [32004, lbCurSel 32004]) * (parseNumber ctrlText 32005)] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_adjust_send.sqf'; closeDialog 3200;";
        };
        class JEPP_artillery_adjust_FFE_button: RscButton
        {
            idc = 32008;
            text = "Fire For Effect";
            x = 0.4;
            y = 0.56;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [32008, '']; player setVariable ['JEPP_artillery_dialog', 'FFE']; [lbValue [32000, lbCurSel 32000], ctrlText 32001, lbText [32006, lbCurSel 32006], (lbValue [32002, lbCurSel 32002]) * (parseNumber ctrlText 32003), (lbValue [32004, lbCurSel 32004]) * (parseNumber ctrlText 32005)] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_adjust_send.sqf'; closeDialog 3200;";
        };
        class JEPP_artillery_adjust_abort_button: RscButton
        {
            idc = 32009;
            text = "Abort Mission";
            x = 0.4;
            y = 0.62;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [32009, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_abort.sqf'; closeDialog 3200;";
        };
        class JEPP_artillery_adjust_close_button: RscButton
        {
            idc = -1;
            text = "Close";
            x = 0.4;
            y = 0.68;
            w = 0.2;
            h = 0.04;
            action = "player setVariable ['JEPP_artillery_directionStr', ctrlText 32003]; closeDialog 3200;";
        };
    };
};

class JEPP_artillery_dialog_FFE
{
    idd = 3300;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_FFE_init.sqf';";
    
    class Controls
    {
        class JEPP_artillery_FFE_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.36;
            moving = true;
        };
        class JEPP_artillery_FFE_types_text: RscText
        {
            idc = -1;
            text = "Round Types";
            x = 0.375;
            y = 0.212;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_FFE_types_combo: RscCombo
        {
            idc = 33001;
            x = 0.375;
            y = 0.252;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_FFE_count_text: RscText
        {
            idc = -1;
            text = "Rounds";
            x = 0.375;
            y = 0.312;
            w = 0.0875;
            h = 0.04;
        };
        class JEPP_artillery_FFE_count_edit: RscEdit
        {
            idc = 33002;
            x = 0.4625;
            y = 0.312;
            w = 0.0625;
            h = 0.04;
        };
        class JEPP_artillery_FFE_gunCount_text: RscText
        {
            idc = 33003;
            text = "x0 Guns";
            x = 0.525;
            y = 0.312;
            w = 0.1;
            h = 0.04;
        };
        class JEPP_artillery_FFE_confirm_button: RscButton
        {
            idc = 33004;
            text = "Confirm";
            x = 0.4;
            y = 0.372;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [33004, '']; player setVariable ['JEPP_artillery_dialog', 'hold']; [lbValue [33001, lbCurSel 33001], parseNumber ctrlText 33002] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_FFE_send.sqf'; closeDialog 3300;";
        };
        class JEPP_artillery_FFE_abort_button: RscButton
        {
            idc = 33005;
            text = "Abort Mission";
            x = 0.4;
            y = 0.432;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [33005, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_abort.sqf'; closeDialog 3300;";
        };
        class JEPP_artillery_FFE_close_button: RscButton
        {
            idc = -1;
            text = "Close";
            x = 0.4;
            y = 0.492;
            w = 0.2;
            h = 0.04;
            action = "closeDialog 3300;";
        };
    };
};

class JEPP_artillery_dialog_end
{
    idd = 3400;
    movingEnable = 1;
    enableSimulation = 1;
    
    class Controls
    {
        class JEPP_artillery_end_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.4;
            moving = true;
        };
        class JEPP_artillery_end_repeat_button: RscButton
        {
            idc = 34001;
            text = "Repeat";
            x = 0.4;
            y = 0.232;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [34001, '']; player setVariable ['JEPP_artillery_dialog', 'FFE']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf'; closeDialog 3400;"
        };
        class JEPP_artillery_end_adjust_button: RscButton
        {
            idc = 34002;
            text = "Adjust Fire";
            x = 0.4;
            y = 0.292;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [34002, '']; player setVariable ['JEPP_artillery_dialog', 'adjust']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_openDialog.sqf'; closeDialog 3400;"
        };
        class JEPP_artillery_end_save_button: RscButton
        {
            idc = 34003;
            text = "Save Target";
            x = 0.4;
            y = 0.352;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [34003, '']; player setVariable ['JEPP_artillery_dialog', 'start']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_save_target.sqf'; closeDialog 3400;";
        };
        class JEPP_artillery_end_end_button: RscButton
        {
            idc = 34004;
            text = "End Mission";
            x = 0.4;
            y = 0.412;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [34004, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_end.sqf'; closeDialog 3400;";
        };
        class JEPP_artillery_end_abort_button: RscButton
        {
            idc = 34005;
            text = "Abort Mission";
            x = 0.4;
            y = 0.472;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [34005, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_abort.sqf'; closeDialog 3400;";
        };
        class JEPP_artillery_end_close_button: RscButton
        {
            idc = -1;
            text = "Close";
            x = 0.4;
            y = 0.532;
            w = 0.2;
            h = 0.04;
            action = "closeDialog 3400";
        };
    };
};
class JEPP_artillery_dialog_adjust_init
{
    idd = 3500;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_adjust_init_init.sqf';";
    onKeyDown = "if (_this select 1 == 0x01) then {player setVariable ['JEPP_artillery_directionStr', ctrlText 35002];};";
    
    class Controls
    {
        class JEPP_artillery_adjust_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.36;
            moving = true;
        };
        class JEPP_artillery_adjust_init_type_text: RscText
        {
            idc = -1;
            text = "Round Type";
            x = 0.375;
            y = 0.212;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_adjust_init_type_combo: RscCombo
        {
            idc = 35001;
            x = 0.375;
            y = 0.252;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_adjust_init_direction_text: RscText
        {
            idc = -1;
            text = "Direction";
            x = 0.37;
            y = 0.312;
            w = 0.1;
            h = 0.04;
        };
        class JEPP_artillery_adjust_init_direction_edit: RscEdit
        {
            idc = 35002;
            x = 0.47;
            y = 0.312;
            w = 0.075;
            h = 0.04;
        };
        class JEPP_artillery_adjust_init_units_combo: RscCombo
        {
            idc = 35003;
            x = 0.545;
            y = 0.312;
            w = 0.08;
            h = 0.04;
        };
        class JEPP_artillery_adjust_init_send_button: RscButton
        {
            idc = 35004;
            text = "Send";
            x = 0.4;
            y = 0.372;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [35004, '']; [lbValue [35001, lbCurSel 35001], ctrlText 35002, lbText [35003, lbCurSel 35003]] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_adjust_init_send.sqf'; closeDialog 3500;"
        };
        class JEPP_artillery_adjust_init_abort_button: RscButton
        {
            idc = 35005;
            text = "Abort Mission";
            x = 0.4;
            y = 0.432;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [35005, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_abort.sqf'; closeDialog 3500;";
        };
        class JEPP_artillery_adjust_init_close_button: RscButton
        {
            idc = -1;
            text = "Close";
            x = 0.4;
            y = 0.492;
            w = 0.2;
            h = 0.04;
            action = "player setVariable ['JEPP_artillery_directionStr', ctrlText 35002]; closeDialog 3500;";
        };
    };
};

class JEPP_artillery_dialog_saved
{
    idd = 3600;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_saved_init.sqf';";
    
    class Controls
    {
        class JEPP_artillery_saved_back: IGUIBack
        {
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = 0.3;
            moving = true;
        };
        class JEPP_artillery_saved_targets_text: RscText
        {
            idc = -1;
            text = "Targets";
            x = 0.375;
            y = 0.212;
            w = 0.25;
            h = 0.04;
        };
        class JEPP_artillery_saved_targets_combo: RscCombo
        {
            idc = 36002;
            x = 0.375;
            y = 0.252;
            w = 0.15;
            h = 0.04;
        };
        class JEPP_artillery_saved_delete_button: RscButton
        {
            idc = 36003;
            text = "Delete";
            x = 0.5375;
            y = 0.252;
            w = 0.0875;
            h = 0.04;
            action = "buttonSetAction [36003, '']; [lbCurSel 36002] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_saved_delete.sqf'; deleteMarker lbText[36002, lbCurSel 36002]; lbDelete [36002, lbCurSel 36002];";
        };
        class JEPP_artillery_saved_adjust_button: RscButton
        {
            idc = 36004;
            text = "Adjust Fire";
            x = 0.4;
            y = 0.312;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [36004, '']; player setVariable ['JEPP_artillery_dialog', 'adjust_init']; [lbCurSel 36002] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_saved_send.sqf'; closeDialog 3600;";
        };
        class JEPP_artillery_saved_FFE_button: RscButton
        {
            idc = 36005;
            text = "Fire For Effect";
            x = 0.4;
            y = 0.372;
            w = 0.2;
            h = 0.04;
            action = "buttonSetAction [36005, '']; player setVariable ['JEPP_artillery_dialog', 'FFE']; [lbCurSel 36002] execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_dialog_saved_send.sqf'; closeDialog 3600;";
        };
        class JEPP_artillery_saved_cancel_button: RscButton
        {
            idc = -1;
            text = "Cancel";
            x = 0.4;
            y = 0.432;
            w = 0.2;
            h = 0.04;
            action = "player setVariable ['JEPP_artillery_dialog', 'start']; closeDialog 3600;";
        };
    };
};

class JEPP_artillery_dialog_hold
{
    idd = 3700;
    movingEnable = 1;
    enableSimulation = 1;
    
    class Controls
    {
        class JEPP_artillery_hold_back: IGUIBack
        {
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.4;
            h = 0.18;
            moving = true;
        };
        class JEPP_artillery_hold_abort_button: RscButton
        {
            idc = 3701;
            text = "Abort Mission";
            x = 0.35;
            y = 0.24;
            w = 0.3;
            h = 0.04;
            action = "buttonSetAction [3701, '']; execVM 'JEPP_scripts\JEPP_artillery\JEPP_artillery_abort.sqf'; closeDialog 3700;";
        };
        class JEPP_artillery_hold_close_button: RscButton
        {
            idc = 3702;
            text = "Close";
            x = 0.35;
            y = 0.3;
            w = 0.3;
            h = 0.04;
            action = "buttonSetAction [3702, '']; closeDialog 3700;";
        };
    };
};