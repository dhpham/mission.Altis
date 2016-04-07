player setVariable ["JEPP_cas_dialog", "hold"];

closeDialog 6400;

_plane = player getVariable ["JEPP_cas_currentPlane", objNull];
_plane setVariable ["JEPP_cas_sparkle", true];

player sideChat format ["Sparkle."];
// player sideRadio "beepSend";