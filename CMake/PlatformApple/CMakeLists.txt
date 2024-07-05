message(STATUS "minOS supported version: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources")
# It caches the items in the folder when generating with clion, just get cmake to regen and it will work


include(${CMAKE_CURRENT_SOURCE_DIR}/submodules/CMakeLists.txt)


if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Bundling for a debug build -- will not be portable")

    find_package(Vulkan REQUIRED)

else()
    message(STATUS "Bundling for a release build -- should be portable")

    include_directories(VULKAN_MACOS_INCLUDE
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/include)

    set(VULKAN_MACOS_LIBS
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/libvulkan.1.3.283.dylib
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/libMoltenVK.dylib
            #        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/lib/libMoltenVK.1.dylib
    )

endif()




