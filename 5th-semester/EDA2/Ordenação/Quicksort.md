# Quicksort

É um algoritmo que usa a técnica de divisão e conquista e, a cada divisão, resolve o problema da separação (ou particionamento).

- Dado um vetor V[e...d], queremos definir um índice j tal que: 
  - $V[e...j-1] \le V[j] < V[j+1...d]$ (1)

Como resolver o particionamento:

1. Escolher arbitrariamente um elemento do vetor (pivô).
2. Encontrar o índice j e posicionar oo pivô neste índice de tal forma a cumprir (1).

|  | e | | | | | | | | | | | | d |
|--|---|-|-|-|-|-|-|-|-|-|-|-|---|
| V | $\le p$ | $\le p$ | $\le p$ | $\le p$ | $>p$ | $>p$ | $>p$ | $>p$ | ? | ? | ? | ? | $p$ |

- se $V[k] > p$ mantenha onde está e incremente o $k$.
- se $V[k] \le p$, troca $v[k]$ com $v[j]$ e incrementa $j$ e $k$. 

**Particionamento**

```c
void troca(int *a, int *b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}
```

```c
int particionar(int *v, int inicio, int final) {
  int pivo = v[fim];
  int i = inicio;

  for (int j=inicio; j<final; j++) {
    if (v[j] <= pivo) {
      troca(&v[i], &v[k]);
      i++;
    }
  }

  troca(&v[i], &v[fim])

  return i;
}
```

**Implementação**
```c
void quicksort(int *v. int inicio, int final) {
  if (inicio < final) {
    int indexPivo = particionar(v, inicio, final);
    quicksort(v, inicio, indexPivo);
    quicksort(v, indexPivo+1, final);
  }
}
```

## Estabilidade do Quicksort

O quicksort não é estável, o modo como o particiona é implementado permite que elementos iguais troquem de posições relativas durante a sua execução.

Algoritmos de ordenação estáveis garantem que, se dois elementos são iguais,a ordem relativa deles permanece a mesma após a ordenação. Isso é útil quando se quer ordenar elementos e manter a ordem de prioridade entre eles.

<ins>Exercício:</ins> como implementar Quicksort estável.

```c
typedef struct Aluno {
  int id;
  int nota;
} Aluno;
```
```c
void troca(Aluno *a, Aluno *b) {
  Aluno temp = *a;
  *a = *b;
  *b = temp;
}

int compara(Aluno *a, Aluno *b) {
  if (a->nota < b->nota) return 1;
  if (a->nota == b->nota) return (a->id < b->id);
  return 0;
}

int particionar(Aluno *v, int inicio, int fim) {
  Aluno pivo = v[fim];
  int i = inicio;

  for (int j=inicio; j<fim; j++) {
    if (compara(v[j], pivo)) {
      troca(&v[j], &v[i]);
      i++;
    }
  }

  troca(&v[i], &v[fim]);
  return i;
}
```
```c
void quicksort(Aluno *v, int inicio, int fim) {
  if (inicio < fim) {
    int indexPivo = particionar(v, inicio, fim);
    quicksort(v, inicio, indexPivo);
    quicksort(v, indexPivo+1, fim);
  }
}
```