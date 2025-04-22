#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

int contador = 0; // guarda o numero de sinais recebidos

void handlerSinais(int s) {
  contador++;
}

int main() {
  pid_t idFilho;
  signal(SIGUSR1, handlerSinais);
  signal(SIGUSR2, handlerSinais);

  pause();
  idFilho = fork();
  if (idFilho == 0) {
    // execução do processo filho.
    exit(0);
  }

  pause();
  wait(NULL);

  pause();
  exit(0);
}