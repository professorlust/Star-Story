--[[
**********************************************
  
  Foxy.lua
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
 
version: 15.10.12
]]
RPGChar.SetData("Foxy","INVITEM1","HEALINGCAPSULE")
RPGStat.SetStat("Foxy","INVAMNT1",3)
RPGChar.SetData("Foxy","INVITEM2","FIRSTAIDKIT")
RPGStat.SetStat("Foxy","INVAMNT2",7)
RPGChar.SetData("Foxy","INVITEM2","ANTIDOTE")
RPGStat.SetStat("Foxy","INVAMNT2",8)
RPGChar.DefStat("Foxy","AMMO_BASE",6)
RPGChar.DefStat("Foxy","Level",30/skill)
Console.Write("Let's welcome Foxy!",0,255,0)
