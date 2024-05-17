#include <stdio.h>
#include <stdlib.h>

#define MAX_ENTRADA 10000000

typedef struct Semente{
  long int codigo;
  int qual;
} Semente;

void swap(Semente *a, Semente *b) {
  Semente temp = *a;
  *a = *b;
  *b = temp; 
}

void compswap(Semente *a, Semente *b) {
  if (b->codigo < a->codigo) {
    swap(a, b);
  }
}

int separa(Semente *v, int inicio, int final) {
  int meio = (inicio + final) / 2;

  if (v[final].qual <= v[meio].qual) {
    if (v[meio].qual == v[final].qual) {
      compswap(&v[meio], &v[final]);
    } else {
      swap(&v[meio], &v[inicio]);
    }
  }

  if (v[meio].qual <= v[inicio].qual) {
    if (v[meio].qual == v[inicio].qual) {
      compswap(&v[inicio], &v[meio]);
    } else {
      swap(&v[meio], &v[inicio]);
    }
  }

  if (v[meio].qual <= v[final].qual) {
    if (v[meio].qual == v[final].qual) {
      compswap(&v[final], &v[meio]);
    } else {
      swap(&v[meio], &v[final]);
    }
  }

  Semente pivo = v[final];
  int j = inicio;

  for (int k=inicio; k<final; k++) {
    if (v[k].qual < pivo.qual || 
        (v[k].qual == pivo.qual && v[k].codigo < pivo.codigo)) {
      swap(&v[k], &v[j]);
      j++;
    }
  }
  swap(&v[j], &v[final]);
  return j;
}

void qselect(Semente *v, int inicio, int final, int k) {
  if (final <= inicio) return;

  int pivo = separa(v, inicio, final);

  if (pivo > k) qselect(v, inicio, pivo-1, k);
  if (pivo < k) qselect(v, pivo+1, final, k);
}

void intercalar(Semente *v, int inicio, int final) {
  int meio = (inicio + final) / 2;
  int tamanho = final - inicio + 1;
  Semente temp[tamanho];
  int i = inicio, j = meio + 1, k = 0;

  while (i <= meio && j <= final) {
    if (v[j].codigo < v[i].codigo) {
      temp[k++] = v[j++];
    } else {
      temp[k++] = v[i++];
    }
  }

  while (i <= meio) {
    temp[k++] = v[i++];
  }

  while (j <= final) {
    temp[k++] = v[j++];
  }

  for (int i=0; i<tamanho; i++) {
    v[inicio + i] = temp[i];
  }
}

void mergesort(Semente *v, int inicio, int final) {
  if (inicio < final) {
    int meio = (inicio + final) / 2;
    mergesort(v, inicio, meio);
    mergesort(v, meio+1, final);
    intercalar(v, inicio, final);
  }
}

int main() {
  int numSel, numEnt = 0;
  Semente *entradas = (Semente *)malloc(MAX_ENTRADA * sizeof(Semente));

  scanf("%d", &numSel);

  while(scanf("%ld %d", &entradas[numEnt].codigo,
                        &entradas[numEnt].qual) != EOF) {
    numEnt++;
  }

  qselect(entradas, 0, numEnt-1, numSel);
  mergesort(entradas, 0, numSel-1);

  for (int i=0; i<numSel; i++) {
    printf("%ld %d\n", entradas[i].codigo, entradas[i].qual);
  }
}