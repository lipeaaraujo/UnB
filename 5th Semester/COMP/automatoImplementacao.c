#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Q_st {
  char t;
  int *v;
} Q_st;

int compara(const void *a, const void *b) {
  return strcmp(*(char **)a, *(char **)b);
}

int main() {
  int Qs, Es, ds;
  char **alfabeto;
  
  // numero de estados.
  scanf("%d", &Qs);
  Q_st *estados = (Q_st *)calloc(Qs, sizeof(Q_st));

  // numero de simbolos do alfabeto.
  scanf("%d", &Es);
  alfabeto = (char **)calloc(Es, sizeof(char *));

  // receba o alfabeto.
  for (int i=0; i<Es; i++) {
    char buffer[10];
    scanf("%s", buffer);
    alfabeto[i] = strdup(buffer);
  }

  // ordena os elementos do alfabeto.
  qsort(alfabeto, Es, sizeof(char *), compara);

  // inicializa os vetores dos estados.
  for (int i=0; i<Qs; i++) {
    estados[i].v = (int *)malloc(Es * sizeof(int));
    for (int j=0; j<Es; j++) {
      estados[i].v[j] = -1;
    }
  }

  // tamanho da tabela de transição.
  scanf("%d", &ds);
  for (int i=0; i<ds; i++) {
    int e; char simbolo[10]; int e2;
    scanf("%d %s %d", &e, simbolo, &e2);

    // pega a posição do simbolo no alfabeto.
    // char **p = bsearch(&simbolo, alfabeto, Es, sizeof(char *), compara);

    // unsigned long pv = (p-alfabeto)/8;
    // printf("=== alfabeto=%p, p=%p, pv=%lu\n", pv);
    
  }
}

/*
4
3 a b <reset>
1
0 a 1
*/