// o quanto que eu surtei com essa questao nao foi saudavel

#include <stdio.h>
#include <stdlib.h>

int particionar(long int *vetor, int inicio, int final) {
  long int pivo = vetor[final];
  int j = inicio;

  for (int k=inicio; k<final; k++) {
    if (vetor[k] <= pivo) {
      long int temp = vetor[k];
      vetor[k] = vetor[j];
      vetor[j] = temp;
      j++;
    }
  }

  long int temp = vetor[j];
  vetor[j] = vetor[final];
  vetor[final] = temp;
  return j;
}

void quickSelect(long int *vetor, int inicio, int final, int k) {
  if (final <= inicio) return;

  int pos = particionar(vetor, inicio, final);

  if (pos>k) quickSelect(vetor, inicio, pos-1, k);
  if (pos<k) quickSelect(vetor, pos+1, final, k);
}

void encontrarMediana(long int *vetor, int inicio, int final) {
  int meio = (inicio + final) / 2;

  if (vetor[final] < vetor[meio]) {
    long int temp = vetor[final];
    vetor[final] = vetor[meio];
    vetor[meio] = temp;
  }

  if (vetor[meio] < vetor[inicio]) {
    long int temp = vetor[meio];
    vetor[meio] = vetor[inicio];
    vetor[inicio] = temp;
  }

  if (vetor[final] < vetor[final]) {
    long int temp = vetor[meio];
    vetor[meio] = vetor[final];
    vetor[final] = temp;
  }
}

void qsortMediana(long int *vetor, int inicio, int final) {
  if (final <= inicio) return;

  encontrarMediana(vetor, inicio, final);

  int pos = particionar(vetor, inicio, final);
  qsortMediana(vetor, inicio, pos-1);
  qsortMediana(vetor, pos+1, final);
}

int main() {
  int numProdutos, idPagina, produtosPorPagina, idAux;
  long int *produtos;
  int indexInicial, indexFinal;

  // receba o numero de produtos, o id da página e o numeros de produtos por página.
  scanf("%d %d %d", &numProdutos, &idPagina, &produtosPorPagina);
  produtos = (long int *)calloc(numProdutos, sizeof(long int));

  indexInicial = idPagina * produtosPorPagina;
  indexFinal = indexInicial + produtosPorPagina-1;
  indexFinal = (indexFinal > numProdutos-1) ? numProdutos-1 : indexFinal;

  // receba os produtos.
  for (int i=0; i<numProdutos; i++) {
    scanf("%ld", &produtos[i]);
  }

  quickSelect(produtos, 0, numProdutos-1, indexInicial);
  quickSelect(produtos, indexInicial+1, numProdutos-1, indexFinal);
  qsortMediana(produtos, indexInicial+1, indexFinal-1);

  for (int i=indexInicial; i<=indexFinal; i++) {
    printf("%ld\n", produtos[i]);
  }

  free(produtos);
  return 0;
}

