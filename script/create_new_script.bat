@echo off
chcp 65001
:: authorized by saltyzero@foxmail.com
:: VS141 RelWithDebInfo x64

set name=%1

if "%name%"=="" (
echo please input a script name:
set /p name=
) else (
echo %1
)

:: create folders
if exist %name% del /s /q %name% & rd /s /q %name%
if not exist %name% md %name% & md %name%\src

:: create .h and .cpp
echo // 默认编码utf-8 sb微软> %name%\src\%name%.h & echo,>> %name%\src\%name%.h
echo // 默认编码utf-8 sb微软> %name%\src\%name%.cpp & ^
echo,>> %name%\src\%name%.cpp & ^
echo=#include ^"%name%.h^">> %name%\src\%name%.cpp & ^
echo,>> %name%\src\%name%.cpp & ^
echo _module void FreeSC_%name%^(^) { ScriptRegistry^<^>::FreeScript("%name%"); }>> %name%\src\%name%.cpp & ^
echo _module void AddSC_%name%^(bool reload = false^) { new %name%^(^); if (reload) {} }>> %name%\src\%name%.cpp

call :CreateVcxproj
call :CreateVcxprojUser
goto :Exit

:: create .vcxproj for compiling
:CreateVcxproj
if not "%1"=="" (
set name=%1
)
(echo ^<?xml version=^"1.0^" encoding=^"utf-8^"?^> & ^
echo ^<Project DefaultTargets=^"Build^" ToolsVersion=^"15.0^" xmlns=^"http:^/^/schemas.microsoft.com^/developer^/msbuild^/2003^"^> & ^
echo  ^<ItemGroup Label=^"ProjectConfigurations^"^> & ^
echo    ^<ProjectConfiguration Include=^"RelWithDebInfo^|x64^"^> & ^
echo      ^<Configuration^>RelWithDebInfo^<^/Configuration^> & ^
echo      ^<Platform^>x64^<^/Platform^> & ^
echo    ^<^/ProjectConfiguration^> & ^
echo  ^<^/ItemGroup^> & ^
echo  ^<PropertyGroup Label=^"Globals^"^> & ^
echo  ^<Platform^>x64^<^/Platform^> & ^
echo    ^<WindowsTargetPlatformVersion^>10.0.17763.0^<^/WindowsTargetPlatformVersion^> & ^
echo  ^<^/PropertyGroup^> & ^
echo  ^<Import Project=^"$^(VCTargetsPath^)\Microsoft.Cpp.Default.props^" ^/^> & ^
echo  ^<PropertyGroup Condition=^"^'$^(Configuration^)^|$^(Platform^)^'==^'RelWithDebInfo^|x64^'^" Label=^"Configuration^"^> & ^
echo    ^<ConfigurationType^>DynamicLibrary^<^/ConfigurationType^> & ^
echo    ^<UseDebugLibraries^>true^<^/UseDebugLibraries^> & ^
echo    ^<PlatformToolset^>v141^<^/PlatformToolset^> & ^
echo    ^<CharacterSet^>MultiByte^<^/CharacterSet^> & ^
echo  ^<^/PropertyGroup^> & ^
echo  ^<Import Project=^"$^(VCTargetsPath^)\Microsoft.Cpp.props^" ^/^> & ^
echo  ^<ImportGroup Label=^"ExtensionSettings^"^> & ^
echo  ^<^/ImportGroup^> & ^
echo  ^<ImportGroup Label=^"Shared^"^> & ^
echo  ^<^/ImportGroup^> & ^
echo  ^<ImportGroup Condition=^"^'$^(Configuration^)^|$^(Platform^)^'==^'RelWithDebInfo^|x64^'^" Label=^"PropertySheets^"^> & ^
echo    ^<Import Project=^"$^(UserRootDir^)\Microsoft.Cpp.$^(Platform^).user.props^" Condition=^"exists^(^'$^(UserRootDir^)\Microsoft.Cpp.$^(Platform^).user.props^'^)^" Label=^"LocalAppDataPlatform^" ^/^> & ^
echo  ^<^/ImportGroup^> & ^
echo  ^<PropertyGroup Label=^"UserMacros^" ^/^> & ^
echo  ^<PropertyGroup Condition=^"^'$^(Configuration^)^|$^(Platform^)^'==^'RelWithDebInfo^|x64^'^"^> & ^
echo    ^<LibraryPath^>$^(ProjectDir^)..\_lib\;$^(LibraryPath^)^<^/LibraryPath^> & ^
echo  ^<^/PropertyGroup^> & ^
echo  ^<ItemDefinitionGroup Condition=^"^'$^(Configuration^)^|$^(Platform^)^'==^'RelWithDebInfo^|x64^'^"^> & ^
echo    ^<ClCompile^> & ^
echo      ^<WarningLevel^>Level3^<^/WarningLevel^> & ^
echo      ^<Optimization^>MaxSpeed^<^/Optimization^> & ^
echo      ^<SDLCheck^> & ^
echo      ^<^/SDLCheck^> & ^
echo      ^<DebugInformationFormat^>ProgramDatabase^<^/DebugInformationFormat^> & ^
echo      ^<MultiProcessorCompilation^>true^<^/MultiProcessorCompilation^> & ^
echo      ^<InlineFunctionExpansion^>OnlyExplicitInline^<^/InlineFunctionExpansion^> & ^
echo      ^<BasicRuntimeChecks^>Default^<^/BasicRuntimeChecks^> & ^
echo      ^<RuntimeLibrary^>MultiThreadedDLL^<^/RuntimeLibrary^> & ^
echo      ^<RuntimeTypeInfo^>true^<^/RuntimeTypeInfo^> & ^
echo      ^<CompileAs^>CompileAsCpp^<^/CompileAs^> & ^
echo      ^<DisableSpecificWarnings^>4996;4355;4244;4985;4267;4619^<^/DisableSpecificWarnings^> & ^
echo      ^<TreatSpecificWarningsAsErrors^>4263;4264^<^/TreatSpecificWarningsAsErrors^> & ^
echo      ^<AdditionalIncludeDirectories^>$^(ProjectDir^)..\..\script\_include;$^(ProjectDir^)..\..\script\_include\common;$^(ProjectDir^)..\..\script\_include\common\Collision;$^(ProjectDir^)..\..\script\_include\common\Database;$^(ProjectDir^)..\..\script\_include\common\DataStores;$^(ProjectDir^)..\..\script\_include\common\Dynamic;$^(ProjectDir^)..\..\script\_include\common\Packets;$^(ProjectDir^)..\..\script\_include\common\Threading;$^(ProjectDir^)..\..\script\_include\common\Utilities;$^(ProjectDir^)..\..\script\_include\Detour;$^(ProjectDir^)..\..\script\_include\Recast;$^(ProjectDir^)..\..\script\_include\mariadb;%%^(AdditionalIncludeDirectories^)^<^/AdditionalIncludeDirectories^> & ^
echo      ^<AdditionalOptions^>%%^(AdditionalOptions^) ^/Zm500 ^/utf-8^<^/AdditionalOptions^> & ^
echo      ^<PreprocessorDefinitions^>WIN32;_WINDOWS;NDEBUG;_CONF_DIR=^"conf^";_WIN64;MARIADB;_module=extern ^"C^" _declspec^(dllexport^);_interface= _declspec^(dllimport^);%%^(PreprocessorDefinitions^)^<^/PreprocessorDefinitions^> & ^
echo    ^<^/ClCompile^> & ^
echo    ^<Link^> & ^
echo      ^<AdditionalLibraryDirectories^>%%^(AdditionalLibraryDirectories^)^<^/AdditionalLibraryDirectories^> & ^
echo      ^<AdditionalDependencies^>kernel32.lib;user32.lib;gdi32.lib;winspool.lib;shell32.lib;ole32.lib;oleaut32.lib;uuid.lib;comdlg32.lib;advapi32.lib;ace.dll;worldserver.dll^<^/AdditionalDependencies^> & ^
echo      ^<IgnoreSpecificDefaultLibraries^>%%^(IgnoreSpecificDefaultLibraries^)^<^/IgnoreSpecificDefaultLibraries^> & ^
echo      ^<GenerateDebugInformation^>true^<^/GenerateDebugInformation^> & ^
echo      ^<SubSystem^>Console^<^/SubSystem^> & ^
echo    ^<^/Link^> & ^
echo    ^<ProjectReference^> & ^
echo      ^<LinkLibraryDependencies^>false^<^/LinkLibraryDependencies^> & ^
echo    ^<^/ProjectReference^> & ^
echo    ^<PostBuildEvent^> & ^
echo      ^<Command^>xcopy ^/Y ^"$^(OutDir^)$^(TargetFileName^)^" ^"$^(ProjectDir^)..\^" & ^
echo if exist conf\*.conf.dist xcopy ^/Y ^"^$^(ProjectDir^)conf\*.dist^" ^"^$^(ProjectDir^)..\..\conf\^"^<^/Command^> & ^
echo    ^<^/PostBuildEvent^> & ^
echo  ^<^/ItemDefinitionGroup^> & ^
echo  ^<ItemGroup^> & ^
echo    ^<ClInclude Include=^"src\*.h^" ^/^> & ^
echo  ^<^/ItemGroup^> & ^
echo  ^<ItemGroup^> & ^
echo    ^<ClCompile Include=^"src\*.cpp^" ^/^> & ^
echo  ^<^/ItemGroup^> & ^
echo  ^<Import Project=^"$^(VCTargetsPath^)\Microsoft.Cpp.targets^" ^/^> & ^
echo  ^<ImportGroup Label=^"ExtensionTargets^"^> & ^
echo  ^<^/ImportGroup^> & ^
echo ^<^/Project^>)> "%name%\%name%.vcxproj"
goto :eof

:: create .vcxproj.user only for debugging
:CreateVcxprojUser
if not "%1"=="" (
set name=%1
)
(echo ^<?xml version=^"1.0^" encoding=^"utf-8^"?^> & ^
echo ^<Project ToolsVersion=^"14.0^" xmlns=^"http:^/^/schemas.microsoft.com^/developer^/msbuild^/2003^"^> & ^
echo  ^<PropertyGroup Condition=^"^'$^(Configuration^)^|$^(Platform^)^'==^'RelWithDebInfo^|x64^'^"^> & ^
echo    ^<LocalDebuggerCommand^>$^(ProjectDir^)..\..\worldserver.exe^<^/LocalDebuggerCommand^> & ^
echo    ^<DebuggerFlavor^>WindowsLocalDebugger^<^/DebuggerFlavor^> & ^
echo    ^<LocalDebuggerWorkingDirectory^>$^(ProjectDir^)..\..^<^/LocalDebuggerWorkingDirectory^> & ^
echo    ^<LocalDebuggerAttach^>false^<^/LocalDebuggerAttach^> & ^
echo  ^<^/PropertyGroup^> & ^
echo ^<^/Project^>)> "%name%\%name%.vcxproj.user"
goto :eof

:Exit
start %name%
Pause