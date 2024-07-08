# Vulkan DearImGui Template
A template that uses Vulkan on Windows and MoltenVK on macOS that allows setting of application icon by the developer with convenience files.  
This is a relativly simple template file allowing you to develop from ocornut's [DearImGui]([https://www.genome.gov/](https://github.com/ocornut/imgui)) GLFW+Vulkan template.  
I will look at an SDL variant as a possible alternate windowing manager.  

### Currently supported platforms:

| Platform |  Support  |
|:---------|:---------:|
| Windows  |     ✅     |
| macOS    |     ✅     |
| Wasm     |    ❌    |
| Linux    |     ❌     |

---


This project is licensed under the [MIT license](https://opensource.org/license/mit).  

The following is how the web build will be generated (that will default to OpenGL so it has maximum browser compatibility.)
## The following is not yet ready
 To build Emscripten make sure emscripten is active on your
 system and run the following commands in your terminal      
 mkdir build && cd build  
 emcmake ..  
 make  
and it should be built  


#### Credits
GLFW - https://github.com/glfw/glfw  
Vulkan - https://www.vulkan.org/  
Dear ImGui - https://github.com/ocornut/imgui
