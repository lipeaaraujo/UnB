#include <stdio.h>
#include <stdlib.h>

typedef struct FP {
  long *ch;
  int tam, n;
  int (*cmp)(long, long);
} FP;

void troca(long *a, long *b) {
  long aux = *b;
  *b = *a;
  *a = aux;
}

int minCompara(long a, long b) {
  return a > b;
}

// int maxCompara(long a, long b) {
//   return a < b;
// }

FP *criarFp(int tam, int (*cmp)(long, long)) {
  FP *fp = (FP *)malloc(sizeof(FP));
  fp->ch = (long *)malloc((tam+1) * sizeof(long));
  fp->tam = tam;
  fp->n = 0;
  fp->cmp = cmp;
  return fp;
}

int fpVazia(FP *fp) {
  return fp->n == 0;
}

void fixUp(FP *fp, int k) {
  while (k > 1 && fp->cmp(fp->ch[k/2], fp->ch[k])) {
    troca(&fp->ch[k], &fp->ch[k/2]);
    k = k/2;
  }
}

void inserir(FP *fp, long dado) {
  if (fp->n == fp->tam) {
    fp->ch = (long *)realloc(fp->ch, (2*fp->tam+1) * sizeof(long));
    fp->tam *= 2;
  }
  fp->ch[++fp->n] = dado;
  fixUp(fp, fp->n);
}

void fixDown(FP *fp, int k, int N) {
  int j;
  while (2*k <= N) {
    j = 2*k;
    if (j<N && fp->cmp(fp->ch[j], fp->ch[j+1])) j++;
    if (!fp->cmp(fp->ch[k], fp->ch[j])) break;
    troca(&fp->ch[k], &fp->ch[j]);
    k = j;
  }
}

long extrair(FP *fp) {
  troca(&fp->ch[1], &fp->ch[fp->n]);
  fixDown(fp, 1, fp->n-1);
  return fp->ch[fp->n--];
}

int main() {
  int nMin, nCom = 0, nTB = 0;
  long x, *densTB, *respostas;
  FP *densTA;

  scanf("%d %ld", &nMin, &x);

  // criação das filas de prioridade.
  densTA = criarFp(nMin, minCompara);
  densTB = (long *)malloc(nMin * sizeof(long));
  respostas = (long *)malloc(nMin * sizeof(long));

  for (int i=0; i<nMin; i++) {
    long novaDen;
    scanf("%ld", &novaDen);
    inserir(densTA, novaDen);
  }
  
  // processamento das combinações
  while (densTA->n > 0) {
    long menorTA = densTA->ch[1]; // Acessa o menor elemento de densTA (assumindo que ch[1] é o menor)
    if (nTB > 0) {
        long maiorTB = densTB[nTB - 1];
        long diferenca = menorTA > maiorTB ? menorTA - maiorTB : maiorTB - menorTA;
        if (diferenca <= x && diferenca > 0) {
            // printf("combinando %d com %d\n", menorTA, maiorTB);
            menorTA = extrair(densTA);
            maiorTB = densTB[nTB - 1];
            nTB--;
            respostas[nCom] = menorTA + maiorTB;
            nCom++;
            continue; // pula a parte final para evitar adicionar menorTA novamente
        }
    }
    menorTA = extrair(densTA);
    densTB[nTB++] = menorTA;
}

  // imprimir numero de combinações e respostas.
  printf("%d\n", nCom);

  if (nCom > 0) {
    printf("%ld", respostas[0]);
    for (int i=1; i<nCom; i++) {
      printf(" %ld", respostas[i]);
    }
    printf("\n");
  }

  free(densTA->ch);
  free(densTA);
  free(densTB);
  free(respostas);

  return 0;
}