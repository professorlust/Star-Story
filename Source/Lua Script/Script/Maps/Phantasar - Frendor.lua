--[[
**********************************************
  
  Phantasar - Frendor.lua
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
 
version: 16.05.15
]]

rosettavar = "&DONE.SPOKEN.ROSETTA"
rosetta = Var.C(rosettavar)=='TRUE'

reggie = Maps.Obj.Obj("Feena_Reggie")
reggie.Visible = 0

mpts = { [true] = "CANSPEAK", [false] = "CANNOTSPEAK"}

function RosettaText(Tag)
	MapText(Tag.."."..mpts[rosetta])
end

function NPC_Rosetta()
	if Done(rosettavar) then
		MapText("ROSETTA")
	else
		rosetta=true
		MapText("ROSETTA_PRE")
		PartyPop("Rosetta")
		MapText("ROSETTA_FIRST")
		PartyUnPop()
	end
end

function NPC_FEENALARIA()
	if rosetta then
		if not Done("&DONE.PHANTASAR.FEENA_1") then
			MapText("FEENA_1A")
			PartyPop("Feena")
			reggie.Visible = 1
			MapText("FEENA_1B")
			KickReggie("East","Feena_Foxy","Feena_Reggie")
			MapText("FEENA_1C")
			PartyUnPop()
			reggie.Visible = 0
		else
			MapText("FEENA_ONLYHOPE")	
		end	
	else
	   MapText("FEENA_HUH")
	end
end

function NPC_Scyndi()    RosettaText("SCYNDI")    end
function NPC_Irravonia() RosettaText("Irravonia") end

function NPC_Merya()
	RosettaText("MERYA")
	if (not rosetta) and Done("&DONE.PHANTASAR.MERYA.KICK.REGGIE") then return end
	SetActive("Foxy")
	Actors.ChoosePic('PLAYER',"FOXY.NORTH")
	MapText("MERYA.REGGIE")
	local ireggie = Image.Load("GFX/Scenario/Reggie_Big.png")
	Image.HotCenter(ireggie)
	local x = Actors.PX("PLAYER")
	local y = Actors.PY("PLAYER")
	for scale=0,200 do
	    DrawScreen()
	    Image.ScalePC(scale)
	    Image.Rotate(scale*2)
	    Image.Draw(ireggie,x,y)
	    Flip()
	end
	local flits = false
	SFX("Audio/SFX/Scenario/Reggie_Crash.ogg")
	for i=0,10 do
	    flits = not flits 
	    CSay(sval(flits));
	    white=white or White
	    black=black or Black;
	    ({[true]=white,[false]=black})[flits==true]()	   
		  Image.Rect(0,0,800,600)
		  Flip()
	end
	Cls() Flip() Cls() Flip() -- Make sure the screen is dark
	MapShow("NIETS")
	Time.Sleep(100)
	MapShow("*ALL*")
	reggie.Visible = 0	  
	Award("SCENARIO_CRASH")    	    
end

function GALE_OnLoad()
	Music('Dungeon/Enchanted Valley.ogg')
	NPC_SAVESPOT = savespot.blue
	ZA_Enter("Byebye",GoWorld,"Phantasar")
end


-- @USE Phantasar.lua