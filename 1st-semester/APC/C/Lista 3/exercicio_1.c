#include <stdio.h>

int main ()
{
	// Declara��es
	int N, menor, posicao;
	
	// Instru��es
	
	// Entrada de dados:
	scanf("%i", &N);
	
	int X[N];
	
	for (int i = 0; i <N; i++) {
		scanf("%i", &X[i]);	
	}
	
	menor = calcula_menor(X, N);
	posicao = informa_posicao(menor, N, X);
	
	// Sa�da de dados:
	printf("Menor valor: %i\n", menor);
	printf("Posicao: %i\n", posicao);
	
	return 0;
}

// Fun��o que calcula o menor valor de um vetor:
int calcula_menor(int vetor[], int num_elementos)
{
	int menor = vetor[0];
	
	for (int i = 0; i < num_elementos; i++) {
		if (vetor[i] < menor) {
			menor = vetor[i];
		}
	}
	
	return menor;
}

// Fun��o que informa a posi��o de um valor em um vetor
int informa_posicao(int valor, int num_elementos, int vetor[])
{
	int posicao;
	
	for (int i = 0; i < num_elementos; i++){
		if (valor == vetor[i]) {
			posicao = i;
		}
	}
	
	return posicao;
}
