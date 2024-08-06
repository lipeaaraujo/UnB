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
typedef struct Automovel{
  int chave_primaria;
  char marca[TAMANHO_TEXTO];
  char modelo[TAMANHO_TEXTO];
  char placa[TAMANHO_PLACA];
  char cpf_proprietario[TAMANHO_CPF];
} Automovel;

typedef struct Pessoa{
  int chave_primaria;
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

int gerarChavePrimaria() {
  // gera um valor de chave primaria para um registro.
  // utiliza um arquivo externo para manter a chave primaria atualizada e unica.
  FILE *arquivo;
  int chave;

  arquivo = fopen("contador_chave.bin", "rb");

  if (arquivo == NULL) {
    // cria um arquivo novo para manter o contador.
    arquivo = fopen("contador_chave.bin", "wb");
    chave = 1;
    fwrite(&chave, sizeof(int), 1, arquivo);
  } else {
    // lê o contador e gera a chave primária.
    fread(&chave, sizeof(int), 1, arquivo);
    chave++;
    fclose(arquivo);
    arquivo = fopen("contador_chave.bin", "wb");
    fwrite(&chave, sizeof(int), 1, arquivo);
  }

  fclose(arquivo);

  return chave;
}

/* realiza uma comparacao entre as chaves primarias de duas pessoas,
   utilizada como argumento do quick sort. */
int compararPessoas(const void *a, const void *b) {
  const Pessoa *pessoa1 = (const Pessoa *)a;
  const Pessoa *pessoa2 = (const Pessoa *)b;
  return pessoa1->chave_primaria - pessoa2->chave_primaria;
}

/* realiza uma comparacao entre as chaves primarias de dois automoveis,
   utilizada como argumento do quick sort. */
int compararAutomoveis(const void *a, const void *b) {
  const Automovel *automovel1 = (const Automovel *)a;
  const Automovel *automovel2 = (const Automovel *)b;
  return automovel1->chave_primaria - automovel2->chave_primaria;
}

int contarRegistros(const char* nome_arq, int tam_registro) {
  FILE *arquivo;
  void *registro_aux;
  int num_registros;

  arquivo = fopen(nome_arq, "rb");
  if (arquivo == NULL) {
    printf("Falha ao contar os registros do arquivo %s\n", nome_arq);
    return 0;
  }

  fseek(arquivo, 0, SEEK_END);
  long tamanho_arquivo = ftell(arquivo);
  num_registros = tamanho_arquivo / tam_registro;

  return num_registros;
}

/* ordena os registros no arquivo de pessoas pela chave de ordenacao. */
void ordenarArquivoPessoas(const char* nome_arq) {
  FILE *arquivo;
  Pessoa *pessoas;
  int num_pessoas = 0;

  // aloca memoria suficiente para as pessoas cadastradas.
  num_pessoas = contarRegistros(nome_arq, sizeof(Pessoa));
  pessoas = (Pessoa *)malloc(sizeof(Pessoa) * num_pessoas);

  // le os dados para o vetor de pessoas.
  arquivo = fopen(nome_arq, "rb");
  if (arquivo == NULL) {
    printf("Não foi possível ler o arquivo de pessoas!\n");
    return;
  }
  fseek(arquivo, 0, SEEK_SET);
  fread(pessoas, sizeof(Pessoa), num_pessoas, arquivo);
  fclose(arquivo);

  // ordena o vetor e salva no arquivo novamente.
  qsort(pessoas, num_pessoas, sizeof(Pessoa), compararPessoas);
  arquivo = fopen(nome_arq, "wb");
  if (arquivo == NULL) {
    printf("Nao foi possivel ordenar o arquivo de pessoas!\n");
    return;
  }
  fwrite(pessoas, sizeof(Pessoa), num_pessoas, arquivo);
  fclose(arquivo);
  free(pessoas);
}

/* ordena os registros no arquivo de automoveis pela chave de ordenacao. */
void ordenarArquivoAutomoveis(const char* nome_arq) {
  FILE *arquivo;
  Automovel *automoveis;
  int num_automoveis;

  // aloca memoria suficiente para os automoveis cadastrados.
  num_automoveis = contarRegistros(nome_arq, sizeof(Automovel));
  automoveis = (Automovel *)malloc(sizeof(Automovel) * num_automoveis);

  // le os dados para o vetor de automoveis.
  arquivo = fopen(nome_arq, "rb");
  if (arquivo == NULL) {
    printf("Não foi possível ler o arquivo de automoveis!\n");
    return;
  }
  fseek(arquivo, 0, SEEK_SET);
  fread(automoveis, sizeof(Automovel), num_automoveis, arquivo);
  fclose(arquivo);

  // ordena o vetor e salva no arquivo novamente.
  qsort(automoveis, num_automoveis, sizeof(Automovel), compararAutomoveis);
  arquivo = fopen(nome_arq, "wb");
  if (arquivo == NULL) {
    printf("Nao foi possivel ordenar o arquivo de automoveis.\n");
    return;
  }
  fwrite(automoveis, sizeof(Automovel), num_automoveis, arquivo);
  fclose(arquivo);
  free(automoveis);
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

    printf("Chave primária: %d\n", pessoa.chave_primaria);
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
        printf("Chave primária: %d\n", automovel.chave_primaria);
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

void salvarAutomovel(Automovel* carroNovo, const char *nome_arq) {
  // salva a struct de um automovel.
  FILE* arquivo;
  arquivo = fopen("dados_automoveis.bin", "ab+");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao foi possivel abrir o arquivo para salvar!\n");
    return;
  }

  // salva o automovel.
  fwrite(carroNovo, sizeof(Automovel), 1, arquivo);
  fclose(arquivo);

  // ordena o arquivo de automoveis.
  ordenarArquivoAutomoveis(nome_arq);
  printf("Automovel cadastrado com sucesso!\n\n");
}

void cadastrarAutomoveis(Pessoa* proprietario) {
  // coleta os dados de entrada e cadastra um novo automovel.
  Automovel carroNovo;

  printf("CADASTRO DE AUTOMOVEIS\n\n");

  // pegue os dados dos automoveis.
  for (int i = 0; i < proprietario->qntdAutomoveis; i++) {
    carroNovo.chave_primaria = gerarChavePrimaria();
    
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
    salvarAutomovel(&carroNovo, "dados_automoveis.bin");
  }
}

void salvarPessoa(Pessoa* pessoaNova, const char *nome_arq) {
  // abre o arquivo.
  FILE* arquivo;
  arquivo = fopen(nome_arq, "ab+");

  if (arquivo == NULL) {
    limparTela();
    printf("Nao foi possivel abrir o arquivo para salvar!\n");
    return;
  }

  // salva a pessoa no arquivo de dados de pessoas.
  fwrite(pessoaNova, sizeof(Pessoa), 1, arquivo);
  fclose(arquivo);

  // ordena o arquivo de dados.
  ordenarArquivoPessoas(nome_arq);
}

void cadastrarPessoa() {
  Pessoa pessoaNova;

  printf("CADASTRO DE PESSOA\n\n");

  // preenche os campos da pessoa com o input do usuario.
  pessoaNova.chave_primaria = gerarChavePrimaria();

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

  // salva a pessoa no arquivo de dados.
  salvarPessoa(&pessoaNova, "dados_pessoas.bin");

  // cadastra os automoveis da pessoa.
  cadastrarAutomoveis(&pessoaNova);

  limparTela();
  printf("Pessoa cadastrada com sucesso!\n");
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