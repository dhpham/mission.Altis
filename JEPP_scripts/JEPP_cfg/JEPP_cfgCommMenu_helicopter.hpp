//class CfgCommunicationMenu
//{
	class JEPP_comm_helicopter
	{
		text = "Helicopter Transport"; // Text displayed in the menu and in a notification
		submenu = ""; // Submenu opened upon activation (expression is ignored when submenu is not empty.)
		expression = "execVM 'JEPP_scripts\JEPP_helicopter\JEPP_helicopter_openDialog.sqf'"; // Code executed upon activation
		icon = ""; // Icon displayed permanently next to the command menu
		cursor = ""; // Custom cursor displayed when the item is selected
		enable = ""; // Simple expression condition for enabling the item
		removeAfterExpressionCall = 0; // 1 to remove the item after calling
	};
//};
