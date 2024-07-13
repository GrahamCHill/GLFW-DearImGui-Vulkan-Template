message(STATUS "Post-Build commands are supported")
# macOS build
if (APPLE)

    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/PostApple.cmake)

    # Linux Build
elseif (NOT APPLE AND UNIX)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/PostLinux.cmake)

    # Windows Build
elseif (NOT APPLE AND NOT UNIX)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/PostWindows.cmake)

endif ()
