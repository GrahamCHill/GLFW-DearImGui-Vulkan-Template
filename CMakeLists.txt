cmake_minimum_required(VERSION 3.27)
project("Vulkan_App_Template")
set(EXECUTABLE_NAME ${PROJECT_NAME})
# Change settings in the file below
include(Settings.cmake)
set(CMAKE_CXX_STANDARD 17)


message(STATUS "Project Name: ${EXECUTABLE_NAME}")


# Handles Platform specific code
include(CMake/CMakeLists.txt)
# Includes Submodules
include(Submodules/CMakeLists.txt)
# Where your files will go
include(src/CMakeLists.txt)

# macOS build
if(APPLE)
    target_include_directories(${EXECUTABLE_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})
    target_link_libraries(${EXECUTABLE_NAME}
            ${Vulkan_LIBRARIES}
            ${TARGET_LIBS}
    )

    # Linux Build
elseif (NOT APPLE AND UNIX)
    target_link_libraries(${EXECUTABLE_NAME}
            ${Vulkan_LIBRARIES}
            ${TARGET_LIBS}
    )

    # Windows Build
elseif (NOT APPLE AND NOT UNIX)
    set(CMAKE_EXE_LINKER_FLAGS -static)
    target_include_directories(${EXECUTABLE_NAME}
            PRIVATE ${Vulkan_INCLUDE_DIRS})

    target_link_libraries(${EXECUTABLE_NAME}
            ${Vulkan_LIBRARIES}
            ${TARGET_LIBS})

    set_target_properties(${EXECUTABLE_NAME} PROPERTIES
            CMAKE_CXX_STANDARD_REQUIRED ON
            CMAKE_INCLUDE_CURRENT_DIR  ON
            CXX_EXTENSIONS NO)
    set(CMAKE_EXE_LINKER_FLAGS -static)
endif ()

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/CMakeLists.txt)