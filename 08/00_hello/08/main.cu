#include <cstdio>
#include <cuda_runtime.h>

// cuda会把constexpr函数自动变成修饰__host__,__device__
// 不过必须指定 --expt-relaxed-constexpr 这个选项才能用这个特性
constexpr const char *cuthead(const char *p) {
    return p + 1;
}

__global__ void kernel() {
    printf(cuthead("Gello, world!\n"));
}

int main() {
    kernel<<<1, 1>>>();
    cudaDeviceSynchronize();
    printf(cuthead("Cello, world!\n"));
    return 0;
}
