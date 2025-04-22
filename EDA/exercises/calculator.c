#include <stdio.h>
#include <Windows.h>

void clean_screen() // Limpa o terminal
{
	#if defined(linux) || defined(unix) || defined(APPLE)
		system("clear");
	#endif
	
	#if defined(_WIN32) || defined(_WIN64)
		system("cls");
	#endif
}

int main() {

    int op;
    double n1, n2, result;
    
    do {
        clean_screen();
        printf("1 - Addition\t2- Subtraction\t3 - Multiplication\t4 - Division\n");
        printf("Select the type of operation: ");
        scanf("%d", &op);

        switch (op)
        {
        case 1:
            // Addition.
            clean_screen();

            printf("Enter the first number: ");
            scanf("%lf", &n1);
            printf("Enter the second number: ");
            scanf("%lf", &n2);

            result = n1 + n2;

            printf("Result: %lf\n", result);

            break;
        case 2:
            // Subtraction.
            clean_screen();

            printf("Enter the first number: ");
            scanf("%lf", &n1);
            printf("Enter the second number: ");
            scanf("%lf", &n2);

            result = n1 - n2;

            printf("Result: %lf\n", result);

            break;
        case 3:
            clean_screen();

            printf("Enter the first number: ");
            scanf("%lf", &n1);
            printf("Enter the second number: ");
            scanf("%lf", &n2);

            result = n1 * n2;

            printf("Result: %lf\n", result);

            break;
        case 4:
            clean_screen();

            printf("Enter the first number: ");
            scanf("%lf", &n1);
            printf("Enter the second number: ");
            scanf("%lf", &n2);

            result = n1 / n2;

            printf("Result: %lf\n", result);

            break;
        default:
            clean_screen();
            printf("Invalid option!\n");
            break;
        }

        printf("Continue? (y/n): ");
        while ((getchar()) != '\n'); // Clean buffer.
    } while (getchar() == 'y' || getchar() == 'Y');

    return 0;
}