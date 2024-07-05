cmake_minimum_required(VERSION 3.28)
project(Vulkan_New)
set(CMAKE_CXX_STANDARD 17)


if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    option(BUILD_HTML "Build html also!" ON)
    set(EMSCRIPTEN TRUE)
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
endif()

if(APPLE AND NOT EMSCRIPTEN)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    #set(CMAKE_OSX_ARCHITECTURES "arm64") #Arm64 systems
    #set(CMAKE_OSX_ARCHITECTURES "x86_64") #Intel x86-64 systems
    set(CMAKE_OSX_ARCHITECTURES "arm64; x86_64") #Universal Binary
endif()
set(VULKANVERSION 1.3.283.0)
# The pattern for copying files to the resources directory
set(SOURCE_PATTERN "*.*")

message(STATUS "Project Name: ${PROJECT_NAME}")

include(CMake/CMakeLists.txt)


add_executable(${PROJECT_NAME}
        main.cpp
        ${SUBMODULE_INCLUDE})


if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Debug build")

    target_include_directories(${PROJECT_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})
    target_link_libraries(${PROJECT_NAME} ${Vulkan_LIBRARIES} glfw)

else()
    message(STATUS "Not a Debug build")

    target_link_libraries(${PROJECT_NAME}
            ${TARGET_LIBS}
            ${VULKAN_MACOS_LIBS}
            glfw
    )
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/CMakeLists.txt)
endif()


if(APPLE)
    set_target_properties(${PROJECT_NAME}
            PROPERTIES
            MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME}
            MACOSX_BUNDLE_COPYRIGHT "Copyright © 1995-2009, ${PROJECT_NAME} , All Rights Reserved."
            MACOSX_BUNDLE_GUI_IDENTIFIER ${PROJECT_NAME}.grahamhill.dev
            MACOSX_BUNDLE_BUNDLE_VERSION 1.0
            MACOSX_BUNDLE_SHORT_VERSION_STRING 1.0
            MACOSX_BUNDLE TRUE
            XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME YES
            XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "dev.grahamhill.${PROJECT_NAME}"
            BUILD_WITH_INSTALL_RPATH TRUE
            INSTALL_RPATH "@executable_path/../Frameworks"
    )
endif ()