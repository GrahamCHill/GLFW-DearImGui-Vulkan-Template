message(STATUS "minOS supported version: ${CMAKE_OSX_DEPLOYMENT_TARGET}")



if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Bundling for a debug build -- will not be portable")
    message(NOTICE "Remember to update where your Vulkan Install is, for a Release build")
    find_package(Vulkan REQUIRED)

else()
    message(STATUS "Bundling for a release build -- should be portable")

    # Holdover from old test version, it still works and forces dev to update settings for the release build
    include_directories(VULKAN_MACOS_INCLUDE
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/include)
    set(VULKAN_MACOS_LIBS
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/${VULKAN_LIB}
#            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/libMoltenVK.dylib
            #        $ENV{HOME}/VulkanSDK/1.3.283.0/macOS/lib/libMoltenVK.1.dylib
    )

endif()




