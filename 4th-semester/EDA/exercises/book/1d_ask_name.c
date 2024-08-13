#include <stdio.h>

int main() {
    char name[50];

    printf("Write your name: ");
    fgets(name, sizeof(name), stdin);

    printf("Your name is: %s\n", name);

    return 0;
}