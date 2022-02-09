cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Release)

# 如果只用52版本，则浪费新显卡的性能，所以可以设置多个版本号，编译器会自动选择最佳的版本，
# 但是缺点是会生成多份编译文件，编译会变慢，编译出的文件会很大，
# 所以设置为适合自己显卡的版本号就行了
set(CMAKE_CUDA_ARCHITECTURES 52;70;75;86)

project(hellocuda LANGUAGES CXX CUDA)

add_executable(main main.cu)
