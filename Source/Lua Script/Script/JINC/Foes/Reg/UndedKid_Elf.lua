--[[
**********************************************
  
  UndedKid_Elf.lua
  (c) Jeroen Broks, 2016, All Rights Reserved.
  
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
 
version: 16.06.03
]]
--[[
	Generated by Foe Editor
	(c) Jeroen P. Broks
	If this file has any references at all to the story line
	or any of its characters it may only be distributed in an
	unmodified form with an unmodified version of the game

	If this file has no references at all, you may
	use it under the terms of the zlib license!
]]


-- Version 16.06.03



Data = {
	Name = "Undead Elf Kid",
	Desc = "Dead or not, she's still\na vicious rogue. Beware!",
	ImageFile = "Reg/UndedKid_Elf.png",
	AI = "Default",
	EleRes_Fire = 2,
	EleRes_Wind = 6,
	EleRes_Water = 5,
	EleRes_Earth = 5,
	EleRes_Frost = 5,
	EleRes_Lightning = 1,
	EleRes_Light = 0,
	EleRes_Dark = 6,
	EleRes_Healing = 0,
	EleRes_DarkHealing = 6,
	Stat = {
		["Strength"] = {278,300},
		["Defense"] = {113,120},
		["Will"] = {198,250},
		["Resistance"] = {89,100},
		["Agility"] = {48,60},
		["Accuracy"] = {800,900},
		["Evasion"] = {30,40},
		["HP"] = {3301,3399},
		["AP"] = {0,0},
		["LevelRange"] = {73,80},
},
	StatusResistance = {
		["Poison"] = 100   --[[ #1 ]],
		["Paralysis"] = 100   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 100   --[[ #4 ]],
		["Block"] = 100   --[[ #5 ]],
		["Death"] = 100   --[[ #6 ]],
		["Damned"] = 100   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Abl.ABL_FOE_DARKHEAL_FOE"] = 5		for ak=1,60 do table.insert(Data.Acts,"Abl.ABL_FOE_DARKHEAL_FOE") end
Data.ActMinLevel["Abl.ABL_FOE_DARKHEAL_HERO"] = 2		for ak=1,78 do table.insert(Data.Acts,"Abl.ABL_FOE_DARKHEAL_HERO") end
Data.ActMinLevel["Abl.ABL_FOE_DEATH"] = 1		for ak=1,100 do table.insert(Data.Acts,"Abl.ABL_FOE_DEATH") end
Data.ActMinLevel["Abl.ABL_FOE_DEMON_SOUL_BREAKER"] = 1		for ak=1,250 do table.insert(Data.Acts,"Abl.ABL_FOE_DEMON_SOUL_BREAKER") end
Data.ActMinLevel["Abl.ABL_FOE_IDDQD"] = 100		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_IDDQD") end
Data.ActMinLevel["Abl.ABL_FOE_THRILLINGCHARGE"] = 1		for ak=1,95 do table.insert(Data.Acts,"Abl.ABL_FOE_THRILLINGCHARGE") end
Data.ActMinLevel["Abl.ABL_FOE_ULTRASONIC"] = 2		for ak=1,77 do table.insert(Data.Acts,"Abl.ABL_FOE_ULTRASONIC") end
Data.ActMinLevel["Abl.ABL_FOXY_BACKSTAB"] = 4		for ak=1,76 do table.insert(Data.Acts,"Abl.ABL_FOXY_BACKSTAB") end
Data.ActMinLevel["Abl.ABL_FOXY_CHEER"] = 5		for ak=1,77 do table.insert(Data.Acts,"Abl.ABL_FOXY_CHEER") end
Data.ActMinLevel["Abl.ABL_FOXY_STUNSTAB"] = 5		for ak=1,70 do table.insert(Data.Acts,"Abl.ABL_FOXY_STUNSTAB") end


return Data
