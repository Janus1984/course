#include <cstdio>
#include <cuda_runtime.h>

__host__ __device__ void say_hello() {

// CUDA编译器具有多段编译的特点，会先将__host__的函数提取出来交给gcc编译生成CPU的指令码，
// 然后将__global__ __device__函数提取出来交给nvcc编译生成GPU的指令码，
// 然后将指令码链接到kernel函数
// 可以用__CUDA_ARCH__宏来实现两份代码，达到类似重载的效果

#ifdef __CUDA_ARCH__
    printf("Hello, world from GPU!\n");
#else
    printf("Hello, world from CPU!\n");
#endif
}

__global__ void kernel() {
    say_hello();
}

int main() {
    kernel<<<1, 1>>>();
    cudaDeviceSynchronize();
    say_hello();
    return 0;
}
