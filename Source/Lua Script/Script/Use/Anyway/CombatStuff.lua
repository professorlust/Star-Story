--[[
  CombatStuff.lua
  Version: 15.09.03
  Copyright (C) 2015 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
function CleanCombat()
for k in IVARS() do
    if prefixed(k,"$COMBAT.") or prefixed(k,"%COMBAT.") or prefixed(k,"&COMBAT.") then 
       Var.Clear(k)
       CSay("Destroyed: "..k) 
       end 
    end
end    

function RandomBossTune()
if not musicavailable then CSay("No Music Available, so let's forget about a random boss tune.") end
if not bossmusiclist then
   bossmusiclist = {}
   for f in iJCR6Dir(true) do
       if prefixed(f,"MUSIC/BOSS/") and suffixed(f,".OGG") then 
           -- table.insert(bossmusiclist,replace(f,"MUSIC/","")) -- Suddenly for no reason at all, Lua doesn't accept strings for parameter #2. It always did, and in a test version of Lua it still did, but here it doesn't. Odd!
           bossmusiclist[#bossmusiclist+1]=f -- Well when the official method doesn't work, then we have to go for this ugly alternative. 
           end  
       end
   end    
Var.D("$COMBAT.MUSIC",bossmusiclist[rand(1,#bossmusiclist)])   
end
