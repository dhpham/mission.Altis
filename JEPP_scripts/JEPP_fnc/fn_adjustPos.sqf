/*
	Author: JEPP

	Description:
	Updates a position based observer direction, range, deviation
	
	Parameter(s):
	_this select 0: ARRAY - Old position
	_this select 1: NUMBER - Observer-target direction (in mils)
	_this select 2: NUMBER - Lateral correction
	_this select 3: NUMBER - Radial correction

	Example:
	[getPos target,3200,100,-50] call JEPP_fnc_adjust;

	Returns:
	ARRAY - Updated position
*/

params [
    ["_targetPosOld",[0,0,0],[[]],[2,3]],
    ["_OTdir",0,[0]],
    ["_deviation",0,[0]],
    ["_range",0,[0]],
    "_r",
    "_phi",
    "_theta",
    "_shift",
    "_targetPos"
];

// convert from mils to degrees
_OTdir = (360/6400)*_OTdir;

// change to polar coordinates with the old target at the origin and the y-axis in the observer-target direction
_r = sqrt (_range^2 + _deviation^2); // distance between old target and new target
_phi = _deviation atan2 _range; // angle to the new target

// rotate from OT frame to global frame
_theta = _OTdir + _phi; // compass heading to new target.

// convert to cartesian coordinates with old target at origin
_shift = [_r, _theta, 0] call JEPP_fnc_sphericalToCartesian;

// shift target position
_targetPos = _targetPosOld vectorAdd _shift;

// return new position
_targetPos;