add_executable(${PROJECT_NAME}
        WIN32 MACOSX_BUNDLE
        src/main.cpp
        ${SUBMODULE_INCLUDE}
        ${APP_ICON_RESOURCE_WINDOWS}
)


    # macOS build
if (APPLE)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        target_include_directories(${PROJECT_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})
        target_link_libraries(${PROJECT_NAME}
                ${Vulkan_LIBRARIES}
                ${TARGET_LIBS}
        )

    else()
        # Holdover and ensures a dynamic library
        target_link_libraries(${PROJECT_NAME}
                ${VULKAN_MACOS_LIBS}
                ${TARGET_LIBS}
        )
    endif()

    # Linux Build
elseif (NOT APPLE AND UNIX AND NOT EMSCRIPTEN)
    target_link_libraries(${PROJECT_NAME}
            ${Vulkan_LIBRARIES}
            ${TARGET_LIBS}
    )

    # Windows Build
elseif (NOT APPLE AND NOT UNIX AND NOT EMSCRIPTEN)
    set(CMAKE_EXE_LINKER_FLAGS -static)
    target_include_directories(${PROJECT_NAME}
            PRIVATE ${Vulkan_INCLUDE_DIRS})

    target_link_libraries(${PROJECT_NAME}
            ${Vulkan_LIBRARIES}
            ${TARGET_LIBS})


    # Web Build
elseif (NOT APPLE AND EMSCRIPTEN)
    target_link_libraries(${PROJECT_NAME}
            ${TARGET_LIBS}
    )

endif ()


if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Debug build")

else()
    message(STATUS "Not a Debug build")
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/CMakeLists.txt)
endif()