// class CfgFunctions
// {
	class JEPP
	{
		class Arrays
		{
			class appendArrayVar
			{
				file = "JEPP_scripts\JEPP_fnc\fn_appendArrayVar.sqf";
				description = "Appends an element to an array saved as a variable.";
			};
			class filter
			{
				file = "JEPP_scripts\JEPP_fnc\fn_filter.sqf";
				description = "Removes elements from an array based on the condition.";
			};
			class apply
			{
				file = "JEPP_scripts\JEPP_fnc\fn_apply.sqf";
				description = "Apply the function to each element in the array.";
			};
		};
		class Coordinates
		{
			class adjustPos
			{
				file = "JEPP_scripts\JEPP_fnc\fn_adjustPos.sqf";
				description = "Adjust a target position based on OT direction, range and deviation.";
			};
			class bisectDegrees
			{
				file = "JEPP_scripts\JEPP_fnc\fn_bisectDegrees.sqf";
				description = "Returns the midpoint between two directions.";
			};
			class cardinalLong
			{
				file = "JEPP_scripts\JEPP_fnc\fn_cardinalLong.sqf";
				description = "Converts a cardinal direction to long format.";
			};
			class cardinalToDegrees
			{
				file = "JEPP_scripts\JEPP_fnc\fn_cardinalToDegrees.sqf";
				description = "Converts a cardinal direction to degrees.";
			};
			class cartesianToSpherical
			{
				file = "JEPP_scripts\JEPP_fnc\fn_cartesianToSpherical.sqf";
				description = "Convert a position from cartesian coordinates to spherical coordinates.";
			};
			class degreeToCardinal
			{
				file = "JEPP_scripts\JEPP_fnc\fn_degreeToCardinal.sqf";
				description = "Converts a direction from degrees to cardinal point.";
			};
			class formatDegrees
			{
				file = "JEPP_scripts\JEPP_fnc\fn_formatDegrees.sqf";
				description = "Formats an angle to 0-360 degrees.";
			};
			class mapGridPosition
			{
				file = "JEPP_scripts\JEPP_fnc\fn_mapGridPosition.sqf";
				description = "Returns the grid position.";
			};
			class polarShift
			{
				file = "JEPP_scripts\JEPP_fnc\fn_polarShift.sqf";
				description = "Shifts a position by a given amount in a given direction.";
			};
			class gridPos
			{
				file = "JEPP_scripts\JEPP_fnc\fn_gridPos.sqf";
				description = "Convert a grid code into a world position.";
			};
			class shiftPos
			{
				file = "JEPP_scripts\JEPP_fnc\fn_shiftPos.sqf";
				description = "Shifts a position by a given amount.";
			};
			class sphericalToCartesian
			{
				file = "JEPP_scripts\JEPP_fnc\fn_sphericalToCartesian.sqf";
				description = "Convert a position from spherical coordinates to cartesian coordinates.";
			};
			class transform
			{
				file = "JEPP_scripts\JEPP_fnc\fn_transform.sqf";
				description = "Returns coordinates in a translated and rotated coordinate system.";
			};
		};
		class Numbers
		{
			class roundEven
			{
				file = "JEPP_scripts\JEPP_fnc\fn_roundEven.sqf";
				description = "Rounds to the nearest even of the given power of 10.";
			};
			class roundNum
			{
				file = "JEPP_scripts\JEPP_fnc\fn_roundNum.sqf";
				description = "Rounds a number to the given factor.";
			};
		};
        class Strings
        {
			class capitalize
			{
				file = "JEPP_scripts\JEPP_fnc\fn_capitalize.sqf";
				description = "Capitalize the first letter in a string.";
			};
			class leadingZeros
			{
				file = "JEPP_scripts\JEPP_fnc\fn_leadingZeros.sqf";
				description = "Adds leading zeros to a string.";
			};
			class multiplyString
			{
				file = "JEPP_scripts\JEPP_fnc\fn_multiplyString.sqf";
				description = "Multiply string.";
			};
			class speak
			{
				file = "JEPP_scripts\JEPP_fnc\fn_speak.sqf";
				description = "Speak the string.";
			};
        };
		class Misc
		{
			class animateDoors
			{
				file = "JEPP_scripts\JEPP_fnc\fn_animateDoors.sqf";
				description = "Animate all vehicle doors.";
			};
			class findFlatEmpty
			{
				file = "JEPP_scripts\JEPP_fnc\fn_findFlatEmpty.sqf";
				description = "Find an area that is flat and empty around a center position.";
			};
			class IDF
			{
				file = "JEPP_scripts\JEPP_fnc\fn_IDF.sqf";
				description = "Calculate firing solution for indirect fire.";
			};
			class IDF_collision
			{
				file = "JEPP_scripts\JEPP_fnc\fn_IDF_collision.sqf";
				description = "Returns true if the trajectory collides with terrain.";
			};
			class IDF_inRange
			{
				file = "JEPP_scripts\JEPP_fnc\fn_IDF_inRange.sqf";
				description = "Returns true if target is in range of indirect fire.";
			};
			class impactPos
			{
				file = "JEPP_scripts\JEPP_fnc\fn_impactPos.sqf";
				description = "Returns the position of a projectile's impact.";
			};
			class listLocations
			{
				file = "JEPP_scripts\JEPP_fnc\fn_listLocations.sqf";
				description = "Returns array of all locations of given type.";
			};
			class nearestBuildings
			{
				file = "JEPP_scripts\JEPP_fnc\fn_nearestBuildings.sqf";
				description = "Returns an array of the nearest enterable buildings, ordered by distance.";
			};
			class randomBuilding
			{
				file = "JEPP_scripts\JEPP_fnc\fn_randomBuilding.sqf";
				description = "Returns a random enterable building within a radius around a position.";
			};
			class trajectory
			{
				file = "JEPP_scripts\JEPP_fnc\fn_trajectory.sqf";
				description = "Draw ballistic trajectory.";
			};
		};
	};
	
	class BIS
	{
		class Campaign
		{
			class camp_showOSD
			{
				file = "JEPP_scripts\JEPP_fnc\BIS_fnc_camp_showOSD.sqf";
				description = "Display OSD with location, time and possibly some other campaign related info.";
			};
		};
	};
// };