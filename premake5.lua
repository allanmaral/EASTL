project "EASTL"
    location "."
    kind "StaticLib"
    language "C++"

    targetdir ("../../../bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../../../bin/obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/EABase/**.h",
        "include/EASTL/**.h",
        "include/EASTL/**.hpp",
        "include/EASTL/**.inl",
        "source/**.cpp"
    }

    includedirs
    {
        "include"
    }

    defines
    {
        "EASTL_OPENSOURCE=1",
        "_CHAR16T",
        "_CRT_SECURE_NO_WARNINGS",
        "_SCL_SECURE_NO_WARNINGS"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"
        exceptionhandling "Off"
        floatingpoint "Fast"
        rtti "Off"
        vectorextensions "SSE2"
        symbols "On"
        warnings "Extra"
    
        flags { "MultiProcessorCompile" }
    
    filter "configurations:Debug"
        defines "_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "NDEBUG"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "NDEBUG"
        runtime "Release"
        optimize "On"