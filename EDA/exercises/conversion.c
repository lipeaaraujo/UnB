#include <stdio.h>
#include <windows.h>

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

    char op;
    int leave = 0;
    double tem, result;

    do {
        printf("C - Fahrenheit to Celsius\tF - Celsius to Fahrenheit\tS - Leave\n");
        printf("Select option: ");
        op = getchar();
        while ((getchar()) != '\n'); // Clean buffer.

        switch (op)
        {
        case 'C':
            clean_screen();

            printf("Enter the temperature in Fahrenheit: ");
            scanf("%lf", &tem);

            result = ((tem - 32.0) * (5.0 / 9.0));

            printf("Temperature in Celsius: %lf\n", result);

            while ((getchar()) != '\n'); // Clean buffer.
            break;
        case 'F':
            clean_screen();

            printf("Enter the temperature in Celsius: ");
            scanf("%lf", &tem);

            result = ((tem) * (9.0 / 5.0) + 32.0);

            printf("Temperature in Fahrenheit: %lf\n", result);

            while ((getchar()) != '\n'); // Clean buffer.
            break;
        case 'S':
            printf("Exiting...\n");
            leave = 1;
            break;
        default:
            printf("Invalid option!\n");
            break;
        }
        
    } while (leave != 1);

}