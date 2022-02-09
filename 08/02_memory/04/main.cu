#include <cstdio>
#include <cuda_runtime.h>
#include "helper_cuda.h"

__global__ void kernel(int *pret) {
    *pret = 42;
}

int main() {
    int ret = 0;
    kernel<<<1, 1>>>(&ret);

    // CUDA toolkit提供了非常有用的工具，比如 helper_cuda.h，它定义了 checkCudaErrors,会自动检查错误代码并打印在终端，然后退出。
    checkCudaErrors(cudaDeviceSynchronize());
    return 0;
}
