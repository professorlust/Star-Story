--[[
**********************************************
  
  ARM_HEALINGSHOWER.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 17.04.14
]]
ret = {
	["APRecover"] = 10,
	["APRecoverType"] = "Absolute",
	["ARM_Hit%"] = 50,
	["ARM_MaxAmmo"] = 2,
	["ARM_PRICE_Hit%"] = 1,
	["ARM_PRICE_MaxAmmo"] = 2500,
	["ARM_PRICE_Weight"] = 2500,
	["ARM_PRICE_XPower"] = 2500,
	["ARM_XPower"] = 0,
	["ActSpeed"] = 100,
	["AttackElement"] = "Healing",
	["AttackPower"] = 3000,
	["AttackStat"] = "Strength",
	["CureAmnesia"] = true,
	["CureBagLock"] = true,
	["CureConfusion"] = true,
	["CureDamned"] = true,
	["CureDisease"] = true,
	["CureHandicapped"] = true,
	["CureParalysis"] = true,
	["CurePoison"] = true,
	["CureSleep"] = true,
	["CureTerrified"] = true,
	["CureZombie"] = true,
	["DefenseStat"] = "Defense",
	["Description"] = "Powerful healing on the entire party and heal all status changes",
	["GrantEXPType"] = "Absolute",
	["HealingType"] = "Absolute",
	["Icon"] = "GFX/Abilities/Gun.png",
	["ItemType"] = "Consumable",
	["Name"] = "Healing Shower",
	["SpellAni_Reference"] = "AllHeal",
	["Target"] = "AA",
	["UseCombat"] = true}

return ret

-- This file is an automatically generated file!

