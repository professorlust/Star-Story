--[[
  Loading.lua
  
  version: 15.09.15
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
]]

---------------------------------------
-- This is just a quick loading icon --
-- This script does NOT provide the  --
-- "LOADING" banner at the loading   --
-- of the game itself (as that's     --
-- an engine thingy)                 --
---------------------------------------

function Loading()
if Image.Loaded("STICKY")==0 then Image.AssignLoad("STICKY","GFX/System/flash-drive-usb-stick.png") end
White()
Image.Show("STICKY",5,5)
Flip()
end
