Rem
	Launcher - Star Story
	Start a new game
	
	
	
	(c) Jeroen P. Broks, 2015, 2016, All rights reserved
	
		This program is free software: you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation, either version 3 of the License, or
		(at your option) any later version.
		
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.
		You should have received a copy of the GNU General Public License
		along with this program.  If not, see <http://www.gnu.org/licenses/>.
		
	Exceptions to the standard GNU license are available with Jeroen's written permission given prior 
	to the project the exceptions are needed for.
Version: 16.05.02
End Rem
Strict
Import "framework.bmx"
Import tricky_units.Dirry
Import tricky_units.Bye


MKL_Version "LAURA II - NewGame.bmx","16.05.02"
MKL_Lic     "LAURA II - NewGame.bmx","GNU General Public License 3"

JCR6CrashError = True
Global NGPanel:TGadget = AddPanel("New Game",New TNewGamePanel)

Global ReservedNames$[] = ["SYSTEM"]


Type TNewGamePanel Extends tfpanelbase

	Field Made = False
	Field NGP:TGadget 
	Field StartNewGame:TGadget 
	Field StartNewGamePlus:TGadget 
	Field YourName:TGadget
	Field Languages:TGadget
	Field PixWendicka:TPixmap = LoadPixmap(JCR_B(JCR,"GFX/Intro/Wendicka.png"))
	Field PanWendicka:TGadget
	Field StartGame:TGadget
	Field GameJoltUserName:TGadget
	Field GameJoltToken:TGadget
	Field Skill:TGadget
	Field Windowed:TGadget
	Field SkipGameJolt:TGadget
	Field YesNo$[] = ["No","Yes"]

	Method Build()
	CreateLabel "Start: ",0,0,300,25,panel
	'?Not Win32
	panwendicka = CreatePanel(tw-PixmapWidth(pixwendicka),th-PixmapHeight(pixwendicka),PixmapWidth(pixwendicka),PixmapHeight(pixwendicka),panel)
	startgame = CreateButton("Start Game",ClientWidth(panWendicka)-100,ClientHeight(PanWendicka)-25,100,25,panwendicka)
	'?
	SetGadgetPixmap panwendicka,pixwendicka
	NGP =  CreatePanel(300,0,300,50,panel)
	StartNewGame = CreateButton("New Game",0,0,300,25,NGP,button_radio)
	StartNewGamePlus = CreateButton("New Game +",0,25,300,25,NGP,Button_radio)
	SetButtonState StartNewGame,True
	startnewgameplus.setenabled False
	CreateLabel "Your name: ",0,50,300,25,panel
	yourname = CreateTextField(300,50,300,25,panel)
	SetGadgetText yourname,StripAll(GetUserHomeDir())
	CreateLabel "Scenario Language:",0,75,300,25,Panel
	languages = CreateListBox(300,75,300,100,panel)
	MGIF_RegisterGadget "Language",Languages
	Local E:TJCREntry,Lang$
	For Local F$=EachIn MapKeys(JCR.Entries)
		If StripDir(F)="SETTINGS" And ExtractDir((ExtractDir(F))) = "LANGUAGES"
			e = TJCREntry(MapValueForKey(JCR.Entries,F))
			Lang$ = StripDir(ExtractDir(e.filename))
			AddGadgetItem languages,lang
			EndIf
		Next
	CreateLabel "Difficulty:",0,175,300,25,Panel
	Skill = CreateListBox(300,175,300,75,Panel)
	AddGadgetItem skill,"Beginner"
	AddGadgetItem skill,"Casual Gamer"
	AddGadgetItem skill,"No Life Gamer"  
	SelectGadgetItem skill,1
	CreateLabel "Start up flags:",0,275,300,25,Panel
	windowed = CreateButton("Windowed",300,275,300,25,Panel,Button_CheckBox)
	SkipGameJolt = CreateButton("Skip GameJolt",300,300,300,25,Panel,Button_CheckBox)
	
	CreateLabel "GameJolt Login. If you don't have a GameJolt account, simply leave the fields below blank",0,375,400,50,Panel
	CreateLabel "UserName:",0,425,300,25,Panel
	CreateLabel "Token:",0,450,300,25,Panel
	GameJoltUserName = CreateTextField(300,425,300,25,Panel)
	GameJoltToken = CreateTextField(300,450,300,25,panel,textfield_password)
	Gamejoltusername.setenabled JCR_Exists(JCR,"Authenticate/GameJolt")
	gamejolttoken.setenabled JCR_Exists(JCR,"Authenticate/GameJolt")
	made = True
	MGIF_RegisterGadget "GameJolt.UserName",GameJoltUserName
	MGIF_RegisterGadget "GameJolt.Token",GameJoltToken	
	MGIF_GetConfig Config
	
	CreateLabel "Anna Login. If you have an Anna account, your achievements will be logged on the Phantasar Productions Website",0,500,400,50,Panel
	CreateLabel "If you don't have or want an Anna account you can skip this part."0,550,400,25
	Rem
	?Win32
	panwendicka = CreatePanel(tw-PixmapWidth(pixwendicka),th-PixmapHeight(pixwendicka),PixmapWidth(pixwendicka),PixmapHeight(pixwendicka),panel)
	startgame = CreateButton("Start Game",ClientWidth(panWendicka)-100,ClientHeight(PanWendicka)-25,100,25,panwendicka)
	?
	End Rem
	End Method

	Method flow()
	If Not made build
	startgame.setenabled SelectedGadgetItem(languages)>=0 And TextFieldText(yourname) And ((Not TextFieldText(GameJoltUserName)) Or (TextFieldText(GameJoltUserName) And TextFieldText(GameJoltToken))) And SelectedGadgetItem(Skill)>=0
	GameJoltToken.setenabled Trim(TextFieldText(GameJoltUserName))<>""
	SkipGameJolt.setenabled  Trim(TextFieldText(GameJoltUserName))<>"" And Trim(TextFieldText(GameJoltToken))<>""
	If EID=event_gadgetaction And ESource = StartGame DoStartNewGame
	End Method

	Method DoStartNewGame()
	Local syscommand$
	Local platform$ 
	Local OpstartFuncties$[] = ["NewGame","NewGamePlus"]
	For Local n$=EachIn ReservedNames
		If Trim(Upper(n)) = Trim(Upper(TextFieldText(YourName))) Return Notify("Cannot launch the game.~nThe word ~q"+n+"~q has been reserved and may therefore not be used as a username.~n~nPlease choose another name!")
		Next
	'Return Notify("Name Accepted!")	 ' Debug line in order not to run the game during testing this out :)
	?MacOS
	platform = "Mac"
	syscommand = "open ~q"+lini.c("Mac")+"~q"
	?Win32
	platform = "Windows"
	syscommand = "~q"+Replace(AppDir,"/","\")+"\"+lini.c("Windows")+"~q"
	?Linux
	platform = "Linux"
	syscommand = "~q"+lini.c("Linux")+"~q"
	?
	Print "Detected platform: "+platform
	CreateDir Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2"),2
	Local BT:TStream = WriteFile(Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/LAURA2run.ini"))	
	If Not BT
		Notify "Unable to write the initiation data the LAURA II engine needs to start up."
		Return
		EndIf
	WriteLine bt,"Add:Resource,"+lini.c("Resource")
	WriteLine bt,"Var:LoadGame=*NONE*"
	WriteLine bt,"Var:StartScript=Start.lua"
	WriteLine bt,"Var:Title=Star Story"
	WriteLine bt,"Var:User="+TextFieldText(YourName)
	WriteLine bt,"Var:StartUpFunction="+OpstartFuncties[ButtonState(StartNewGamePlus)]
	WriteLine Bt,"Var:CodeName=StarStory"
	WriteLine bt,"Var:Language="+GadgetItemText(languages,SelectedGadgetItem(languages))
	WriteLine bt,"Var:Skill="+Int(SelectedGadgetItem(skill)+1)
	If ButtonState(SkipGameJolt)
	   Select Proceed("WARNING!~n~nAs you can only enter your user name and password now and not when loading a game, skipping a GameJolt login now can result in never being able to login to GameJolt with this playthrough if you made a typo in your username or token.~n~nPlease make sure you entered them correctly!~n~n(And I said TOKEN!!! Not PASSWORD!!!)~n~n(Yes = Start with no login, No = Start with login, Cancel = Don't start!)")
		Case  1 WriteLine bt,"Var:IgnoreGameJolt=Yes"  '+YesNo[ButtonState(IgnoreGameJolt) And (Not Sync)]
		Case  0 Notify "Then I shall just login now!"
		Case -1 Return
		End Select
	   EndIf
	If ButtonState(Windowed) WriteLine BT,"Var:Windowed=Yes"
	If TextFieldText(GameJoltUserName)
		WriteLine bt,"Var:GameJoltUser="+TextFieldText(GameJoltUserName)
		WriteLine bt,"Var:GameJoltToken="+TextFieldText(GameJoltToken)
		EndIf
	?MacOS
	Local A$ = AppFile
	While ExtractExt(ExtractDir(A)).toupper()<>"APP" a = ExtractDir(A) Wend
	Print "LAURA II will return to "+A+" when finished!"
	WriteLine bt,"Var:MacReturn="+Replace(A," ","\ ")
	?	
	CloseStream BT
	?Not MacOS
	HideGadget window
	?
	'Print "Executing: "+syscommand
	'Notify "Executing: "+syscommand
	Stopmusic	
	system_ syscommand
	?MacOS
	Bye
	?
	?Not MacOS
	ShowGadget Window
	startmusic
	?
	End Method

	End Type
