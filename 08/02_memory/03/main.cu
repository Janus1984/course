#include <cstdio>
#include <cuda_runtime.h>

__global__ void kernel(int *pret) {
    *pret = 42;
}

int main() {
    int ret = 0;
    kernel<<<1, 1>>>(&ret);
    // cuda的函数出错时，不会立即终止程序，也不会抛出C++异常，而是返回一个错误代码，类型是cudaError_t，其实就是个enum类型，相当于int
    cudaError_t err = cudaDeviceSynchronize();
    printf("error code: %d\n", err);  // 700
    printf("error name: %s\n", cudaGetErrorName(err));  // cudaErrorIllegalAddress, 意思是访问了非法地址，和CPU上的段错误差不多。
    printf("%d\n", ret);
    return 0;
}
