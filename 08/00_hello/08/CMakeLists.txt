cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Release)

project(hellocuda LANGUAGES CXX CUDA)

add_executable(main main.cu)

# --expt-relaxed-constexpr 这个flag只会给到CUDA，而不会给到正常的cpp文件。
target_compile_options(main PUBLIC $<$<COMPILE_LANGUAGE:CUDA>:--expt-relaxed-constexpr>)
