--[[
**********************************************
  
  Vulpina - Flower Forest.lua
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
 
version: 16.11.25
]]

-- @USE /Script/Use/Maps/Gen/Next.lua

function Boundaries()
   MS.Run("FIELD","SetScrollBoundaries","1;-2000;2;6400")
   if Maps.LayerCodeName=="#001" then MS.Run("FIELD","SetScrollBoundaries","1;-2000;368;6400") end
end

function MiniGame()
	MapText("TUTORIAL")
	Maps.GotoLayer("#003")
	-- SpawnPlayer("GetLost")
	MS.Load("NIM","Script/Flow/Nim.lua")
	MS.Run("NIM","SetBackChain","Flow='FIELD', victory={stag='MAP', sfun='KotaWin'}, defeat={stag='MAP', sfun='KotaLose'}")
	LAURA.Flow("NIM")
end	

function KotaWin()
  MapText("KOTA.WIN")
  Done("&DONE.WON.NIM")
  MapEXP()
  LoadMap("Hawk","Bridge")
  SpawnPlayer("Welcome")
  ActivateRemotePad('InDenBeginne','Excalibur - Final','Excalibur','Excalibur - Secret Hangar',"#000")
  FirstWorld("Excalibur","ArrivalExcalibur")
  TurnPlayer('North')
  MapText("AfterKota")
  Var.D("$HAWK","AFTERKOTA")
end

function KotaLose()
  MapText("KOTA.LOSE")
end  

function KotaInside()
  TurnPlayer("NORTH")
	MapText("KOTA.TALK1")
	Maps.GotoLayer('Binnen')
	SpawnPlayer('Start')
	Actors.Actor("PLAYER").Visible = 0 -- Crash prevention, that's all! :-P
	Maps.CamX=0
	Maps.CamY=0
	MapText("KOTA.TALK2")
	--Actors.MoveTo("Wendicka",277,152,1)
	--for i=0,20 do DrawScreen() Flip() end
	--Actors.MoveTo("Kota",112,76,1)
	Wen = Maps.Obj.Obj("Wendicka")
	Kot = Maps.Obj.Obj("Kota")
	repeat
	   if Wen.X>277 then Wen.X=Wen.X-1 end
	   if Wen.Y>160 then Wen.Y=Wen.Y-1 end
	   DrawScreen()
	   Flip()
	until Wen.X<=277 and Wen.Y<=160
	Kot.Y=156
	MapText("KOTA.TALK3")
	MiniGame()
end

function NPC_Kota()
  if GetActive()~="Yirl" and (not CVV('&DONE.KOTA')) then
     MapText("KOTA.NOTYIRL")
  elseif (not Done('&DONE.KOTA')) then
     KotaInside()
  elseif not CVV('&DONE.WON.NIM') then
     MapText("KOTA.AGAIN")
     MiniGame()    
  elseif rand(1,skill*2)==1 and (not Done("&DONE.REVEALED.SEWERS")) then
     MapText("KOTA.SEWERS")
     ActivateRemotePad("Start","Vulpina - Sewers","Vulpina","Sewers - Start","#001")
  else
     MapText("KOTA.BANIKA")
  end            
end

function GALE_OnLoad()
  Boundaries()
  Music("Dungeon/Weirdomusic_-_34_-_Fiber_visits_the_Q_Continuum.ogg")
  ZA_Enter("BCheck",Boundaries)
  ZA_Enter("BCheck2",Boundaries)
  ZA_Enter("BCheck3",Boundaries)
end
