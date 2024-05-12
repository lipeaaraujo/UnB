/* adicionar o fclose e fflush tem efeito essencial na solução, apesar de eu não entender o motivo */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <errno.h>

#define MAX_BUF 256

int main() {
  char path[MAX_BUF], args[MAX_BUF];
  int status, retorno;
  struct timeval ti, tf, tti, ttf;
  double tempo, total = 0;
  pid_t filho;

  gettimeofday(&tti, NULL);
  while(scanf("%s %s", path, args) != EOF) {
    filho = fork();
    gettimeofday(&ti, NULL);

    if (filho == 0) {
      execl(path, path, args, NULL);
      if (strcmp(strerror(errno), "Success") != 0) {
        printf("> Erro: %s\n", strerror(errno));
        fclose(stdin);
        exit(errno);
      }
    }

    if (waitpid(filho, &status, WUNTRACED)) {
      gettimeofday(&tf, NULL);
      tempo = (double)(tf.tv_sec - ti.tv_sec) + (double)(tf.tv_usec - ti.tv_usec) / 1000000.0;
      printf("> Demorou %.1lf segundos, retornou %d\n", tempo, WEXITSTATUS(status));
    }
    fflush(stdout);
  }
  gettimeofday(&ttf, NULL);

  total = (double)(ttf.tv_sec - tti.tv_sec) + (double)(ttf.tv_usec - tti.tv_usec) / 1000000.0;

  printf(">> O tempo total foi de %.1lf segundos\n", total);
  return 0;
}