if (APPLE AND NOT EMSCRIPTEN)
    #Copies, relinks the frameworks file, adds folders in App bundle
    add_custom_command(TARGET ${EXECUTABLE_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/"

            COMMAND ${CMAKE_COMMAND} -E make_directory
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/"

            COMMAND ${CMAKE_COMMAND} -E make_directory
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/vulkan/icd.d/"


            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/${VULKAN_LIB}"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/libvulkan.1.dylib"

            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/${VULKAN_LIB}"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/${VULKAN_LIB}"

            COMMAND ${CMAKE_COMMAND} -E copy
            "$ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/libMoltenVK.dylib"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Frameworks/libMoltenVK.dylib"

            COMMAND ${CMAKE_COMMAND} -E copy
            "${CMAKE_CURRENT_SOURCE_DIR}/MoltenVK_icd.json"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources/vulkan/icd.d/MoltenVK_icd.json"


            COMMAND install_name_tool -change
            "@rpath/libvulkan.1.dylib"
            "@executable_path/../Frameworks/libvulkan.1.dylib"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/MacOS/${PROJECT_NAME}"
    )
endif ()

if (APPLE)
    # Use file(GLOB ...) to get the list of files matching the wildcard pattern
    file(GLOB SOURCE_FILES "${SOURCE_DIR}/${SOURCE_PATTERN}")

    # Iterate over the list of source files and add a custom command for each one
    foreach(SOURCE_FILE ${SOURCE_FILES})
        # Get the file name from the full path
        get_filename_component(FILE_NAME ${SOURCE_FILE} NAME)
        # Define the destination file path
        set(DESTINATION_FILE "${DESTINATION_DIR}/${FILE_NAME}")
        message(STATUS "${DESTINATION_FILE}")
        message(STATUS "${SOURCE_FILE}")

        # Add a custom command to copy the file after building the target
        add_custom_command(
                TARGET ${PROJECT_NAME}
                POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy
                "${SOURCE_FILE}"
                "${DESTINATION_FILE}"
        )
    endforeach()
endif ()
