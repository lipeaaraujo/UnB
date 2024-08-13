#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define TAM_HASH 96
#define TAM_BUFFER 1001

typedef struct Entrada {
  char carac;
  int freq;
} Entrada;

typedef struct TabelaHash {
  Entrada **tab;
  int tam;
  int n;
} TabelaHash;
 
int hash(char ch, int tam) {
  return (ch % tam);
}

TabelaHash *iniciarTabela(int tam) {
  TabelaHash *novo = (TabelaHash *)malloc(sizeof(TabelaHash));
  novo->tab = (Entrada **)calloc(tam, sizeof(Entrada *));
  novo->tam = tam;
  novo->n = 0;
  return novo;
}

void liberar(TabelaHash *th) {
  for (int i=0; i<th->tam; i++) {
    if (th->tab[i] != NULL) free(th->tab[i]);
  }
  free(th->tab);
  free(th);
}

void inserir(TabelaHash *th, char c) {
  int pos = hash(c, th->tam);
  while (th->tab[pos] != NULL) {
    if (th->tab[pos]->carac = c) {
      th->tab[pos]->freq++;
      return;
    }
    pos = (pos + 1) % th->tam;
  }
  Entrada *nova = (Entrada *)malloc(sizeof(Entrada));
  nova->carac = c;
  nova->freq = 1;
  th->tab[pos] = nova;
  th->n++;
}

void inserirLinha(TabelaHash *th, char *buffer) {
  if (buffer[0] == '\0') return;
  inserir(th, buffer[0]);
  inserirLinha(th, &buffer[1]);
}

int buscar(TabelaHash *th, char c) {
  int pos = hash(c, th->tam);
  while (th->tab[pos] != NULL && th->tab[pos]->carac != c) {
    pos = (pos + 1) % th->tam;
  }
  if (th->tab[pos] != NULL) {
    return pos;
  }
  return -1;
}

void tokenizar(const char *str, char *res) {
  bool seen[256] = {false};
  int resIndex = 0;

  for (int i=0; str[i] != '\0'; i++) {
    char ch = str[i];
    if (!seen[(unsigned char)ch]) {
      seen[(unsigned char)ch] = true;
      res[resIndex++] = ch;
    }
  }
  res[resIndex] = '\0';
}

int compara (const void *a, const void *b) {
  const Entrada *entA = *((Entrada **)a);
  const Entrada *entB = *((Entrada **)b);
  if (entA->freq != entB->freq) return (entA->freq - entB->freq);
  return (entA->carac - entB->carac);
}

void mostrarFrequencia(TabelaHash *th, char *buffer) {
  char caracteres[th->n+1];
  Entrada *entradas[th->n];
  
  tokenizar(buffer, caracteres);

  for (int i=0; i<th->n; i++) {
    int pos = buscar(th, caracteres[i]);
    entradas[i] = th->tab[pos];
  }

  qsort(entradas, th->n, sizeof(Entrada *), compara);

  for (int i=0; i<th->n; i++) {
    printf("%d %d\n", entradas[i]->carac, entradas[i]->freq);
  }
  printf("\n");
}

int main() {
  TabelaHash *th;
  char buffer[TAM_BUFFER];
  
  while (scanf("%s", buffer) != EOF) {
    th = iniciarTabela(TAM_HASH);
    inserirLinha(th, buffer);
    mostrarFrequencia(th, buffer);
    fflush(stdin);
    liberar(th);
  }

  return 0;
}