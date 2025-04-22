#include <stdio.h>

#define NORTE 1
#define SUL 2
#define LESTE 3
#define OESTE 4

void atualizarPosicao(int posHomens[2], int mov) {
  switch(mov) {
    case NORTE:
      posHomens[1]++;
    break;
    case SUL:
      posHomens[1]--;
    break;
    case LESTE:
      posHomens[0]++;
    break;
    case OESTE:
      posHomens[0]--;
    break;
  }
}

int verificarMic(int posHomens[2], int posMic[2]) {
  int coordenadasOuvidas[9][2] = {{posMic[0], posMic[1]+1},
                                  {posMic[0]+1, posMic[1]},
                                  {posMic[0], posMic[1]},
                                  {posMic[0]-1, posMic[1]},
                                  {posMic[0], posMic[1]-1},
                                  {posMic[0]+1, posMic[1]+1},
                                  {posMic[0]+1, posMic[1]-1},
                                  {posMic[0]-1, posMic[1]+1},
                                  {posMic[0]-1, posMic[1]-1}};

  for (int i=0; i<9; i++) {
    if (posHomens[0] == coordenadasOuvidas[i][0] && posHomens[1] == coordenadasOuvidas[i][1]) {
      // printf("ouvido.\n");
      return 1;
    }
  }

  return 0;
}

int main() {
  int n, m, numPassos, movHomens, minutos = 0;
  int posMic[2];
  int posHomens[2] = {0, 0};

  scanf("%d %d", &n, &m);

  scanf("%d %d", &posMic[0], &posMic[1]);

  scanf("%d", &numPassos);

  for (int i=0; i<numPassos; i++) {
    scanf("%d", &movHomens);
    atualizarPosicao(posHomens, movHomens);
    // printf("(%d,%d)\n", posHomens[0], posHomens[1]);
    minutos += verificarMic(posHomens, posMic);
  } 

  printf("%d\n", minutos);

  return 0;
}