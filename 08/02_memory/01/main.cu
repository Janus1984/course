#include <cstdio>
#include <cuda_runtime.h>

// __global__ 函数不能有返回值，因为gpu是异步的，如下main函数中获取ret时，还没有执行cudaDeviceSynchronize,所以会报错。
__global__ int kernel() {
    return 42;
}

int main() {
    int ret = kernel<<<1, 1>>>();
    cudaDeviceSynchronize();
    printf("%d\n", ret);
    return 0;
}
