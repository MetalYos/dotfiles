This note and all commands will assume the following directory structure:
```dirtree
- /src
	- main.cpp
- /lib
- /resources
- CMakeLists.txt
```

## Basic CMakeLists file template
```cmake
cmake_minimum_required(VERSION 3.11)

project(ProjectName LANGUAGES CXX C)

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(RESOURCES_FOLDER "resources")

add_executable(${PROJECT_NAME} 
    src/main.cpp
)

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 20)

if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE -W4)
else()
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall)
endif()

target_include_directories(${PROJECT_NAME}
    PRIVATE
    src
)

# Copy resources directory to target location
add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD 
                COMMAND "${CMAKE_COMMAND}" -E copy_directory 
                        "${CMAKE_SOURCE_DIR}/${RESOURCES_FOLDER}"
                        "${CMAKE_BINARY_DIR}/${RESOURCES_FOLDER}"
                COMMENT "Copying resources to output directory")
```

## Add OpenGL to CMakeLists file
Add the following line to the end of the file (above the pre build commands):
```cmake
find_package(OpenGL REQUIRED)
```

## Add Raylib to the project
1. Clone the Raylib repository into the `lib` folder, using the following commands:
```bash
cd lib
git clone https://github.com/raysan5/raylib.git --recursive
```
2. Add the following commands into the `CMakeLists.txt` at the end of the file (above the pre-build commands):
```cmake
# Link Raylib
add_subdirectory(lib/raylib EXCLUDE_FROM_ALL)
target_link_libraries(${PROJECT_NAME} PRIVATE raylib)
```