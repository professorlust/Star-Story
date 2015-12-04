; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; A few notes on the buildup of this script!
; The game is originally created on a mac, basically Windows has only been used for compiling the game itself and testing the game.
; WINE for Mac does support using Inno Setup 5 which was used for this script, and thus the installer itself was created using WINE.
; WINE uses an 'fake C: drive' to store the stuff a normal Windows App would and the "real" Mac file system is within WINE assigned to the Z: drive
; As such the USB Hard Drive on which the project was stored was codenamed "irravonia" and there we got the the origin of the "stange looking path names"

; The GameJolt.net file is not present on this GitHub repository and will never be either. It is only released with official stable game releases for security reasons.
; By the way I can already tell you this, it is pointless the include the file with modified versions of the game, or games of a different version, the file will simply fail to work.

; Several changes are very likely to be made to this file depending on the upcoming release. (I guess that was pretty obvious).

#define MyAppName "Star Story"
#define MyAppVersion "?.?"
#define MyAppPublisher "Jeroen 'Phantasar Productions' Broks"
#define MyAppURL "http://starstory.sourceforge.net"
#define MyAppExeName "Star Story.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C0DD51D3-D1E1-48D9-B59B-FEFF730E997C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
LicenseFile=Z:\volumes\irravonia\Projects\BlitzMax\JCR6+\LAURA II\Design\Star Story\GitHub\clone\Star-Story\License\License.rtf
OutputDir=Z:\Volumes\Irravonia\Releases\Star Story\Windows\Installer
OutputBaseFilename=Setup_StarStory_Demo_WithoutMusic
SetupIconFile=Z:\volumes\irravonia\Projects\BlitzMax\JCR6+\LAURA II\Design\Star Story\GitHub\clone\Star-Story\Installers\InnoSetup\Wendicka.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; The launcher. As such also the file being called from the start menu.
Source: "Z:\volumes\irravonia\Releases\Star Story\Windows\Star Story.exe"; DestDir: "{app}"; Flags: ignoreversion         
; The engine. Should only be called by the laucher, as such no links will be made to it.
Source: "Z:\volumes\irravonia\Releases\Star Story\Windows\LAURA2.exe"; DestDir: "{app}"; Flags: ignoreversion
; Initial data the engine and the launcher need.
Source: "Z:\volumes\irravonia\Releases\Star Story\Windows\Init.ini"; DestDir: "{app}"; Flags: ignoreversion
; The JCR files containing all the scripts and assets of the game.
;Source: "Z:\volumes\irravonia\Releases\Star Story\OSX\Star Story.app\Contents\Resources\StarStory_Music.JCR"; DestDir: "{app}"; Flags: ignoreversion                                                           
Source: "Z:\volumes\irravonia\Releases\Star Story\OSX\Star Story.app\Contents\Resources\StarStory.JCR"; DestDir: "{app}"; Flags: ignoreversion
; This file is needed to contact GameJolt, however it will only be provided with stable releases and not on the repository. 
Source: "Z:\volumes\irravonia\Releases\Star Story\OSX\Star Story.app\Contents\Resources\GameJolt.net"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

