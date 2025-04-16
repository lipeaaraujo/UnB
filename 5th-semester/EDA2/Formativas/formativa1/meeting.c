#include <stdio.h>

#define NORTE 1
#define SUL 2
#define LESTE 3
#define OESTE 4

void atualizarPosicao(int posPA[2], int posPB[2], int movPA, int movPB) {
  switch(movPA) {
    case NORTE:
      posPA[1]++;
    break;
    case SUL:
      posPA[1]--;
    break;
    case LESTE:
      posPA[0]++;
    break;
    case OESTE:
      posPA[0]--;
    break;
  }

  switch(movPB) {
    case NORTE:
      posPB[1]++;
    break;
    case SUL:
      posPB[1]--;
    break;
    case LESTE:
      posPB[0]++;
    break;
    case OESTE:
      posPB[0]--;
    break;
  }
}

int verificarColisao(int posPA[2], int posPB[2]) {
  return (posPA[0] == posPB[0] && posPA[1] == posPB[1]) ? 1 : 0;
}

int verificarSaidaPA(int posPA[2], int colunas, int linhas) {
  return ((posPA[0] < 1 || posPA[0] > colunas) || (posPA[1] < 1 || posPA[1] > linhas)) ? 1 : 0;
}

int verificarSaidaPB(int posPB[2], int colunas, int linhas) {
  return ((posPB[0] < 1 || posPB[0] > colunas) || (posPB[1] < 1 || posPB[1] > linhas)) ? 1 : 0;
}

int main() {
  int colunas, linhas, movimentos, movPA, movPB;
  int colisao = 0, movColisao, saidaPA = 0, saidaPB = 0, movSaidaPA = 0, movSaidaPB = 0; 
  int posPA[2], posPB[2], posColisao[2], posSaidaPA[2], posSaidaPB[2];

  scanf("%d %d", &colunas, &linhas);

  posPA[0] = 1;
  posPA[1] = 1;
  posPB[0] = colunas;
  posPB[1] = linhas;

  scanf("%d", &movimentos);

  for(int i=0; i<movimentos; i++) {
    scanf("%d %d", &movPA, &movPB);
    atualizarPosicao(posPA, posPB, movPA, movPB);

    if (verificarColisao(posPA, posPB)) {
      printf("Encontraram-se na posicao (%d, %d) no passo %d\n", posPA[0], posPA[1], i+1);
      return 0;
    }
    if (verificarSaidaPA(posPA, colunas, linhas)) {
      printf("PA saiu na posicao (%d,%d) no passo %d\n", posPA[0], posPA[1], i+1);
      return 0;
    } else if (verificarSaidaPB(posPB, colunas, linhas)) {
      printf("PB saiu na posicao (%d,%d) no passo %d\n", posPB[0], posPB[1], i+1);
      return 0;
    } 
    

    // if (verificarColisao(posPA, posPB)) {
    //   colisao = 1;
    //   posColisao[0] = posPA[0];
    //   posColisao[1] = posPB[1];
    //   movColisao = i + 1;
    // }

    // if (verificarSaidaPA(posPA, colunas, linhas) && !saidaPA) {
    //   // printf("PA está fora\n");
    //   saidaPA = 1;
    //   posSaidaPA[0] = posPA[0];
    //   posSaidaPA[1] = posPA[1];
    //   movSaidaPA = i + 1;
    // }

    // if (verificarSaidaPB(posPB, colunas, linhas) && !saidaPB) {
    //   // printf("PB está fora\n");
    //   saidaPB = 1;
    //   posSaidaPB[0] = posPB[0];
    //   posSaidaPB[1] = posPB[1];
    //   movSaidaPB = i + 1;
    // }
    // printf("(%d,%d) (%d,%d)\n", posPA[0], posPA[1], posPB[0], posPB[1]);
  }

  // if (colisao) {
  //   printf("Encontraram-se na posicao (%d, %d) no passo %d\n", posColisao[0], posColisao[1], movColisao);
  // }

  // if (saidaPA) {
  //   printf("PA saiu na posicao (%d,%d) no passo %d\n", posSaidaPA[0], posSaidaPA[1], movSaidaPA);
  // }

  // if (saidaPB && movSaidaPB != movSaidaPA) {
  //   printf("PB saiu na posicao (%d,%d) no passo %d\n", posSaidaPB[0], posSaidaPB[1], movSaidaPB);
  // }

  printf("Nao se encontraram\n");

  return 0;
}