# Árvores rubro-negras esquerdistas

### Inserção

```c
int ehPreto(no *r) {
  if (r == NULL) return 1;
  else return r->cor == PRETO;
}

int ehVermelho(no *) {
  if (r == NULL) return 0;
  else return r->cor == VERMELHO;
}

no *corrige(no *r) {
  if (ehPreto(r->esq) && ehVermelho(r->dir))
    r = rotacao_esquerda(r);
  if (ehVermelho(r->esq) && ehVermelho(r->esq->esq))
    r = rotacao_direita(r);
  if (ehVermelho(r->esq) && ehVermelho(r->dir))
    sobe_cor(r);

  return r;
}
```
```c
no *rotaciona_esquerda(no *r) {
  no *x = r->dir;
  x->cor = r->cor;
  r->cor = VERMELHO;
  r->dir = x->esq;
  x->esq = r;
  return x;
}
```
```c
no *rotaciona_direita(no *r) {
  no *x = r->esq;
  x->cor = r->cor;
  r->cor = VERMELHO;
  r->esq = x->dir;
  x->dir = r;
  return x;
}
```
```c
no *insere_novo(no *r, int x) {
  r = insere(r, x);
  r->cor = PRETO;
  return r;
}

no *insere(no *r, int x) {
  if (r == NULL) {
    no *novo = calloc(1, sizeof(no));
    novo->cor = VERMELHO; novo->chave=x;
    return novo;
  }
  else if (x < r->chave) r->esq = insere(r->esq, x);
  else if (x > r->chave) r->dir = insere(r->dir, x);
  r = corrige(r);
  return r;
}
```