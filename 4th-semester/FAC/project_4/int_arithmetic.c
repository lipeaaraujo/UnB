#include <stdio.h>

int isPrime(int num) {

  if (num <= 1) {
    return 0;
  } else if (num == 2) {
    return 1;
  } else {
    for (int i = 2; i < num; i++) {
      if (num % i == 0) {
        return 0;
      }
    }
    return 1;
  }

}

int phiprime(int prime) {
  return (prime - 1);
}

int modularrem(int num, int exp, int mod) {
  for (int i = 0; i < exp; i++) {
    num *= num;
  }

  return (num / mod);
}

int main() {

  int num1, num2, num3, result;

  scanf("%d", &num1);
  scanf("%d", &num2);
  scanf("%d", &num3);

  if ((num1 < 1) || (num2 < 1)) {
    puts("Entradas invalidas");
  } else if (!isPrime(num3)) {
    puts("O mudulo nao eh primo");
  } else {

  }

  return 0; 
}