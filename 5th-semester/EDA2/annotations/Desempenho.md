# Desempenho

Como medir desempenho? (tempo)
- algoritmo
- software/programa

**<ins>Ex:</ins>** multiplicação de matrizes

$ C = A_{n \times m} \times B_{m \times n} \rightarrow c_{ij} = \sum_{k=1}^{n} a_{ik} \cdot b_{kj}$

**O(n^3)**

```c
int maior(int *v, int n) {
  int m = v[0];
  for (int i=1; 1<n; i++) {
    if (v[i] > m) m = v[i];
  }
  return m;
}
```

Dizemos que $f(n)$ é $O(g(n))$ se existem constantes $c > 0$ e $n_0 \ge 0$ tais que:

$f(n) \le c.g(n), \forall n \ge n_0$

Outras notações:
- $\Omicron$
- $\Omega$
- $\Theta$
- $\omicron$
- $\omega$

$g(n)$ clássicas:
- 1 constante
- $lg(n)$ logaritma
- $n$ linear
- $nlg(n)$ linearítmico
- $n^k, k \ge 2$ polinomial
- $n!$

Suponha que um computador que consuma 0,001s por operação:

| $n$ | $O(n)$ | $O(nlgn)$ | $O(n²)$ | $O(n³)$ | $O(2^n)$ |
|-|-|-|-|-|-|
| 16 | 0,016s | 0,064s | 0,256s | 4s | 1m4s |
| 32 | 0,032s | 0,16s | 1s | 33s | 46 dias |
| 512 | 0,512s | 9s | 4m22s | 1 dia 13h | $10^{137}$ séc. |