#define GLFW_INCLUDE_VULKAN
#include <vulkan/vulkan.h>
#include <GLFW/glfw3.h>
#include <iostream>
#ifdef _WIN32
#define STB_IMAGE_IMPLEMENTATION
    #include "stb_image.h"
    #include <windows.h>
    #include "appicon.h"
#include "test.c"
#endif

const int WIDTH = 1600;
const int HEIGHT = 600;


int main() {
    glfwInit();
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    // Set the window to be non-resizable
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
    GLFWwindow* window = glfwCreateWindow(WIDTH, HEIGHT, "Vulkan window", nullptr, nullptr);
    std::cout << glfwGetMonitorName(glfwGetPrimaryMonitor());

    uint32_t extensionCount = 0;
    vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr);

    std::cout << "Extension count: " << extensionCount << std::endl;

    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }

    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}


