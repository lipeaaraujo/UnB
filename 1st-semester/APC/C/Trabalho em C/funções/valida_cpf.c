// VERIFICADOR DE CPF
#include <stdio.h>
#include <stdlib.h>

#define TAM_CPF 14

int valida_cpf(char cpf[]) 
{
    //XXX.XXX.XXX-XX
    int dado_valido, j, k;
    int valores_cpf[TAM_CPF-3];
    int digito_verificador;
    
    dado_valido = 1;
    
    // Verifica��o da estrutura
    
    // Verifica se existe algum caracter al�m do normal
    if (cpf[TAM_CPF] != '\0') {
        dado_valido = 0;
    }
    
    // Verifica se os caracteres das respectivas posi��es s�o caracteres num�ricos
    for (int i = 0; i < TAM_CPF-11; i++) {
        if (!(cpf[i] >= 48 && cpf[i] <= 57)) {
            dado_valido = 0;
        }
    }
    
    for (int i = 4; i < TAM_CPF-7; i++) {
        if (!(cpf[i] >= 48 && cpf[i] <= 57)) {
            dado_valido = 0;
        }
    }
    
    for (int i = 8; i < TAM_CPF-3; i++) {
        if (!(cpf[i] >= 48 && cpf[i] <= 57)) {
            dado_valido = 0;
        }
    }
    
    for (int i = 12; i < TAM_CPF; i++) {
        if (!(cpf[i] >= 48 && cpf[i] <= 57)) {
            dado_valido = 0;
        }
    }
    
    // Verifica os s�mbolos
    if (cpf[TAM_CPF-11] != 46 || cpf[TAM_CPF-7] != 46 || cpf[TAM_CPF-3] != 45) {
        dado_valido = 0;
    }
    
    // Guarda os caracteres num�ricos do CPF em um vetor int na forma de valor num�ricos
    j = 0;
    for (int i = 0; i < TAM_CPF; i++) {
        if (cpf[i] >= 48 && cpf[i] <= 57) {
            valores_cpf[j] = (cpf[i] - '0');
            j++;
        }
    }
    
    // Verifica��o dos digitos verificadores
    k = 10;
    for (int i = 0; i < TAM_CPF-2; i++) {
        digito_verificador = (valores_cpf[i] * k);
        k--;
    }
    
    return dado_valido;
}

int main()
{
    char cpf[TAM_CPF];
    int dado_valido;
    
    scanf("%s", cpf);
    
    dado_valido = valida_cpf(cpf);
    
    printf("%i", dado_valido);
    
    return 0;
}
