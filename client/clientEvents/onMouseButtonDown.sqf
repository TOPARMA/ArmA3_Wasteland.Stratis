// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: onMouseButtonDown.sqf
//	@file Author: micovery
//	@file Created: 23/2/2015
//	@file Args:

private["_handled", "_display", "_button", "_x", "_y", "_shift", "_control"];

_handled = false;
_display = _this select 0;
_button = _this select 1;
_x = _this select 2;
_y = _this select 3;
_shift = _this select 4;
_control = _this select 5;


if (!_handled && (inputAction "LockTarget" > 0 || inputAction "LockTargets" > 0)) then
{
	private["_pweapon","_vweapon","_locktarget","_maxLockonDistance"];
	_lockTarget = cursorTarget;
	_pweapon = currentWeapon player;
	_vweapon = currentWeapon (vehicle player);
	_maxLockonDistance = (["A3W_maxLockonDistance", 0] call getPublicVar) max 0;

	switch (true) do
	{
		case (_pweapon == "launch_Titan_short_F" || {_pweapon == "launch_I_Titan_short_F" || {_pweapon == "launch_O_Titan_short_F"}}): { systemChat format ["Locking Disabled for Titan AT/AP Missiles"]; _handled = true; };
		case (_vweapon == "missiles_DAGR" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for DAGR Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "missiles_SCALPEL" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for SCALPEL  Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "Missile_AGM_01_Plane_CAS_02_F" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for AGM Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "Missile_AGM_02_Plane_CAS_01_F" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for Macer Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
	};	
};

_handled