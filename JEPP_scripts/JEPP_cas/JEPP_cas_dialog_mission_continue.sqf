player setVariable ["JEPP_cas_dialog", "hold"];

closeDialog 6400;

_plane = player getVariable ["JEPP_cas_currentPlane", grpNull];
_plane setVariable ["JEPP_cas_continue", true];

player sideChat format ["Continue."];
// player sideRadio "beepSend";