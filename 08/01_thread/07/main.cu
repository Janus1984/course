#include <cstdio>
#include <cuda_runtime.h>

__global__ void kernel() {

    // xyz三个维度的设计初衷是为了适配图像的三维，但其实和只使用一维是一样的。

    printf("Block (%d,%d,%d) of (%d,%d,%d), Thread (%d,%d,%d) of (%d,%d,%d)\n",
           blockIdx.x, blockIdx.y, blockIdx.z,
           gridDim.x, gridDim.y, gridDim.z,
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockDim.x, blockDim.y, blockDim.z);
}

int main() {
    kernel<<<dim3(2, 1, 1), dim3(2, 2, 2) >>>();
    cudaDeviceSynchronize();
    return 0;
}
