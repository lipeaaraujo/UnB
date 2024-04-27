#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// definicoes de tamanhos maximos das informacoes.
#define TAMANHO_TEXTO 50
#define TAMANHO_ENDERECO 200
#define TAMANHO_CPF 15
#define TAMANHO_RG 13
#define TAMANHO_PLACA 9

// structs.
typedef struct {
  char marca[TAMANHO_TEXTO];
  char modelo[TAMANHO_TEXTO];
  char placa[TAMANHO_PLACA];
} Automovel;

typedef struct {
  char nome[TAMANHO_TEXTO];
  char rg[TAMANHO_RG];
  char cpf[TAMANHO_CPF];
  char endereco[TAMANHO_ENDERECO];
  int idade;
  int qntdAutomoveis;
  Automovel* automoveis;
} Pessoa;

// funcoes.
void limparBuffer() {
  int c;
  while ((c = getchar()) != '\n' && c != EOF);
}

void limparTela() {
    #ifdef _WIN32
        system("cls");
    #else
        system("clear");
    #endif
}

void listarCadastros() {
  // leia o arquivo e liste todos os dados cadastrados.
  FILE *arquivo;
  Pessoa pessoa;
  Automovel *automoveis;

  arquivo = fopen("dados_pessoa_automoveis.bin", "rb");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao existem cadastros realizados!\n");
    return;
  }

  printf("LISTAGEM DE CADASTROS\n\n");

  do {
    // leia a pessoa, aloque a memoria para os automoveis e leia os automoveis.
    fread(&pessoa, sizeof(Pessoa), 1, arquivo);
    pessoa.automoveis = (Automovel *)malloc(pessoa.qntdAutomoveis * sizeof(Automovel));
    fread(pessoa.automoveis, sizeof(Automovel), pessoa.qntdAutomoveis, arquivo);

    // se chegar no do arquivo, quebre a execução.
    if (feof(arquivo)) break;

    printf("Nome: %s\n", pessoa.nome);
    printf("RG: %s\n", pessoa.rg);
    printf("CPF: %s\n", pessoa.cpf);
    printf("Endereco: %s\n", pessoa.endereco);
    printf("Idade: %d\n\n", pessoa.idade);

    printf("Automoveis:\n");
    
    // printe as informacoes de cada automovel.
    for(int i = 0; i < pessoa.qntdAutomoveis; i++) {
      printf("Marca: %s Modelo: %s Placa: %s\n",
             pessoa.automoveis[i].marca, pessoa.automoveis[i].modelo, pessoa.automoveis[i].placa);
    }

    printf("\n-------------------\n\n");
  } while (!feof(arquivo));

  fclose(arquivo);

  do {
    printf("(Enter) para sair ");
  } while(getchar() != '\n');
  
  limparTela();
}

void cadastrarAutomoveis(Pessoa* proprietario) {
  // coleta os dados de entrada e cadastra um novo automovel.
  Automovel carroNovo;

  // aloca memoria para permitir o cadastro de automoveis no proprietario.
  proprietario->automoveis = (Automovel *)malloc(proprietario->qntdAutomoveis * sizeof(Automovel));

  printf("CADASTRO DE AUTOMOVEIS\n\n");

  // pegue os dados dos automoveis.
  for (int i = 0; i < proprietario->qntdAutomoveis; i++) {
    printf("Marca: ");
    fgets(carroNovo.marca, TAMANHO_TEXTO, stdin);
    carroNovo.marca[strcspn(carroNovo.marca, "\n")] = '\0';

    printf("Modelo: ");
    fgets(carroNovo.modelo, TAMANHO_TEXTO, stdin);
    carroNovo.modelo[strcspn(carroNovo.modelo, "\n")] = '\0';

    printf("Placa: ");
    fgets(carroNovo.placa, TAMANHO_PLACA, stdin);
    carroNovo.placa[strcspn(carroNovo.placa, "\n")] = '\0';

    printf("\n");

    proprietario->automoveis[i] = carroNovo;
  }
}

void salvarPessoa(Pessoa* pessoaNova) {
  // salva a struct de uma pessoa e o vetor de automoveis no arquivo de dados.
  FILE* arquivo;
  arquivo = fopen("dados_pessoa_automoveis.bin", "ab");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao foi possivel abrir o arquivo para salvar!\n");
    return;
  }

  fwrite(pessoaNova, sizeof(Pessoa), 1, arquivo);
  fwrite(pessoaNova->automoveis, sizeof(Automovel), pessoaNova->qntdAutomoveis, arquivo);

  free(pessoaNova->automoveis);

  fclose(arquivo);

  limparTela();
  printf("Pessoa cadastrada com sucesso!\n");
}

void cadastrarPessoa() {
  // coleta os dados de entrada e cadastra uma nova pessoa.
  Pessoa pessoaNova;

  printf("CADASTRO DE PESSOA\n\n");

  printf("Nome Completo: ");
  fgets(pessoaNova.nome, TAMANHO_TEXTO, stdin);
  pessoaNova.nome[strcspn(pessoaNova.nome, "\n")] = '\0';
  
  printf("RG: ");
  fgets(pessoaNova.rg, TAMANHO_RG, stdin);
  pessoaNova.rg[strcspn(pessoaNova.rg, "\n")] = '\0';
  
  printf("CPF: ");
  fgets(pessoaNova.cpf, TAMANHO_CPF, stdin);
  pessoaNova.cpf[strcspn(pessoaNova.cpf, "\n")] = '\0';
  
  printf("Endereco: ");
  fgets(pessoaNova.endereco, TAMANHO_ENDERECO, stdin);
  pessoaNova.endereco[strcspn(pessoaNova.endereco, "\n")] = '\0';
  
  printf("Idade: ");
  scanf("%d", &pessoaNova.idade);

  printf("Numero de automoveis: ");
  do {
    scanf("%d", &pessoaNova.qntdAutomoveis);
  } while(pessoaNova.qntdAutomoveis <= 0);

  printf("\n");
  limparBuffer();

  cadastrarAutomoveis(&pessoaNova);
  salvarPessoa(&pessoaNova);

}

void mostrarMenu() {
  printf("PROPRIETARIO DE AUTOMOVEIS\n\n");
  printf("Selecione uma opcao:\n");
  printf("1 - Cadastrar pessoa e automovel\n");
  printf("2 - Listar cadastros\n");
  printf("3 - Sair\n\n");
}

// funcao principal.
int main() {

  int op;

  do {
    mostrarMenu();
    scanf("%d", &op);
    limparBuffer();

    switch (op) {
      case 1:
        limparTela();
        cadastrarPessoa();
        break;
      case 2:
        limparTela();
        listarCadastros();
        break;
      case 3:
        printf("\nSaindo...\n");
        break;
      default:
        printf("Opcao invalida!");
    }

  } while(op != 3);

}