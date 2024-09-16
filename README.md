# DearImGui Vulkan Template (CMake)  
A template that uses Vulkan on Windows and MoltenVK on macOS that allows setting of application icon by the developer with convenience files.  
This is a relativly simple template file allowing you to develop from ocornut's [DearImGui](https://github.com/ocornut/imgui) GLFW+Vulkan template.  
I will look at an SDL variant as a possible alternate windowing manager.  

### Currently supported platforms:

| Platform |  Support  |
|:---------|:---------:|
| Windows  |     ✅     |
| macOS    |     ✅     |
| Linux    |     ❌     |

Linux may work, it just hasn't been tested yet

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

This should output a portable binary, this does not codesign the app bundle, it creates an unsigned but portable macOS 
app.


---

### Notes on the build system

Note the only files you should be concerned with (with CMake) if you are just wanting to use the template for 
experimenting are the src folder, CMakeLists.txt, and the Settings.cmake file.

If you are making a more complex project, then you will want to look into the CMake folder as there are some settings 
that may need to be changed by you to prepare for a release build.

While this project could theoretically be altered to support IOS and Android with some alterations, I do not plan to do 
it on this project at this time.

---


This project is licensed under the [MIT license](https://opensource.org/license/mit), this pretty much means do what you want but keep a copy of the 
license in all source code distributions, and that any issues you experience aren't my problem.

#### Credits/External Projects Included
GLFW - https://github.com/glfw/glfw  
Vulkan - https://www.vulkan.org/  
Dear ImGui - https://github.com/ocornut/imgui
