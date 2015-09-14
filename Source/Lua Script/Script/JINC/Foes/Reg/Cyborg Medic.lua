--[[
**********************************************
  
  Cyborg Medic.lua
  (c) Jeroen Broks, 2015, All Rights Reserved.
  
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
 
version: 15.09.14
]]


-- Version 15.09.14



Data = {
	Name = "Cyborg Medic",
	Desc = "All she will do is to heal her comrades, whether or not any healing is required.",
	ImageFile = "Reg/Cyborg Medic.png",
	AI = "Default",
	Stat = {
		["Strength"] = {5,6},
		["Defense"] = {1,5},
		["Will"] = {5,8},
		["Resistance"] = {10,20},
		["Agility"] = {5,15},
		["Accuracy"] = {1,6},
		["Evasion"] = {5,6},
		["HP"] = {50,60},
		["AP"] = {0,0},
		["LevelRange"] = {5,10},
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Abl.ITM_ADHBANDAGE"] = 1		for ak=1,1 do table.insert(Data.Acts,"Abl.ITM_ADHBANDAGE") end
Data.ActMinLevel["Abl.ITM_BANDAGE"] = 1		for ak=1,1 do table.insert(Data.Acts,"Abl.ITM_BANDAGE") end
Data.ActMinLevel["Abl.ITM_HEALINGCAPSULE"] = 1		for ak=1,100 do table.insert(Data.Acts,"Abl.ITM_HEALINGCAPSULE") end
temp = { ITM='ITM_HEALINGCAPSULE', LVL=1, VLT=false }
for ak=1,100 do table.insert(Data.ItemDrop ,temp) end
for ak=1,100 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_VLUGZOUT', LVL=6, VLT=false }
for ak=1,5 do table.insert(Data.ItemDrop ,temp) end
for ak=1,1 do table.insert(Data.ItemSteal,temp) end


return Data
