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
  char cpf_proprietario[TAMANHO_CPF];
} Automovel;

typedef struct {
  char nome[TAMANHO_TEXTO];
  char rg[TAMANHO_RG];
  char cpf[TAMANHO_CPF];
  char endereco[TAMANHO_ENDERECO];
  int idade;
  int qntdAutomoveis;
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
  // liste todos as pessoas cadastradas e seu veiculos.
  FILE *arq_pessoas;
  FILE *arq_carros;

  Pessoa pessoa;
  Automovel automovel;
  
  // abra os arquivos de pessoas e automoveis.
  arq_pessoas = fopen("dados_pessoas.bin", "rb");
  arq_carros = fopen("dados_automoveis.bin", "rb");

  if (arq_pessoas == NULL || arq_carros == NULL) {
    printf("Não foi possível acessar os dados, ou não existem!\n");
    return;
  }

  printf("LISTAGEM DE CADASTROS\n\n");

  // faca a listagem.
  do {
    fread(&pessoa, sizeof(Pessoa), 1, arq_pessoas);

    // se chegar no final do arquivo, quebre a execução.
    if (feof(arq_pessoas)) break;

    printf("Nome: %s\n", pessoa.nome);
    printf("RG: %s\n", pessoa.rg);
    printf("CPF: %s\n", pessoa.cpf);
    printf("Endereco: %s\n", pessoa.endereco);
    printf("Idade: %d\n\n", pessoa.idade);

    // liste todos os automoveis do proprietario.
    printf("Automoveis:\n");
    do {
      fread(&automovel, sizeof(Automovel), 1, arq_carros);
      if (feof(arq_carros)) break;
      if (strcmp(automovel.cpf_proprietario, pessoa.cpf) == 0) {
        printf("Marca: %s Modelo: %s Placa: %s\n",
               automovel.marca, automovel.modelo, automovel.placa);
      }
    } while (!feof(arq_carros));

    fseek(arq_carros, 0, SEEK_SET);

    printf("\n-------------------\n\n");

  } while(!feof(arq_pessoas));

  do {
    printf("(Enter) para sair ");
  } while(getchar() != '\n');

  limparTela();
}

void salvarAutomovel(Automovel* carroNovo) {
  // salva a struct de um automovel.
  FILE* arquivo;
  arquivo = fopen("dados_automoveis.bin", "ab");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao foi possivel abrir o arquivo para salvar!\n");
    return;
  }

  // salva o automovel.
  fwrite(carroNovo, sizeof(Automovel), 1, arquivo);

  fclose(arquivo);

  printf("Automovel cadastrado com sucesso!\n\n");
}

void cadastrarAutomoveis(Pessoa* proprietario) {
  // coleta os dados de entrada e cadastra um novo automovel.
  Automovel carroNovo;

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

    strcpy(carroNovo.cpf_proprietario, proprietario->cpf);

    printf("\n");

    // salve o automovel no arquivo de veiculos.
    salvarAutomovel(&carroNovo);
  }
}

void salvarPessoa(Pessoa* pessoaNova) {
  // salva a struct de uma pessoa.
  FILE* arquivo;
  arquivo = fopen("dados_pessoas.bin", "ab");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao foi possivel abrir o arquivo para salvar!\n");
    return;
  }

  // salva a pessoa.
  fwrite(pessoaNova, sizeof(Pessoa), 1, arquivo);

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