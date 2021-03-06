--[[
  LoadGame.lua
  Version: 15.11.16
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

function FixAblPowerup()
-- This function came to be because the implementation of ABL powerups rendered old savegames unusable
-- I already had too much at the time to fix them all manually so that's why this routine came to be.
if Done("&SYS.ABLPOWERUPFIXED") then return end -- If fixed before, let's not fix it again!
local ch
for ch in each ( mysplit(RPGChar.CharList(),";") ) do
    if RPGChar.ListExist(ch,"ABL_POWERUP")==0 then RPGChar.CreateList(ch,"ABL_POWERUP") end
    end
if RPGChar.CharExists("Wendicka")~=0 then RPGChar.LinkList("UniWendicka","Wendicka","ABL_POWERUP") end    
end

function LoadGame()
Console.Write("Anything to do, after loading the game?")
LoadFlowsScripts()
LoadBaseGraphics()
MS.LN_Run("FIELD","Script/Flow/Field.lua","PlaceTreasures")
MS.Run("FIELD","SetUpAutoClickables")
MS.Run("FIELD","SetUpALB")
RedoMapShow()
FixAblPowerup()
end
