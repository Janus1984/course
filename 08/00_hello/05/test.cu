#include <cstdio>
#include <cuda_runtime.h>

__device__ void say_hello()
{
    printf("Hello,world form GPU!\n");
}

__host__ void say_hello_host()
{
    printf("Hello, world form CPU!\n");
}

__global__ void kernel()
{
    say_hello();
}

int main()
{
    kernel<<<1,1>>>();
    cudaDeviceSynchronize();
    say_hello_host();
    return 0;
}