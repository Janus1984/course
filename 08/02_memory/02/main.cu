#include <cstdio>
#include <cuda_runtime.h>

// 既然不能返回，那作为指针传入局部变量的引用可行么？ 结果是ret依然等于0。
__global__ void kernel(int *pret) {
    *pret = 42;
}

int main() {
    int ret = 0;
    kernel<<<1, 1>>>(&ret);
    cudaDeviceSynchronize();
    printf("%d\n", ret);
    return 0;
}
