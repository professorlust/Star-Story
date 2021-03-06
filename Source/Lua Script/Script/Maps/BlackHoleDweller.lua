--[[
**********************************************
  
  BlackHoleDweller.lua
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
 
version: 16.07.30
]]
function MapBlackHole(OHYEAH)
  Image.Cls()
  BlackHole.Show(bh,400,300)
end

function StartBoss()
  Maps.CamX = 0
  Maps.CamY = 0
  PartyPop('BH',"West")
  MapText("PREBOSS")
  oripos = nil
  CleanCombat()
  Var.D("$COMBAT.BACKGROUND","Phan - Dung.png") -- Just have some value, to prevent a crash
  Var.D("$COMBAT.ALTBACKGROUND","BlackHoleDweller")
  Var.D("$COMBAT.BEGIN","Default")
  Var.D("$COMBAT.FOE1","SuperBoss/BlackHoleDweller")
  Var.D("$COMBAT.ALTCOORDSFOE1","200,300")
  Var.D("%COMBAT.LVFOE1",10000)
  Var.D("$COMBAT.MUSIC",'SpecialBoss/BlackHoleDweller.ogg')
  Var.D('$BLACKHOLE',bh)
  StartCombat()
  Schedule('MAP','PostBoss') 
end

function PostBoss()
  Maps.Obj.Kill('Dweller')
  MapText('POSTBOSS')
  if not ItemGive('ITM_EQP_LOUSYTSHIRT',{'Wendicka','Crystal','Yirl','Foxy','Xenobi','Rolf'},true,false) then CSay("WARNING! Lousy T-Shirt not awarded") end
  Award("BOSS_BLACKHOLEDWELLER")
  BlockWorld("Black Hole")
  LoadMap("Hawk","Bridge")
  Maps.GotoLayer("Bridge")
  SpawnPlayer("Scotty")
  BlackHole.ClearAll()
  -- Sys.Error('Sorry, no postboss script yet')
end

function GALE_OnLoad()
    Music('SpecialBoss/BlackHoleDweller.ogg')
    BlackHole.ClearAll()
    bh = BlackHole.Init('GFX/Space')
    ZA_Enter('BOSS',StartBoss)
end    
