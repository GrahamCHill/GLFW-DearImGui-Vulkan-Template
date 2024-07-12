include_directories(IMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui)
include_directories(${IMGUI_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends)

if(APPLE AND NOT EMSCRIPTEN)
        message(STATUS "Apple Vulkan Imgui Build")
        set(IMGUI_INCLUDE
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_glfw.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_vulkan.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_draw.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_demo.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_tables.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_widgets.cpp
        )


elseif (UNIX AND EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Emscription OpenGL Imgui Build")
    include_directories(${IMGUI_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/examples/libs/emscripten)
    set(IMGUI_INCLUDE
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_glfw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_opengl3.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/examples/libs/emscripten/emscripten_mainloop_stub.h
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_draw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_demo.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_tables.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_widgets.cpp)


elseif(UNIX AND NOT EMSCRIPTEN AND NOT APPLE )
    message(STATUS "Linux Vulkan Imgui Build")
    set(IMGUI_INCLUDE
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_glfw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_vulkan.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_draw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_demo.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_tables.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_widgets.cpp
    )


elseif(NOT UNIX AND NOT EMSCRIPTEN AND NOT APPLE)
    message(STATUS "Windows Vulkan Imgui Build")
    set(IMGUI_INCLUDE
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_glfw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/backends/imgui_impl_vulkan.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_draw.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_demo.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_tables.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/Submodules/External/imgui/imgui_widgets.cpp
    )


else()
    message(FATAL_ERROR "Unsupported OS: ${CMAKE_SYSTEM_NAME}")


endif()


set(SUBMODULE_INCLUDE ${IMGUI_INCLUDE})