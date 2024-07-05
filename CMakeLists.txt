cmake_minimum_required(VERSION 3.28)
project(Vulkan_New)
include(FetchContent)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
#set(CMAKE_OSX_ARCHITECTURES "arm64") #Arm64 systems
#set(CMAKE_OSX_ARCHITECTURES "x86_64") #Intel x86-64 systems
set(CMAKE_OSX_ARCHITECTURES "arm64; x86_64") #Universal Binary


FetchContent_Declare(
        GLFW
        GIT_REPOSITORY https://github.com/glfw/glfw.git
        GIT_TAG 3.3.8
)

FetchContent_MakeAvailable(GLFW)

include_directories(VULKAN_MACOS_INCLUDE
        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/include)

set(VULKAN_MACOS_LIBS
        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/lib/libvulkan.1.3.283.dylib
        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/lib/libMoltenVK.dylib
#        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/lib/libMoltenVK.1.dylib
)

add_executable(Vulkan_New main.cpp)

target_link_libraries(Vulkan_New ${VULKAN_MACOS_LIBS} glfw)