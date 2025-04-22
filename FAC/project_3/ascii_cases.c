// ASCII cases implementation in C.
#include <stdio.h>
#include <stdlib.h>

int main() {

    // M: convert string to uppercase.
    // m: convert string to lowercase.
    // c: convert first letter of each word to uppercase.

    char option;
    int size;
    
    // Get the option.
    option = getchar();
    fflush(stdin); // Clear buffer.

    // Get the size of the string.
    scanf("%d", &size);
    fflush(stdin); // Clear buffer.

    char *string = (char *) calloc(size+1, sizeof(char));

    // Get the string.
    fgets(string, size+1, stdin);
    fflush(stdin); // Clear buffer.

    switch(option) {
        case 'M':
            for (int i=0; i < size; i++) {
                if (string[i] >= 97 && string[i] <= 122) {
                    string[i] -= 32;
                }
            }
        break;
        case 'm':
            for (int i=0; i < size; i++) {
                if (string[i] >= 65 && string[i] <= 90) {
                    string[i] += 32;
                }
            }
        break;
        case 'c':
            if (string[0] >= 97 && string[0] <= 122) {
                string[0] -= 32;
            }
            for (int i=0; i < size; i++) {
                if (string[i] == 32) {
                    if (string[i+1] >= 97 && string[i+1] <= 122) {
                        string[i+1] -= 32;
                    }
                }
            }
        break;
    }

    printf("%s\n", string);
    free(string);

    return 0;
}