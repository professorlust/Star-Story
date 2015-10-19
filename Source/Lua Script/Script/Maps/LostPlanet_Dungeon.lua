--[[
**********************************************
  
  LostPlanet_Dungeon.lua
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
 
version: 15.10.19
]]

-- Switch routine (in case we need it)
function OnLayerSwitch(layer)
	CSay("Switched to layer: "..layer)
end


-- Stairways
function GoNext()
	local c = Sys.Val(right(Maps.LayerCodeName,3))
	c = c + 1
	local lay = "#"..right("00"..c,3)
	Maps.Obj.Kill("PLAYER")
	Maps.GotoLayer(lay)
	SpawnPlayer("Start")
end

function GoPrev()
	local c = Sys.Val(right(Maps.LayerCodeName,3))
	c = c - 1
	local lay = "#"..right("00"..c,3)
	Maps.Obj.Kill("PLAYER")
	Maps.GotoLayer(lay)
	SpawnPlayer("Einde")
end

-- Back to your cell
function ToCell()
	LoadMap("LostPlanet_Dungeon_Cell")
	SpawnPlayer("Einde")
	TurnPlayer("South")
end

-- "Rock around the clock" puzzle (#003)
function ClockPlate(num)
	local good
	Actors.MoveToSpot("PLAYER","ClockPlate"..num)
	numorder = numorder or {}
	numpressed = numpressed or {}
	if numpressed[num] then return end
	SFX("Audio/SFX/Gen/whoosh.ogg")
	numorder[#numorder+1]=num
	numpressed[num]=true
	Maps.Obj.Obj("ClockPlate"..num).Frame=1
	if #numorder==12 then
		good=true
		for i,v in ipairs(numorder) do 
			good = good and i==v
		end
		if good then 
			for i=1,12 do
				Maps.PermaWrite("Maps.Obj.Obj('ClockPlate"..i.."').Frame=1") -- seal all doors.
			end
			Maps.Obj.Kill("ClockDoor",1)
		else
			for i=1,12 do 
				Maps.Obj.Obj("ClockPlate"..i).Frame=0
				numorder = nil
				numpressed = nil
			end			
		end
	end
end

	
function CLICK_ARRIVAL_ClockPlate1 () ClockPlate( 1) end
function CLICK_ARRIVAL_ClockPlate2 () ClockPlate( 2) end
function CLICK_ARRIVAL_ClockPlate3 () ClockPlate( 3) end
function CLICK_ARRIVAL_ClockPlate4 () ClockPlate( 4) end
function CLICK_ARRIVAL_ClockPlate5 () ClockPlate( 5) end
function CLICK_ARRIVAL_ClockPlate6 () ClockPlate( 6) end
function CLICK_ARRIVAL_ClockPlate7 () ClockPlate( 7) end
function CLICK_ARRIVAL_ClockPlate8 () ClockPlate( 8) end
function CLICK_ARRIVAL_ClockPlate9 () ClockPlate( 9) end
function CLICK_ARRIVAL_ClockPlate10() ClockPlate(10) end
function CLICK_ARRIVAL_ClockPlate11() ClockPlate(11) end
function CLICK_ARRIVAL_ClockPlate12() ClockPlate(12) end


-- Init everything right
function GALE_OnLoad()
	Music('Dungeon/Dungeon1.ogg')
	ZA_Enter("Next",GoNext)
	ZA_Enter("Prev",GoPrev)
	ZA_Enter("ToCell",ToCell)
	for i=1,12 do AddClickable("ClockPlate"..i) end
end