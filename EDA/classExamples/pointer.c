#include <stdio.h>
#include <stdlib.h>

int main() {
    int numero, *ptr;
    numero = 79417;
    ptr = &numero;
    *ptr = 90560;

    printf("Address: %p\n", ptr);
    printf("Number: %d\n", numero);

    return 0;
}