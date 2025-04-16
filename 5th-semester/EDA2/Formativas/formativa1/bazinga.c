#include <stdio.h>
#include <string.h>

#define EMPATE 0
#define SHELDON 1
#define RAJ 2

int definirVencedor(char escolhaSheldon[9], char escolhaRaj[9]) {
  // retorna 0 para empate, 1 para sheldon, 2 para raj.

  if (strcmp(escolhaSheldon, escolhaRaj) == 0) {
    // empate.
    return EMPATE;
  }

  if (strcmp(escolhaSheldon, "tesoura") == 0) {
    if (strcmp(escolhaRaj, "papel") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "Spock") == 0) return RAJ;
    if (strcmp(escolhaRaj, "lagarto") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "pedra") == 0) return RAJ;
  }

  if (strcmp(escolhaSheldon, "papel") == 0) {
    if (strcmp(escolhaRaj, "tesoura") == 0) return RAJ;
    if (strcmp(escolhaRaj, "Spock") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "lagarto") == 0) return RAJ;
    if (strcmp(escolhaRaj, "pedra") == 0) return SHELDON;
  }

  if (strcmp(escolhaSheldon, "pedra") == 0) {
    if (strcmp(escolhaRaj, "papel") == 0) return RAJ;
    if (strcmp(escolhaRaj, "Spock") == 0) return RAJ;
    if (strcmp(escolhaRaj, "lagarto") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "tesoura") == 0) return SHELDON;
  }
  
  if (strcmp(escolhaSheldon, "lagarto") == 0) {
    if (strcmp(escolhaRaj, "papel") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "Spock") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "pedra") == 0) return RAJ;
    if (strcmp(escolhaRaj, "tesoura") == 0) return RAJ;
  }

  if (strcmp(escolhaSheldon, "Spock") == 0) {
    if (strcmp(escolhaRaj, "papel") == 0) return RAJ;
    if (strcmp(escolhaRaj, "lagarto") == 0) return RAJ;
    if (strcmp(escolhaRaj, "tesoura") == 0) return SHELDON;
    if (strcmp(escolhaRaj, "pedra") == 0) return SHELDON;
  }
}

int main() {
  int vencedor;
  char escolhaSheldon[9], escolhaRaj[9];

  scanf("%s %s", escolhaSheldon, escolhaRaj);

  vencedor = definirVencedor(escolhaSheldon, escolhaRaj);

  switch (vencedor) {
    case EMPATE:
      printf("De novo!\n");
    break;
    case SHELDON:
      printf("Bazinga!\n");
    break;
    case RAJ:
      printf("Raj trapaceou!\n");
    break;
  }

  return 0;
}