// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_setupServiceVehicle.sqf
//	@file Author: Lodac


//if (isServer) exitWith {};

private "_veh";
_veh = _this;

if (typeName _veh == "STRING") then { _veh = objectFromNetId _veh };

_veh addAction ["<img image='client\icons\repair.paa'/> Service", "client\functions\fn_resupplytruck.sqf", [], 51, true, true, "", "vehicle _this != _this && _this distance _target <= 15"];
