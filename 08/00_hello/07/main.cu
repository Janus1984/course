#include <cstdio>
#include <cuda_runtime.h>

// __host__ 和 __device__ 可以一起用，也就是在host和device上都可以调用
__host__ __device__ void say_hello() {
    printf("Hello, world!\n");
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
