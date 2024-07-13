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
    set_target_properties(${EXECUTABLE_NAME}
            PROPERTIES
            MACOSX_BUNDLE_BUNDLE_NAME ${EXECUTABLE_NAME}
            MACOSX_BUNDLE_COPYRIGHT "Copyright © 1995-2009, ${PROJECT_NAME} , All Rights Reserved."
            MACOSX_BUNDLE_GUI_IDENTIFIER "${PROJECT_NAME}.grahamhill.dev"
            MACOSX_BUNDLE_ICON_FILE "myAppImage.icns"
            MACOSX_BUNDLE_BUNDLE_VERSION 1.0
            MACOSX_BUNDLE_SHORT_VERSION_STRING 1.0
            MACOSX_BUNDLE TRUE
            XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME YES
            XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "dev.grahamhill.${PROJECT_NAME}"
            BUILD_WITH_INSTALL_RPATH TRUE
            INSTALL_RPATH "@executable_path/../Frameworks"
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