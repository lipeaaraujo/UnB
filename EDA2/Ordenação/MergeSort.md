# Ordenação por intercalação (Merge Sort)

- **divisão:** divide o vetor em "metades"
- **conquista:** intercale duas "metades" (cada metade deve estar ordenada)

```c
void intercala(int *v, int inicio, int meio, int fim) {
  int tamanho = fim - inicio;
  int aux[tamanho];
  int i = inicio, j = meio+1, k = 0;

  while (i <= meio && j <= fim) {
    if (v[i] > v[j]) {
      aux[k++] = v[j++]; 
    } else {
      aux[k++] = v[i++];
    }
  }

  while (i <= meio) {
    aux[k++] = v[i++];
  }

  while (j <= fim) {
    aux[k++] = v[j++];
  }

  for (int i=0; i<tamanho; i++) {
    v[inicio + i] = k[i];
  }
}
```

```c
void mergesort(int *v, int inicio, int final) {
  if (inicio < final) {
    int meio = (inicio + final) / 2;

    mergesort(v, inicio, meio);
    mergesort(v, meio+1, final);
    intercala(v, inicio, meio, final);
  }
}
```

$O(nlogn)$

Em uma árvore:
- nível 0: 1 pedaço ($2⁰$)
- nível 1: 2 pedaços ($2¹$)
- nível 2: 4 pedaços ($2²$)
- nível 3: 8 pedaços ($2³$)

$ n \le 2^k \rightarrow \log n \le \log 2^k \rightarrow k \ge \log n \rightarrow k = \log n $ ou $ k = \log {n+1} $