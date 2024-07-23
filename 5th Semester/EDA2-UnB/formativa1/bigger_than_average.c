#include <stdio.h>

int main() {
  int nums[10000], n, soma = 0, inicio = 1, avg = 0;

  scanf("%d", &n);

  for (int i=0; i<n; i++) {
    scanf("%d", &nums[i]);
    soma += nums[i];
  }

  avg = soma / n;

  for (int i=0; i<n; i++) {
    if (nums[i] > avg) {
      inicio ? inicio = 0 : printf(" ");
      printf("%d", nums[i]);
    }
  }

  if (inicio) {
    printf("0");
  }

  printf("\n");

  return 0;
}