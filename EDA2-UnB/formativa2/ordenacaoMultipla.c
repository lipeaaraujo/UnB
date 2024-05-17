#include <stdio.h>
#include <stdlib.h>

typedef struct Questao {
  int idMembro;
  int idQuestao;
  double dificuldade;
} Questao;

int comparaProblema(Questao a, Questao b) {
  // retorna 1 se a questão b tiver mais dificuldade ou prioridade que a.
  if (b.dificuldade > a.dificuldade) return 1;
  if (b.dificuldade == a.dificuldade)
    if (b.idMembro < a.idMembro) return 1;
    if (b.idMembro == a.idMembro) return (b.idQuestao < a.idQuestao);
  return 0;
}

void intercala(Questao *v, int inicio, int fim) {
  int tamanho = fim - inicio + 1;
  int meio = (inicio + fim) / 2;
  Questao listaAux[tamanho];
  int i=inicio, j=meio+1, k=0;

  while (i <= meio && j <= fim) {
    if (comparaProblema(v[i], v[j])) {
      listaAux[k++] = v[j++];
    } else {
      listaAux[k++] = v[i++]; 
    }
  }

  while (i <= meio) {
    listaAux[k++] = v[i++];
  }

  while (j <= fim) {
    listaAux[k++] = v[j++];
  }

  for (int i=0; i<tamanho; i++) {
    v[inicio + i] = listaAux[i];
  }
}

void mergesort(Questao *v, int inicio, int fim) {
  if (inicio < fim) {
    int meio = (inicio + fim) / 2;
    mergesort(v, inicio, meio);
    mergesort(v, meio+1, fim);
    intercala(v, inicio, fim);
  }
}

/*
void swap(Questao *a, Questao *b) {
  Questao temp = *a;
  *a = *b;
  *b = temp;
}

Questao medianaDeTres(Questao *v, int inicio, int fim) {
  int meio = inicio + (fim - inicio) / 2;
  if (v[meio].dificuldade < v[inicio].dificuldade) {
    swap(&v[meio], &v[inicio]);
  }
  if (v[fim].dificuldade < v[inicio].dificuldade) {
    swap(&v[fim], &v[inicio]);
  }
  if (v[meio].dificuldade < v[fim].dificuldade) {
    swap(&v[meio], &v[fim]);
  }
  return v[fim];
}

int particiona(Questao *v, int inicio, int fim) {
  Questao pv = medianaDeTres(v, inicio, fim);
  int i = inicio - 1;

  for (int j=inicio; j < fim; j++) {
    if (comparaProblema(pv, v[j])) {
      i++;
      swap(&v[i], &v[j]);
    }
  }

  swap(&v[i+1], &v[fim]);
  return (i+1);
}

void quicksort(Questao *v, int inicio, int fim) {
  if (inicio < fim) {
    int pvIndex = particiona(v, inicio, fim);
    quicksort(v, inicio, pvIndex-1);
    quicksort(v, pvIndex+1, fim);
  }
}
*/

int main() {
  int numTestes, numMembros, numQuestoes;

  scanf("%d", &numTestes);

  for (int i=0; i<numTestes; i++) {
    scanf("%d %d", &numMembros, &numQuestoes);
    Questao *listaQuestoes = (Questao *)malloc(numMembros * numQuestoes * sizeof(Questao));
    
    int k=0;
    for (int i=0; i<numMembros; i++) {
      for (int j=0; j<numQuestoes; j++) {
        scanf("%lf", &listaQuestoes[k].dificuldade);
        listaQuestoes[k].idMembro = i+1;
        listaQuestoes[k].idQuestao = j+1;
        k++;
      }
    }

    mergesort(listaQuestoes, 0, k-1);

    for (int i=0; i<k; i++) {
      printf("%d,%d ", listaQuestoes[i].idMembro, listaQuestoes[i].idQuestao);
    }
    printf("\n");

    free(listaQuestoes);
  }

  return 0;
}