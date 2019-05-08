@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
SET THIS=%~nx0
SET PARAMETER=%1
SET ASSETS=".\Assets"
SET FOLDERS="Animations" "Audio" "Fonts" "Prefabs" "Materials" "Models" "Scenes" "Scripts" "Shaders" "Sprites" "Textures" "Tilemaps" "UI"
SET ADDITIONAL_FOLDERS="Editor" "Editor Default Resources" "Gizmos" "Plugins" "Resources" "StreamingAssets"

ECHO ================================================================================
ECHO  Unity Project - Initial Folder Setup
ECHO  Copyright (c) 2019, Kishimoto Studios. All Rights Reserved.
ECHO  contact@kishimotostudios.com
ECHO ================================================================================
ECHO - Remember to put this file in your project root folder, next to the Assets folder.
ECHO - (Optional) Rename %THIS% to .%THIS% (put a dot as the first character of the filename) so Unity can ignore the file.
ECHO - Use '%THIS% all' to create special folders (Editor, Resources, etc.)
ECHO.

IF NOT EXIST "%ASSETS%" (
	GOTO ERROR_ASSETS_FOLDER_NOT_FOUND
)

FOR %%F in (%FOLDERS%) DO (
	<NUL SET /P=Creating folder %%F... 
	IF NOT EXIST "%ASSETS%\"%%F"" (
		mkdir "%ASSETS%\"%%F""
		ECHO OK!
	) ELSE (
		ECHO Folder already exists, skipping.
	)
)

IF /I "%PARAMETER%"=="all" (
	ECHO.
	ECHO Parameter 'all' passed, creating special folders...
	FOR %%F in (%ADDITIONAL_FOLDERS%) DO (
		<NUL SET /P=Creating folder %%F... 
		IF NOT EXIST "%ASSETS%\"%%F"" (
			mkdir "%ASSETS%\"%%F""
			ECHO OK!
		) ELSE (
			ECHO Folder already exists, skipping.
		)
	)
)

ECHO.
SET /P=All done! Press ENTER to continue...

:END
ENDLOCAL
ECHO ON
@EXIT /B 0

:ERROR_ASSETS_FOLDER_NOT_FOUND
ECHO Are you running this file in your project root folder?
SET /P=Press ENTER to continue...
GOTO END