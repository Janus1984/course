#include <stdlib.h>
#include <stdio.h>

// C语言创建数组需要手动malloc和free
int main() {
    size_t nv = 2;
    int *v = (int *)malloc(nv * sizeof(int));

    v[0] = 4;
    v[1] = 3;

    nv = 4;
    v = (int *)realloc(v, nv * sizeof(int));

    v[2] = 2;
    v[3] = 1;

    int sum = 0;
    for (size_t i = 0; i < nv; i++) {
        sum += v[i];
    }

    printf("%d\n", sum);

    free(v);
    return 0;
}
