add_executable(${PROJECT_NAME}
        WIN32 MACOSX_BUNDLE
        src/main.cpp
        ${SUBMODULE_INCLUDE}
        ${APP_ICON}
)



    # macOS build
if (APPLE)
        target_include_directories(${PROJECT_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})
        target_link_libraries(${PROJECT_NAME}
                ${Vulkan_LIBRARIES}
                ${TARGET_LIBS}
        )

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

include(${CMAKE_CURRENT_SOURCE_DIR}/CMake/PostBuild/CMakeLists.txt)