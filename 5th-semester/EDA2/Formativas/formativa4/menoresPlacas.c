#include <stdio.h>
#include <stdlib.h>

#define TAM_FP_INICIAL 1

typedef struct FP {
  int *ch;
  int tam, n;
} FP;

void troca(int *a, int *b) {
  int aux = *b;
  *b = *a;
  *a = aux;
}

FP *criarFp(int tam) {
  FP *fp = (FP *)malloc(sizeof(FP));
  fp->ch = (int *)malloc(tam+1 * sizeof(int));
  fp->tam = tam;
  fp->n = 0;
  return fp;
}

int fpVazia(FP *fp) {
  return fp->n == 0;
}

void fixUp(FP *fp, int k) {
  while (k > 1 && fp->ch[k/2] > fp->ch[k]) {
    troca(&fp->ch[k], &fp->ch[k/2]);
    k = k/2;
  }
}

void inserir(FP *fp, int dado) {
  if (fp->n == fp->tam) {
    fp->ch = (int *)realloc(fp->ch, (2*fp->tam+1) * sizeof(int));
    fp->tam *= 2;
  }
  fp->ch[++fp->n] = dado;
  fixUp(fp, fp->n);
}

void fixDown(FP *fp, int k, int N) {
  int j;
  while (2*k <= N) {
    j = 2*k;
    if (j<N && fp->ch[j] > fp->ch[j+1]) j++;
    if (!(fp->ch[k] > fp->ch[j])) break;
    troca(&fp->ch[k], &fp->ch[j]);
    k = j;
  }
}

int extrair(FP *fp) {
  troca(&fp->ch[1], &fp->ch[fp->n]);
  fixDown(fp, 1, fp->n-1);
  return fp->ch[fp->n--];
}

int main() {
  int op, placa, nImp, valor;
  FP *cadastradas = criarFp(TAM_FP_INICIAL);
  int menores[100];

  while (scanf("%d %d", &op, &valor) != EOF) {
    switch (op) {
      case 1:
        inserir(cadastradas, valor);
        break;
      case 2:
        if (fpVazia(cadastradas)) break;

        // extrai as nImp menores placas.
        for (int i=0; i<valor && !fpVazia(cadastradas); i++) {
          menores[i] = extrair(cadastradas);
          printf("%d ", menores[i]);
        }
        printf("\n");

        // reinsere as placas extraídas.
        for (int i=0; i<valor; i++) {
          inserir(cadastradas, menores[i]);
        }
        break;
    }
  }

  free(cadastradas->ch);
  free(cadastradas);

  return 0;
}

// implementação errada com árvore red black.

// #include <stdio.h>
// #include <stdlib.h>

// typedef enum{VERMELHO, PRETO} cor;

// typedef struct No {
//   int chave;
//   cor cor;
//   struct No *esq, *dir;
// } No;

// int ehPreto(No *r) {
//   if (r == NULL) return 1;
//   else return r->cor == PRETO;
// }

// int ehVermelho(No *r) {
//   if (r == NULL) return 0;
//   else return r->cor == VERMELHO;
// }

// No *rotacionaEsquerda(No *r) {
//   No *x = r->dir;
//   x->cor = r->cor;
//   r->cor = VERMELHO;
//   r->dir = x->esq;
//   x->esq = r;
//   return x;
// }

// No *rotacionaDireita(No *r) {
//   No *x = r->esq;
//   x->cor = r->cor;
//   r->cor = VERMELHO;
//   r->esq = x->dir;
//   x->dir = r;
//   return x;
// }

// void sobeCor(No *r) {
//   r->esq->cor = r->dir->cor = PRETO;
//   r->cor = VERMELHO;
// }

// No *corrige(No *r) {
//   if (ehPreto(r->esq) && ehVermelho(r->dir)) r = rotacionaEsquerda(r);
//   if (ehVermelho(r->esq) && ehVermelho(r->esq->esq)) r = rotacionaDireita(r);
//   if (ehVermelho(r->esq) && ehVermelho(r->dir)) sobeCor(r);
//   return r;
// }

// No *insere(No *r, int x) {
//   if (r == NULL) {
//     // printf("adicionando nó %d\n", x);
//     No *novo = (No *)calloc(1, sizeof(No));
//     novo->chave = x;
//     novo->cor = VERMELHO;
//     return novo;
//   }

//   if (x < r->chave) r->esq = insere(r->esq, x);
//   if (x > r->chave) r->dir = insere(r->dir, x);
//   r = corrige(r);

//   return r;
// }

// No *insereNovo(No *r, int x) {
//   r = insere(r, x);
//   r->cor = PRETO;
//   return r;
// }

// void emOrdem(No *r, int n, int *contador) {
//   if (r == NULL || *contador >= n) return;

//   emOrdem(r->esq, n, contador);

//   if (*contador < n) {
//     printf("%d ", r->chave);
//     (*contador)++;
//   }

//   emOrdem(r->dir, n, contador);
// }

// int main() {
//   int op, placa, valor;
//   No *cadastradas = NULL;

//   while (scanf("%d %d", &op, &valor) != EOF) {
//     switch (op) {
//       case 1:
//         cadastradas = insereNovo(cadastradas, valor);
//         break;
//       case 2:
//         int contador = 0;
//         emOrdem(cadastradas, valor, &contador);
//         printf("\n");
//         break;
//     }
//   }

//   return 0;
// }