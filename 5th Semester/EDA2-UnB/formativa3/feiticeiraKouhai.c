#include <stdio.h>
#include <stdlib.h>

typedef struct Item {
  int id;
  int qnt;
  int vazio;
} Item;

typedef struct TabelaHash {
  Item **tab;
  int tam;
} TabelaHash;

int hash(int tam, int ch) {
  return ((ch % tam) + tam) % tam;
}

TabelaHash *iniciarTabela(int tam) {
  TabelaHash *novo = (TabelaHash *)malloc(sizeof(TabelaHash));
  novo->tab = (Item **)malloc(tam * sizeof(Item *));
  for (int i=0; i<tam; i++) {
    novo->tab[i] = (Item *)malloc(sizeof(Item));
    novo->tab[i]->vazio = 1;
  }
  novo->tam = tam;
  return novo;
}

int busca(TabelaHash *th, Item item) {
  int pos = hash(th->tam, item.id);
  while(!th->tab[pos]->vazio && th->tab[pos]->id != item.id) {
    pos = (pos + 1) % th->tam;
  }
  if (th->tab[pos]->id == item.id) return pos;
  return -1;
}

void inserir(TabelaHash *th, Item item) {
  int pos = hash(th->tam, item.id);
  while(!th->tab[pos]->vazio) {
    if (th->tab[pos]->id == item.id) {
      th->tab[pos]->qnt += item.qnt;
      return;
    }
    pos = (pos + 1) % th->tam;
  }
  *(th->tab[pos]) = item; 
}

void remocao(TabelaHash *th, Item item) {
  int pos = busca(th, item);
  if (pos >= 0) {
    th->tab[pos]->qnt += item.qnt;
    if (th->tab[pos]->qnt <= 0) {
      th->tab[pos]->vazio = 1;
      pos = (pos + 1) % th->tam;
      while (!th->tab[pos]->vazio) {
        Item elem = *(th->tab[pos]);
        th->tab[pos]->vazio = 1;
        inserir(th, elem);
        pos = (pos + 1) % th->tam;
      }
    }
  }
}

void liberar(TabelaHash *th) {
  for(int i=0; i<th->tam; i++) {
    free(th->tab[i]);
  }
  free(th->tab);
  free(th);
}

long soma(TabelaHash *th) {
  long soma = 0;
  for(int i=0; i<th->tam; i++) {
    if (!th->tab[i]->vazio) soma += th->tab[i]->qnt;
  }
  return soma;
}

int main() {
  int qItens;
  Item item;
  TabelaHash *th;

  scanf("%d", &qItens);
  th = iniciarTabela(qItens);

  for(int i=0; i<qItens; i++) {
    scanf("%d %d", &item.id, &item.qnt);
    if (item.qnt > 0) {
      inserir(th, item);
    } else if (item.qnt < 0) {
      remocao(th, item);
    }
  }

  printf("%ld\n", soma(th));
  liberar(th);
  return 0;
}