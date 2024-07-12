message(STATUS "minOS supported version: ${CMAKE_OSX_DEPLOYMENT_TARGET}")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Bundling for a debug build -- will not be portable")
    message(NOTICE "Remember to update where your Vulkan Install is, for a Release build")


else()
    message(STATUS "Bundling for a release build -- should be portable")

    set(ICONS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/AppIcon")
        set(MACOSX_BUNDLE_ICON_FILE "myAppImage.icns")

        set_source_files_properties(
                # place resources here like this:
                # "${RESOURCES_DIR}/cute_image.jpg"
                "${ICONS_DIR}/myAppImage.icns"
                PROPERTIES
                MACOSX_PACKAGE_LOCATION "Resources"
        )
        set(APP_ICON "${ICONS_DIR}/myAppImage.icns")

    # Holdover from old test version, it still works and forces dev to update settings for the release build
    include_directories(VULKAN_MACOS_INCLUDE
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/include)
    set(VULKAN_MACOS_LIBS
            $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/${VULKAN_LIB}
    )

endif()




