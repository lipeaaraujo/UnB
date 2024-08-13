#include <stdio.h>

int main() {
    char name[30];
    double grade_1, grade_2;

    printf("Enter the name of the student: ");
    fgets(name, sizeof(name), stdin);


    printf("First grade: ");
    scanf("%lf", &grade_1);

    printf("Second grade: ");
    scanf("%lf", &grade_2);

    printf("\n%sFirst grade: %lf\nSecond grade: %lf\n", name, grade_1, grade_2);

    return 0;
}