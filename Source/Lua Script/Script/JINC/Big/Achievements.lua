--[[
**********************************************
  
  Achievements.lua
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
 
version: 15.10.04
]]
-- This file has be generated by Tricky's MyData
-- 04 Oct 2015; 17:34:59
-- License: If stripped from any reference to the story line and its characters, this file becomes zLib



ret = {
	["ALLABL_CRYSTAL"] = {
		["Description"] = "Collect all of Crystal's special arrows for her bionic arm",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Wild Arms",
		["Type"] = "Silver"},
	["ALLABL_EXHURU"] = {
		["Description"] = "Unlock all moves for either ExHuRU, Rof or Johnson",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "Hasta la vista, baby",
		["Type"] = "Silver"},
	["ALLABL_FOXY"] = {
		["Description"] = "Unlock all of Foxy's special moves",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "I'm Sexy and I know it",
		["Type"] = "Silver"},
	["ALLABL_WENDICKA"] = {
		["Description"] = "Obtain all abilities Wendicka can get",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "It's ELECTRIFYING",
		["Type"] = "Silver"},
	["ALLABL_XENOBI"] = {
		["Description"] = "Unlock all of Xenobi's \"power\" spells",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "May the power be with you",
		["Type"] = "Silver"},
	["ALLABL_YIRL"] = {
		["Description"] = "Unlock all of Yirl's special moves",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Great shot, kid! That was one in a million!",
		["Type"] = "Silver"},
	["ASMALLSTEPFORMAN"] = {
		["Description"] = "Have one male character make at least one step",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "A small step for man, but a giant leap for mankind",
		["Type"] = "Bronze"},
	["KILL00001"] = {
		["Description"] = "Do your first kill!",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "He's dead, Jim!",
		["Type"] = "Bronze"},
	["KILL00394"] = {
		["Description"] = "Kill 394 enemies",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Turn to page 394!",
		["Type"] = "Silver"},
	["MAXLVL_CRYSTAL"] = {
		["Description"] = "Have Crystal at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Resistance is futile",
		["Type"] = "Gold"},
	["MAXLVL_EXHURU"] = {
		["Description"] = "Have ExHuRU, Rolf or Johnson at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "I'll be back",
		["Type"] = "Gold"},
	["MAXLVL_FOXY"] = {
		["Description"] = "Have Foxy at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "I'm too sexy for this game!",
		["Type"] = "Gold"},
	["MAXLVL_WENDICKA"] = {
		["Description"] = "Have Wendicka at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Somewhere over the rainbow",
		["Type"] = "Gold"},
	["MAXLVL_XENOBI"] = {
		["Description"] = "Have Xenobi at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "I've got the power!",
		["Type"] = "Bronze"},
	["MAXLVL_YIRL"] = {
		["Description"] = "Have Yirl at the maximum level",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Never tell me the odds",
		["Type"] = "Gold"},
	["PERFECTSTREAK0005"] = {
		["Description"] = "Have a streak of five perfect victories",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Five nights at Wendicka's",
		["Type"] = "Silver"},
	["PERFECTVICTORY0001"] = {
		["Description"] = "Win a battle without receiving any damage.",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "It's got to be PERFECT!",
		["Type"] = "Bronze"},
	["PERFECTVICTORY0010"] = {
		["Description"] = "Win 10 victories without taking damage",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "It's such a perfect day",
		["Type"] = "Bronze"},
	["RICKROLLED"] = {
		["Description"] = "Have one of the female characters to speak to Rick outside the bar",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "Rickrolled",
		["Type"] = "Bronze"},
	["SAVETERMINAL30"] = {
		["Description"] = "Use the save terminal on board the Hawk at least 30 times",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Marked for Review",
		["Type"] = "Silver"},
	["SCENARIO_BEAMMEUP"] = {
		["Description"] = "Use a teleport pad to beam yourself up to the Hawk at least once",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Beam me up, Scotty!",
		["Type"] = "Bronze"},
	["SCENARIO_CRYSTALFATHER"] = {
		["Description"] = "Discover the role of Crystal's father in the story",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "The Undiscovered Bounty",
		["Type"] = "Gold"},
	["SCENARIO_ESCAPEEXCALIBUR"] = {
		["Description"] = "Escape the space station Excalibur",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "To boldly go where no one has gone before",
		["Type"] = "Bronze"},
	["SCENARIO_FINALDUNGEON"] = {
		["Description"] = "Enter the final dungeon",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "The Final Frontier",
		["Type"] = "Gold"},
	["SCENARIO_GODDESSRELEASED"] = {
		["Description"] = "Release the Goddess from Wendicka",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "It's life, Jim, but not as we know it",
		["Type"] = "Bronze"},
	["SCENARIO_PHANTASAR"] = {
		["Description"] = "Find the galaxy of Phantasar",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "Long ago in a galaxy far away",
		["Type"] = "Gold"},
	["SCENARIO_PROLOGUE"] = {
		["Description"] = "Complete the prologue",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "You are NOT prepared!",
		["Type"] = "Bronze"},
	["SCENARIO_WENDICKAPREGNANT"] = {
		["Description"] = "Discover Wendicka is pregnant",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Achieved",
		["Title"] = "The Next Generation",
		["Type"] = "Silver"},
	["SECRETDUNGEON_DARKCAVES"] = {
		["Description"] = "Complete \"Dark Caves of Shilington\"",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Beware of the Dark Side",
		["Type"] = "Bronze"},
	["VICTORY00017"] = {
		["Description"] = "Win 17 battles",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "True Q",
		["Type"] = "Bronze"},
	["VICTORY00025"] = {
		["Description"] = "Win 25 battles",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Twenty Five",
		["Type"] = "Bronze"},
	["VICTORY00050"] = {
		["Description"] = "Win 50 battles",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "Fifty Shades of Grey",
		["Type"] = "Silver"},
	["VICTORY00100"] = {
		["Description"] = "Win 100 battles",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "The 100",
		["Type"] = "Gold"},
	["VICTORY01000"] = {
		["Description"] = "Win 1000 battles",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "A thousand years",
		["Type"] = "Platinum"},
	["WINGAME"] = {
		["Description"] = "Complete the game",
		["Icon"] = "*DEFAULT*",
		["Show"] = "Always",
		["Title"] = "We are the Heroes of our Time",
		["Type"] = "Platinum"}}



-- Got all data, let's now return it!
return ret
