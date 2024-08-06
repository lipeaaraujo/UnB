#include <stdio.h>
#include <string.h>

#define TAM_LUGAR 4

void limparBuffer() {
  int c;
  while ((c = getchar()) != '\n' && c != EOF);
}

int verificarLugarPreenchido(char fileira, int numLugar, char lugares[][TAM_LUGAR], int numPreenchidos) {
  char codigoLugar[TAM_LUGAR];
  codigoLugar[0] = fileira;

  if (numLugar < 10) {
    codigoLugar[1] = '0' + numLugar;
    codigoLugar[2] = '\0';
  } else {
    codigoLugar[1] = '0' + (numLugar / 10);
    codigoLugar[2] = '0' + (numLugar % 10);
    codigoLugar[3] = '\0';
  }

  for (int i=0; i<numPreenchidos; i++) {
    if (strcmp(lugares[i], codigoLugar) == 0) {
      return 1;
    }
  }

  return 0;
}

void printarLugares(int numFileiras, int numLugares, char lugares[][TAM_LUGAR], int numPreenchidos) {
  char fileiraAtual;

  // printa o numero dos lugares.
  printf("  ");
  for (int i=1; i<=numLugares; i++) {
    printf(" %02d ", i);
  }

  printf("\n");

  // printa cada fileira e os lugares.
  for (int i=0; i<numFileiras; i++) {
    fileiraAtual = 'A' + (numFileiras-1 - i);
    printf("%c", fileiraAtual);
    for (int j=1; j<=numLugares; j++) {
      if (verificarLugarPreenchido(fileiraAtual, j, lugares, numPreenchidos)) {
        printf("  XX");
      } else {
        printf("  --");
      }
    }
    printf("\n");
  }
}

int main() {
  int numFileiras, numLugares;
  char lugares[500][TAM_LUGAR];
  int numPreenchidos = 0;

  scanf("%d %d", &numFileiras, &numLugares);
  limparBuffer();

  for(int i=0; i<500; i++) {
    fgets(lugares[i], TAM_LUGAR, stdin);
    lugares[i][strcspn(lugares[i], "\n")] = '\0';
    numPreenchidos++;
  }

  printarLugares(numFileiras, numLugares, lugares, numPreenchidos);

  return 0;
}