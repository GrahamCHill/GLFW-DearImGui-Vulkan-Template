# Vulkan DearImGui Template
A template that uses Vulkan on Windows and MoltenVK on macOS that allows setting of application icon by the developer with convenience files.  
This is a relativly simple template file allowing you to develop from ocornut's [DearImGui](https://github.com/ocornut/imgui) GLFW+Vulkan template.  
I will look at an SDL variant as a possible alternate windowing manager.  

### Currently supported platforms:

| Platform |  Support  |
|:---------|:---------:|
| Windows  |     ✅     |
| macOS    |     ✅     |
| Linux    |     ❌     |

#### macOS Build 

You can either use Clion, VSCode or the terminal to build this project.

If you are building from the terminal on macOS and having issues with the build.  
Assuming you have homebrew installed, you may need to run the following commands first
```shell
brew install cmake
brew install llvm
```
then run the following, this command argument may solve your problems
```shell
mkdir build && cd build  
cmake -DCMAKE_THREAD_LIBS_INIT="-lpthread" ..
make 
```

This should output a portable binary, this does not codesign the app bundle, it creates an unsigned but portable macOS app.


---


This project is licensed under the [MIT license](https://opensource.org/license/mit).  

#### Credits
GLFW - https://github.com/glfw/glfw  
Vulkan - https://www.vulkan.org/  
Dear ImGui - https://github.com/ocornut/imgui
