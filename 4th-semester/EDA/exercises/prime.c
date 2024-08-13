#include <stdio.h>

int main() {

    int number;
    int isPrime = 1;

    printf("Enter a number to see if it's a prime number: ");
    scanf("%d", &number);

    if (number > 0) {
        for (int i = 2; i < number; i++) {
            if ((number % i) == 0) {
                isPrime = 0;
                break;
            }
        }

        if (isPrime) {
            printf("The number is prime!\n");
        } else {
            printf("The number isn't prime!\n");
        }

    } else {
        printf("Invalid, enter a positive number!\n");
    }

    return 0;
}