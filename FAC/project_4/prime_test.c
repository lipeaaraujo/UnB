#include <stdio.h>

int main () {
  int num;

  scanf("%d", &num);

  if (num < 1) {
    printf("Entrada invalida");
  } else if (isPrime(num)) {
    printf("sim");
  } else {
    printf("nao");
  }
}

int isPrime(int num) {
  float rootNum = sqrt(num);

  if (num == 1) {
    return 0;
  }

  for (int i = 2; i <= rootNum; i++) {
    if (num % 2 == 0) {
      return 0;
    }
  }

  return 1;
}