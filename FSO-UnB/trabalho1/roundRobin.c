/*
  eu teria feito toda a resoluçao do problema usando um round-robin
  com todo o algoritmo funcionando como uma pilha de execuçao, porem por algum motivo
  o exercício tem um benchmark que deixa qualquer solução que simule o round-robin
  de forma fiel impossível, ou eu simplesmente sou burro demais :/
*/

#include <stdio.h>
#include <stdlib.h>

#define MAX_PROCESSOS 100

typedef struct Processo {
  int pid;
  int tempoExecucao;
} Processo;

typedef struct Escalonador {
  Processo processos[MAX_PROCESSOS];
  int capacidade;
  int inicio;
  int tamanho;
  int janela;
} Escalonador;

Escalonador* criarEscalonador(int nProcessos, int janela) {
  Escalonador *esc = (Escalonador*)malloc(sizeof(Escalonador));
  esc->capacidade = nProcessos;
  esc->inicio = 0;
  esc->tamanho = 0;
  esc->janela = janela;
  return esc;
}

void enfileirar(Escalonador *esc, Processo p) {
  esc->processos[(esc->inicio + esc->tamanho) % esc->capacidade] = p;
  esc->tamanho++;
}

void desinfileirar(Escalonador *esc) {
  esc->tamanho--;
  esc->inicio = (esc->inicio + 1) % esc->capacidade;
}

int menorTempo(Escalonador *esc, int janela) {
  int tempo;
  int menorTempo = esc->processos[esc->inicio].tempoExecucao;

  for (int i=1; i<esc->tamanho; i++) {
    if (esc->processos[i + esc->inicio].tempoExecucao < menorTempo) {
      menorTempo = esc->processos[i + esc->inicio].tempoExecucao;
    }
  }

  tempo = (menorTempo/janela) * janela;
  if (tempo == menorTempo) tempo -= janela;

  return tempo;
}

void mostrarProcessos(Escalonador *esc) {
  for (int i=0; i<esc->tamanho; i++) {
    int index = (esc->inicio + i) % esc->capacidade;
    printf("(%d) ", esc->processos[index].pid);
  }
  printf("\n");
}

void processar(Escalonador *esc, int janela) {
  /*
    calcula o tempo que o escalonador vai executar cada processo antes de terminar
    o de menor tempo de execução, e executa mais uma janela. Esse processo é
    repetido até o escalonador estar vazio. Sim, é uma gambiarra.
   */

  int tempoTotal = 0, tempoExecutado, tamanhoAtual;
  Processo *pAtual;

  while (esc->tamanho > 0) {
    tamanhoAtual = esc->tamanho; // variavel para manter o tamanho antes de entrar no for.
    tempoExecutado = menorTempo(esc, janela);
    tempoTotal += tempoExecutado * tamanhoAtual;

    //printf("**%d %d**\n", esc->tamanho, tempoExecutado);

    for (int i=0; i<tamanhoAtual; i++) {
      int index = (i + esc->inicio) % esc->capacidade;
      esc->processos[index].tempoExecucao -= tempoExecutado;
    }

    for (int i=0; i<tamanhoAtual; i++) {
      pAtual = &esc->processos[esc->inicio];
      tempoExecutado = (janela < pAtual->tempoExecucao) ? janela : pAtual->tempoExecucao;
      pAtual->tempoExecucao -= tempoExecutado;
      tempoTotal += tempoExecutado;

      desinfileirar(esc);

      if (pAtual->tempoExecucao <= 0) {
        printf("%d (%d)\n", pAtual->pid, tempoTotal);
      } else {
        enfileirar(esc, *pAtual);
      }
    }
  }
}

int main() {
  int nProcessos, janelaTempo;
  Escalonador *escalonador;
  Processo processoAux;

  scanf("%d %d", &nProcessos, &janelaTempo);

  escalonador = criarEscalonador(nProcessos, janelaTempo);

  for (int i=0; i<nProcessos; i++) {
    scanf("%d %d", &processoAux.pid, &processoAux.tempoExecucao);
    processoAux.tempoExecucao *= 1000;
    enfileirar(escalonador, processoAux);
  }

  processar(escalonador, janelaTempo);
  
  free(escalonador);

  return 0;
}