#include <stdio.h>
#include <stdlib.h>

#define TAM_CNPJ 14

int verifica_cnpj(char cnpj[]) // Verifica um CNPJ
{
	// XXXXXXXX0001XX
	
	// Declara��es
	int dado_valido;
	int valores_cnpj[TAM_CNPJ];
	int sequencia_verificacao1[] = {5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2}; // Para primeiro digito verificador
	int sequencia_verificacao2[] = {6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2}; // Para segundo digito verificador
	int digito_verificador;
	
	// Instru��es
	dado_valido = 1;
	
	// Verifica��o do formato
	if (cnpj[TAM_CNPJ] != '\0') {
		dado_valido = 0; // Caso chegou aqui, h� mais caracteres que o devido.
	}
	
	// Verifica��o dos valores num�ricos
	for (int i = 0; i < (TAM_CNPJ); i++) {
		if (!(cnpj[i] >= 48 && cnpj[i] <= 57)) {
			dado_valido = 0; // Caso chegou aqui, um caracter do CNPJ n�o � um n�mero.
		}
	}
	
	// Verifica��o do 0001 ou "matriz"
	// Como estamos cadastrando uma usina, e n�o uma filial, o CNPJ ter� somente o 0001.
	for (int i = 8; i < (TAM_CNPJ-4); i++) {
		if (cnpj[i] != '0') dado_valido = 0; // Caso chegou aqui, h� um valor incorreto.
	}
	
	//if (cnpj[TAM_CNPJ-3] != '1') dado_valido = 0; // Caso chegou aqui, h� um valor incorreto.
	
	// Armazenamento dos valores n�mericos do CNPJ
	for (int i = 0; i < (TAM_CNPJ); i++) {
		valores_cnpj[i] = (cnpj[i] - '0'); // Pega os valores num�ricos do CNPJ e guarda num vetor int.
	}
	
	
	
	//Verifica��o dos digitos verificadores:
	
	// Primeiro digito verificador
	
	digito_verificador = 0;
	for (int i = 0; i < TAM_CNPJ-2; i++) {
		// Soma todos os resultados da multiplica��o entre os n�meros do CNPJ e dos respectivos n�meros
		// na posi��es da primeira sequ�ncia de verifica��o.
		digito_verificador = (digito_verificador + (valores_cnpj[i] * sequencia_verificacao1[i]));
	}
	
	digito_verificador = digito_verificador % 11; // Divide o resultado por 11.
	
	if (digito_verificador < 2) { // Resto da divis�o for menor que 2.
		digito_verificador = 0; // Caso chegou aqui, o primeiro digito verificador � 0.
		
	} else { // Resto da divis�o n�o for menor 2.
		digito_verificador = (11 - digito_verificador); // Caso chegou aqui, o primeiro digito verificador � igual a 11 menos o resto.
	}
	
	if (valores_cnpj[TAM_CNPJ-2] != digito_verificador) { // Compara o digito do CNPJ e o digito encontrado no algoritmo anterior.
		dado_valido = 0; // Caso chegou aqui, o primeiro digito verificador do CNPJ est� incorreto.
	}
	
	// Segundo digito verificador
	
	digito_verificador = 0;
	for (int i = 0; i < TAM_CNPJ-1; i++) {
		// Soma todos os resultados da multiplica��o entre os n�meros do CNPJ e dos respectivos n�meros
		// na posi��es da segunda sequ�ncia de verifica��o.
		digito_verificador = (digito_verificador + (valores_cnpj[i] * sequencia_verificacao2[i]));
	}
	
	digito_verificador = digito_verificador % 11;
	
	if (digito_verificador < 2) { // Resto da divis�o for menor que 2.
		digito_verificador = 0; // Caso chegou aqui, o segundo digito verificador � 0.
		
	} else { // Resto da divis�o n�o for menor 2.
		digito_verificador = (11 - digito_verificador); // Caso chegou aqui, o segundo digito verificador � igual a 11 menos o resto.
	}
	
	if (valores_cnpj[TAM_CNPJ-1] != digito_verificador) { // Compara o digito do CNPJ e o digito encontrado no algoritmo anterior.
		dado_valido = 0; // Caso chegou aqui, o segundo digito verificador do CNPJ est� incorreto.
	}
	
	return dado_valido;
}

int main() 
{
	char cnpj_usina[TAM_CNPJ];
	int dado_valido;
	
	scanf("%s", cnpj_usina);
	
	dado_valido = verifica_cnpj(cnpj_usina);
	
	printf("%i", dado_valido);
	
	return 0;
}
