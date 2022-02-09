#include <cstdio>

// __global__ 用于核函数，性质有点类似于cpu上的main函数
__global__ void kernel() {
    printf("Hello, world!\n");
}

int main() {
    kernel<<<1, 1>>>();
    return 0;
}
