--[[
/* 
  

  Copyright (C) 2015 Jeroen P. Broks

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

*/



Version: 15.05.22

]]
realinventory = true

item = {}
itemicons = {}

function IReturn(A,T)
Var.D((T or "$").."RET",A)
return A
end

function LoadItem(ITM)
item[ITM] = item[ITM] or JINC("Script/JINC/IAA/"..ITM..".lua") -- In case you wondered IAA means Items, Abilities & ARMS.
end

function ItemName(ITM)
LoadItem(ITM)
return IReturn(item[ITM].Name)
end

function ItemDesc(ITM)
LoadItem(ITM)
return IReturn(item[ITM].Description)
end

function ItemIcon(ITM,x,y)
LoadItem(ITM)
local i = item[ITM].Icon
if not itemicons[i] then
   itemicons[i] = Image.Load(i)
   if itemicons[i]=="ERROR" then Sys.Error("Icon for item "..ITM.." not loaded!","Icon,"..i) end
   Image.HotCenter(itemicons[i])
   end
Image.Draw(itemicons[i],Sys.Val(x),Sys.Val(y))   
end

function ItemIconCode(ITM)
LoadItem(ITM)
local i = item[ITM].Icon
if not itemicons[i] then
   itemicons[i] = Image.Load(i)
   if itemicons[i]=="ERROR" then Sys.Error("Icon for item "..ITM.." not loaded!","Icon,"..i) end
   Image.HotCenter(itemicons[i])
   end
return IReturn(itemicons[i])
end

function ItemField(ITM,FLD)
LoadItem(ITM)
return IReturn(item[ITM][FLD])
end

function ItemGet(ITM)
LoadItem(ITM)
local r = serialize("ret",item[ITM])
r = r .."\n\nreturn ret"
return IReturn(r)
end
