#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#define MAX_PALAVRA 17
#define TAM_HASH 65536

typedef struct Entrada {
  char palavra[MAX_PALAVRA];
  long votos;
} Entrada;

typedef struct TabelaHash {
  Entrada *tab[TAM_HASH];
  int tam;
} TabelaHash;

// funcao de hash djb2.
unsigned long hash(char *palavra) {
  unsigned long hash = 5381;
  int c;
  while ((c = *palavra++))
    hash = ((hash << 5) + hash) + c;
  return hash % TAM_HASH;
}

TabelaHash *iniciarTabela() {
  TabelaHash *nova = (TabelaHash *)malloc(sizeof(TabelaHash));
  for (int i=0; i<TAM_HASH; i++) {
    nova->tab[i] = NULL;
  }
  nova->tam = TAM_HASH;
  return nova;
}

void liberar(TabelaHash *th) {
  for (int i=0; i<TAM_HASH; i++) {
    if (th->tab[i] != NULL) free(th->tab[i]); 
  }
  free(th);
}

void inserir(TabelaHash *th, char *palavra) {
  unsigned long pos = hash(palavra);
  while (th->tab[pos] != NULL) {
    if (!strcmp(th->tab[pos]->palavra, palavra)) {
      th->tab[pos]->votos++;
      return;
    }
    pos = (pos + 1) % TAM_HASH;
  }
  Entrada *nova = (Entrada *)malloc(sizeof(Entrada));
  strcpy(nova->palavra, palavra);
  nova->votos = 1;
  th->tab[pos] = nova;
}

unsigned long buscar(TabelaHash *th, char *palavra) {
  unsigned long pos = hash(palavra);
  while (th->tab[pos] != NULL && strcmp(th->tab[pos]->palavra, palavra)) {
    pos = (pos + 1) % TAM_HASH;
  }
  if (th->tab[pos] != NULL && !strcmp(th->tab[pos]->palavra, palavra)) {
    return pos;
  }
  return ULONG_MAX;
}

void remover(TabelaHash *th, char *palavra) {
  unsigned long pos = buscar(th, palavra);
  if (pos != ULONG_MAX) {
    free(th->tab[pos]);
    th->tab[pos] = NULL;
    pos = (pos + 1) % TAM_HASH;
    while (th->tab[pos] != NULL) {
      char *palavraEnt;
      strcpy(palavraEnt, th->tab[pos]->palavra);
      free(th->tab[pos]);
      th->tab[pos] = NULL;
      inserir(th, palavraEnt);
    }
  }
}

int main() {
  int comando;
  char palavra[MAX_PALAVRA];
  TabelaHash *th = iniciarTabela();

  while(scanf("%d %s", &comando, palavra) != EOF) {
    switch (comando) {
      case 1:
        inserir(th, palavra);
      break;
      case 2:
        unsigned long pos = buscar(th, palavra);
        if (pos != ULONG_MAX) {
          printf("%ld\n", th->tab[pos]->votos);
        } else {
          printf("0\n");
        }
      break;
      case 3:
        remover(th, palavra);
      break;
    }
  }

  liberar(th);
  return 0;
}