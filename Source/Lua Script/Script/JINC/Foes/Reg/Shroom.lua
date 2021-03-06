--[[
**********************************************
  
  Shroom.lua
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
 
version: 16.11.12
]]


-- Version 16.11.12



Data = {
	Name = "Shroom",
	Desc = "Lethally poisonous",
	ImageFile = "Reg/Shroom.png",
	AI = "Default",
	Shilders = 300,
	EleRes_Fire = 0,
	EleRes_Wind = 4,
	EleRes_Water = 5,
	EleRes_Earth = 4,
	EleRes_Frost = 3,
	EleRes_Lightning = 3,
	EleRes_Light = 3,
	EleRes_Dark = 5,
	EleRes_Healing = 6,
	EleRes_DarkHealing = 0,
	Stat = {
		["Strength"] = {100,300},
		["Defense"] = {100,100},
		["Will"] = {100,300},
		["Resistance"] = {100,100},
		["Agility"] = {100,150},
		["Accuracy"] = {100,100},
		["Evasion"] = {1,1},
		["HP"] = {1000,5000},
		["AP"] = {0,0},
		["LevelRange"] = {60,80},
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


Data.ActMinLevel["Sys.Attack"] = 1		for ak=1,1 do table.insert(Data.Acts,"Sys.Attack") end
temp = { ITM='ITM_EQP_EMERALD', LVL=1, VLT=false }
for ak=1,1 do table.insert(Data.ItemDrop ,temp) end
for ak=1,1 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_PHANTASAR_ANTIDOTE', LVL=1, VLT=false }
for ak=1,1000 do table.insert(Data.ItemDrop ,temp) end
for ak=1,24 do table.insert(Data.ItemSteal,temp) end
Data.ActMinLevel["Abl.ITM_SPORES"] = 1		for ak=1,1000 do table.insert(Data.Acts,"Abl.ITM_SPORES") end


return Data
