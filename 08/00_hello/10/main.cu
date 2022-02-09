#include <cstdio>
#include <cuda_runtime.h>

__host__ __device__ void say_hello() {

// __CUDA_ARCH__ 其实是个版本号，表示GPU架构版本，编译器默认的是最老的52版本，能兼容GTX900以上显卡
#ifdef __CUDA_ARCH__
    printf("Hello, world from GPU architecture %d!\n", __CUDA_ARCH__);
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
