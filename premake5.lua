--Game name, default is TemplateGame, change this to whatever you want.
GAME_PROJ_NAME = "TemplateGame"

--Required for including engine lib includes which are added in the DoughEngine premake file.
libIncludeDirs = {};
--Reuired for linking engine static lib.
ENGINE_PROJ_NAME = "DoughEngine"

workspace(GAME_PROJ_NAME)

	startproject(GAME_PROJ_NAME)

	--Engine
	include("Dough/premake5.lua")

	project(GAME_PROJ_NAME)
		kind("ConsoleApp")
		language("C++")
		cppdialect("C++17")

		dependson(ENGINE_PROJ_NAME)

		includedirs { libIncludeDirs, "%{wks.location}/Dough/Dough/src/", "%{wks.location}/Dough/Dough/libs/" }

		outputDir = "%{cfg.architecture}/%{cfg.buildcfg}/"
		targetdir(outputDir .. "final/")
		objdir(outputDir .. "inter/")

		libdirs { "Dough/%{cfg.architecture}/%{cfg.buildcfg}/final/" }
		links { ENGINE_PROJ_NAME }

		files {
			"src/**.h",
			"src/**.cpp"
		}

		filter("configurations:DEBUG")
			defines { "DEBUG", "_DEBUG" }
			symbols("On")

		filter("configurations:TRACING")
			defines { "NDEBUG", "_NDEBUG", "_TRACING", "TRACY_ENABLE", "_CRT_SECURE_NO_WARNINGS" } --Tracy uses some functions that cause warnings
			optimize("On")

		filter("configurations:RELEASE")
			defines { "NDEBUG", "_NDEBUG", "_RELEASE" }
			optimize("On")