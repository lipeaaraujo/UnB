#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER 5000

typedef struct Q_st {
  char type;  // tipo do estado (final ou nao)
  int *t;     // vetor de transicoes
} Q_st;

typedef struct Automato {
  int qEs;          // quantidade de estados
  Q_st *estados;    // vetor de estados
  int qSbm;         // quantidade de simbolos
  char *alfabeto;   // alfabeto
  int qi;           // estado inicial
} Automato;

int compara(const void *a, const void *b) {
  return (*((char *)a) - *((char *)b));
}

void iniciarAutomato(Automato *a) {
  // recebe a quantidade de estados.
  scanf("%d", &a->qEs);
  a->estados = (Q_st *)calloc(a->qEs, sizeof(Q_st));

  // recebe o alfabeto.
  scanf("%d", &a->qSbm);
  a->alfabeto = (char *)calloc(a->qSbm, sizeof(char));
  for (int i=0; i<a->qSbm; i++) {
    scanf(" %c", &a->alfabeto[i]);
  }

  // ordena o alfabeto.
  qsort(a->alfabeto, a->qSbm, sizeof(char), compara);

  // inicializa as transicoes dos estados.
  for (int i=0; i<a->qEs; i++) {
    a->estados[i].t = (int *)malloc(a->qSbm * sizeof(int));
    for(int j=0; j<a->qSbm; j++) {
      a->estados[i].t[j] = -1;
    }
  }

  // recebe a tabela de transicoes.
  for (int i=0; i<a->qEs*a->qSbm; i++) {
    int qo, qd;
    char simbolo;
    scanf("%d %c %d", &qo, &simbolo, &qd);

    char *p = bsearch(&simbolo, a->alfabeto, a->qSbm, sizeof(char), compara);

    unsigned long psimbolo = (p-a->alfabeto);
    a->estados[qo].t[psimbolo] = qd;
  }

  // definicao dos estados iniciais e finais.
  scanf("%d", &a->qi);
  int nFinais;
  scanf("%d", &nFinais);
  for (int i=0; i<nFinais; i++) {
    int qf;
    scanf("%d", &qf);
    a->estados[qf].type = 'f';
  }
}

int processar(Automato *a, int qa, char *palavra) {
  if(palavra[0] == '\0') {
    if(a->estados[qa].type == 'f') {
      return 1;
    }
    return 0;
  }

  char *p = bsearch(&palavra[0], a->alfabeto, a->qSbm, sizeof(char), compara);
  if (p == NULL) return 0;

  unsigned long psimbolo = (p-a->alfabeto);
  if (a->estados[qa].t[psimbolo] == -1) return 0;

  return processar(a, a->estados[qa].t[psimbolo], &palavra[1]); 
}

int main() {
  Automato a;
  char palavra[MAX_BUFFER];
  iniciarAutomato(&a);

  scanf("%s", palavra);
  int valida = processar(&a, a.qi, palavra);

  if (valida) {
    printf("Aceito\n");
  } else {
    printf("Rejeito\n");
  }

  return 0;
}