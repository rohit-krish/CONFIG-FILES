# CMakeLists.txt for opencv with c++
cmake_minimum_required(VERSION 3.0.0)
project(<project_name> VERSION 0.1.0)

include(CTest)
enable_testing()

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(<executable_name> <main_file.cpp>)

target_link_libraries(<executable_name> ${OpenCV_LIBS})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
