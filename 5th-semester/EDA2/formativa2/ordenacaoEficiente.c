#include <stdio.h>
#include <stdlib.h>

void printarVetor(int *lista, int tam) {
  printf("%d", lista[0]);
  for (int i=1; i<tam; i++) {
    printf(" %d", lista[i]);
  }
  printf("\n");
}

void intercalarVetor(int *lista, int inicio, int final) {
  int meio = (inicio + final) / 2;
  int tamanho = final - inicio + 1;
  int temp[tamanho];
  int i = inicio, j = meio + 1, k = 0;

  while (i <= meio && j <= final) {
    if (lista[j] < lista[i]) {
      temp[k++] = lista[j++];
    } else {
      temp[k++] = lista[i++];
    }
  }

  while (i <= meio) {
    temp[k++] = lista[i++];
  }

  while (j <= final) {
    temp[k++] = lista[j++];
  }

  for (int i=0; i<tamanho; i++) {
    lista[inicio + i] = temp[i];
  }
}

void ordenarVetor(int *lista, int inicio, int final) {
  // basicamente um mergesort.
  if (inicio < final) {
    int meio = (inicio + final) / 2;
    ordenarVetor(lista, inicio, meio);
    ordenarVetor(lista, meio+1, final);
    intercalarVetor(lista, inicio, final);
  }
}

int main() {
  int *lista, tamanho;

  scanf("%d", &tamanho);
  lista = (int *)malloc(tamanho * sizeof(int));

  for (int i=0; i<tamanho; i++) {
    scanf("%d", &lista[i]);
  }

  ordenarVetor(lista, 0, tamanho-1);
  printarVetor(lista, tamanho);

  free(lista);
  return 0;
}