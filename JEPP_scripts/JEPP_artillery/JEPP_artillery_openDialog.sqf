sleep 0.2;
waitUntil {!dialog};
_dialog = player getVariable ["JEPP_artillery_dialog", "start"];
createDialog format["JEPP_artillery_dialog_%1", _dialog];