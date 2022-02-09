#include <cstdio>
#include <cuda_runtime.h>
#include "helper_cuda.h"

__global__ void kernel(int *pret) {
    *pret = 42;
}

int main() {
    // 回到报错原因，为什么会报非法地址，那试着分配一块内存试试？ 依然报错，因为malloc是在cpu上分配的内存。
    int *pret = (int *)malloc(sizeof(int));
    kernel<<<1, 1>>>(pret);
    checkCudaErrors(cudaDeviceSynchronize());
    free(pret);
    return 0;
}
