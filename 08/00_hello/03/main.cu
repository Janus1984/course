#include <cstdio>
#include <cuda_runtime.h>

__global__ void kernel() {
    printf("Hello, world!\n");
}

int main() {
    kernel<<<1, 1>>>();
    // CPU和GPU之间的通信是异步的，调用kernel函数后只是把这个任务推送到GPU的执行队列上，然后立即返回，并不会等待执行完毕
    // 可以调用cudaDeviceSynchronize(),让cpu陷入等待，等GPU完成队列的所有任务后再返回
    cudaDeviceSynchronize();
    return 0;
}
