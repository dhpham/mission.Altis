sleep 0.2;
waitUntil {!dialog};
_dialog = player getVariable ["JEPP_cas_dialog", "start"];

createDialog format["JEPP_cas_dialog_%1", _dialog];