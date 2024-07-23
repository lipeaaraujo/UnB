# Implementação de Autômatos

Representação textual de um autômato:

$|Q| = 4$, $|\Epsilon| = 3\,,a\,,b\,,<reset>$

$|\delta| = 4,\,0\,a\,1,\,0\,b\,2,\,...\,$

$q_i = 0,\,F = 2\,0\,3$

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Q_st {
  char t;
  int *v;
} Q_st;

typedef struct Automato {
  int Qs;
  Q_st *estados;
  int Es;
  char **alfabeto;
  int qi;
} Automato;

int compara(const void *a, const void *b) {
  return strcmp(*(char **)a, *(char **)b);
}

void *processa(Automato A, qa) {
  char *buf = (char *)malloc(100 * sizeof(char));
  if(scanf("%s", buf) != 1) {
    if(A.estados[qa].t == 'f') {
      printf("ACEITA A PALAVRA\n");
      return NULL;
    }
    printf("REJEITO A PALAVRA! NAO EXISTE!!!\n");
    return NULL;
  }

  // procure a palavra no alfabeto. 
  char **p = bsearch(&buf, A.alfabeto, A.Es, sizeof(char *), compara);

  if(p == NULL) {
    printf("RECEBI %s mas esperava simbolo valido\n", buf);
    return NULL;
  }

  unsigned long pv = (p-A.alfabeto);
  if (A.estados[qa].v[pv] == -1) {
    printf("ESTADO '%d' NAO POSSUI TRANSICAO CONSUMINDO '%s'", qa, buf);
  }
  return processa(A, A.estados[qa].v[pv]);
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
  char *simbolo = (char *)malloc(10 * sizeof(char));
  char s2;
  for (int i=0; i<ds; i++) {
    int e, e2;
    scanf("%d %s %d", &e, simbolo, &e2);
    printf("D: %d %s %d\n",e,simbolo,e2);

    // pega a posição do simbolo no alfabeto.
    char **p = bsearch(&simbolo, alfabeto, Es, sizeof(char *), compara);

    unsigned long pv = (p-alfabeto);
    estados[e].v[pv] = e2;
  }

  // definicao de estado inicial e finais.
  int qi; scanf("%d", &qi);
  int Fs;
  for (int i=0; i<Fs; i++) {
    int q;
    scanf("%d", &q);
    estados[q].t = 'f';
  }

  processa((Automato){Qs, estados, Es, alfabeto, qi}, qi);
}
```
