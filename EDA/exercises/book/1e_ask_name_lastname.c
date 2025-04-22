#include <stdio.h>
#include <string.h>

int main() {
    char name[10];
    char last_name[10];

    printf("Enter your first name: ");
    fgets(name, sizeof(name), stdin);
    printf("Enter your last name: ");
    fgets(last_name, sizeof(last_name), stdin);

    // Remove the newline character from name and last_name.
    if (name[strlen(name)-1] == '\n') {
        name[strlen(name)-1] = '\0';
    }

    if (last_name[strlen(last_name)-1] == '\n') {
        last_name[strlen(last_name)-1] = '\0';
    }

    printf("Your full name is: %s %s.\n", name, last_name);

    return 0;
}