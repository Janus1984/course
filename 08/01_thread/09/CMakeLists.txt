cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Release)

# 新版cuda的一个参数，CMAKE_CUDA_SEPARABLE_COMPILATION，可以将.cu文件分离编译
# 这个和cpp的.h和.cpp分开不一样，而是直接在main.cu中声明，在hello.cu中实现，不需要头文件，很奇怪的一种方式
# 推荐将声明和实现放在同一个文件中，方便编译器自动内联优化
set(CMAKE_CUDA_SEPARABLE_COMPILATION ON)

project(hellocuda LANGUAGES CXX CUDA)

add_executable(main main.cu hello.cu)
