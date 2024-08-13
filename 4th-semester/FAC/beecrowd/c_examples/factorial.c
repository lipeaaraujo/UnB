#include <stdio.h>

int fatorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int N, result;
    scanf("%d", &N);

    result = fatorial(N);
    printf("%d\n", result);
}