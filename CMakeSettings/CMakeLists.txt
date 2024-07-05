# Apple Specific Settings
if(APPLE AND NOT EMSCRIPTEN)
    set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)
    #set(CMAKE_OSX_ARCHITECTURES "arm64") #Arm64 systems
    #set(CMAKE_OSX_ARCHITECTURES "x86_64") #Intel x86-64 systems
    set(CMAKE_OSX_ARCHITECTURES "arm64; x86_64") #Universal Binary

    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.app/Contents/Resources")
    set(VULKANVERSION 1.3.283.0)

    # Found in $ENV{HOME}/VulkanSDK/${VULKANVERSION}/macOS/lib/
    set(VULKAN_LIB "libvulkan.1.3.283.dylib")


    # Linux Specific Settings
elseif (NOT APPLE AND UNIX AND NOT EMSCRIPTEN)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/Resources")

    # Windows Specific Settings
elseif (NOT APPLE AND NOT UNIX AND NOT EMSCRIPTEN)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/Resources")

    # Web Specific Settings
elseif (NOT APPLE AND EMSCRIPTEN)
    set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    set(DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/Resources")

endif()


# The pattern for copying files to the resources directory
set(SOURCE_PATTERN "*.*")
set(TARGET_LIBS glfw)