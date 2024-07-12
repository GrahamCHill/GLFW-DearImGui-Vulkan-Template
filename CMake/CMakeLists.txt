set(GLFW_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/external/glfw)
add_subdirectory(${GLFW_DIR} binary_dir EXCLUDE_FROM_ALL)
include_directories(${GLFW_DIR}/include)

# Currently not supporting a vulkan web build, it will only support the opengl fallback
if (NOT  EMSCRIPTEN)
    find_package(Vulkan REQUIRED)
endif ()

include(${CMAKE_CURRENT_SOURCE_DIR}/Submodules/CMakeLists.txt)


if(APPLE AND NOT EMSCRIPTEN)
    message(STATUS "Non-web Build")
    message(STATUS "Apple macOS App Bundle Build")
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformApple.txt)


elseif (UNIX AND EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Web Build")
    message(STATUS "Emscripten Build")
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformWeb.txt)


elseif(UNIX AND NOT EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Non-web Build")
    message(STATUS "Linux/Unix Build")
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformLinux.txt)


elseif(NOT UNIX AND NOT EMSCRIPTEN AND NOT APPLE)
    message(STATUS "Non-web Build")
    message("Windows Build")
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PlatformWindows.txt)


endif()