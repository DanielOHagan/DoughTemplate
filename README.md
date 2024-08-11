# DoughTemplate

This acts as an "installation guide" and will provide a bare bones template for starting a project using Dough.
Due to restrictions on some libraries only Visual Studio versions, 2012 through 2022 will work with Dough.

## Getting Started
It only takes a few steps to get a workspace/solution set up.

1. Clone this repository with its submodule.
2. Open the premake5.lua and change the *GAME_PROJ_NAME* variable to whatever you want.
3. Run premake5.exe with your desired premake action (see https://premake.github.io/docs/Using-Premake#using-premake-to-generate-project-files). NOTE:: As mentioned before, only the Visual Studio version 2012 through 2022 will work with Dough.
4. Open the .sln, find cloneRepo/src/Main.cpp and run to make sure the default demo project runs.
