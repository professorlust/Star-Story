--[[
  Next.lua
  Version: 16.01.24
  Copyright (C) 2015, 2016 Jeroen Petrus Broks
  
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
if not (Next and Prev) then

N_NextList = N_NextList or {}
N_PrevList = N_PrevList or {}

EnterArea = EnterArea or {}

function Next()
local x,y = GetCoords()
Actors.StopMoving('PLAYER')
--Actors.MoveTo('PLAYER',x,-64,1)
--WalkWait()
local c = Sys.Val(right(Maps.LayerCodeName,3))
c = c + 1
local lay = "#"..right("00"..c,3)
Maps.Obj.Kill("PLAYER")
Maps.GotoLayer(lay)
SpawnPlayer("Start")
TurnPlayer("North")
for f in each(N_NextList) do f() end
(EnterArea[lay] or function() end)()
end

function Prev()
local x,y = GetCoords()
Actors.StopMoving('PLAYER')
--Actors.MoveTo('PLAYER',x,3300,1)
--WalkWait()
local c = Sys.Val(right(Maps.LayerCodeName,3))
c = c - 1
local lay = "#"..right("00"..c,3)
Maps.Obj.Kill("PLAYER")
Maps.GotoLayer(lay)
SpawnPlayer("Einde")
TurnPlayer("South")
for f in each(N_PrevList) do f() end
(EnterArea[lay] or function() end)()
end

function ExtraNext(f)
if not type(f)=='function' then Sys.Error("Extra Next only allows functions!") end
N_NextList[#N_NextList+1]=f
end


function ExtraPrev(f)
if not type(f)=='function' then Sys.Error("Extra Prev only allows functions!") end
N_PrevList[#N_PrevList+1]=f
end



ZA_Enter("Next",Next)
ZA_Enter("Prev",Prev)

end
