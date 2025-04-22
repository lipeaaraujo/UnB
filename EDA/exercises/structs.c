#include <stdio.h>

typedef struct
{
    int Idade;
    float Peso;
    float Altura;
} Pessoa;

void ImprimePessoa(Pessoa P) {// declara o parâmetro como uma struct
    printf("Idade: %d Peso: %.2f Altura: %.2f\n", P.Idade, P.Peso, P.Altura);
}   

int main() {
    Pessoa Joao, P2;
    Pessoa Povo[10];

    Joao.Idade = 15;
    Joao.Peso = 60.5;
    Joao.Altura = 1.75;

    Povo[4].Idade = 23;
    Povo[4].Peso = 75.3;
    Povo[4].Altura = 1.89;

    P2 = Povo[4];
    P2.Idade++;
    // chama a função que recebe a struct como parâmetro
    ImprimePessoa(Joao);
    ImprimePessoa(Povo[4]);
    ImprimePessoa(P2);
}