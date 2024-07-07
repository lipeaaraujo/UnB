# Gerência de Memória

A memória RAM é um recurso extremamente importante para o funcionamento de qualquer sistema, que não está disponível infinitamente e não existe memória não-volátil rápida.

É necessário que o Sistema Operacional saiba gerenciar essa memória e sejam projetados para lidar com essas características

## Hierarquia de Memória

| Tipos | Custo | Velocidade |
|-|-|-|
| Registradores | mais custo | mais rápido |
| Cache | - | - |
| Memória Principal | - | - |
| Memória Secundária | menos custo | menos rápido |

- Os **registradores** são manipulados pelos programas e pelo hardware

- A **memória cache** é manipulada diretamente pelo hardware

- O foco da gerência de memória é na **memória principal** ou **ram**

- A gerência da **memória secundária** é feita pela gerência de arquivo

## Funções básicas

Os programas ficam guardados na memória secundária e precisam ser **carregados** para a memória principal

A gerência de memória precisa ser capaz de **carregar** esses programas, **manter** os processos **já em execução executando** e **carregar** o máximo de processos possíveis mesmo não havendo espaço. 

Isso feito a partir do **compartilhamento dos recursos** da memória, **proteção** dos recursos sendo usados por processos e **liberação** da memória de processos não necessários

Cada gerência de memória terá seu esquema especifico e é função desse sistema **implementar seu esquema de forma eficiente**

## Esquemas de gerenciamento de memória

### Sem abstração de memória

#### Alocação Contígua Simples

Um esquema de alocação contígua simples, é um tipo de alocação **"direta"** da memória.

```assembly
LOAD R1, 1000
```
A instrução lê diretamente a posição 1000 na memória e guarda no registrador R1

- Não permite a execução de dois programas ao mesmo tempo

- Se o programa não usar toda a memória existe disperdício

- Mais simples de implementar e permite a organização da estrutura de memória e do SO

| | Espaço protegido | Espaço de leitura | Drivers em espaço de leitura
|-|-|-|-|
|0xFF...| Espaço do usuário | Sistema Operacional (ROM) | Drivers em ROM (BIOS)
|0x...| | | Espaço do Usuário
|0x0| Sistema Operacional | Espaço do Usuário | Sistema Operacional |

#### Alocação Particionada

- O Sistema Operacional é mantido em um espaço protegido pelo hardware
- O espaço de usuário é divido em várias seções chamadas partições de um certo tamanho estático

| | Particionamento |
|-|-|
|0xFF...| ... | 
|0x...| Partição 4 |
|0x...| Partição 3 |
|0x...| Partição 2 |
|0x...| Partição 1 |
|0x0| Sistema Operacional |

**Alocação particionada estática absoluta**

- Nesse modo os programas modificam partes absolutas da memória, portanto 2 programas que foram compilados para a mesma participação não podem executar em partições diferentes
- A execução paralela só pode acontecer com programas que acessam partes da memória de diferentes partições

**Alocação particionada estática realocável**

- Nesse tipo de alocação, é criada uma constante dependendo da partição que o processo será executado
- Essa constante modifica os acessos da memória para acontecerem somente na partição em que o processo está sendo executado
- Isso permitiu o tratamento da memória como algo relativo no processo
- Não resolve o problema de proteção contra outros processos ativos e é lento

### Com abstração de memória

#### Espaço de endereçamento

- Cada processo é alocado com um espaço específico de endereços na memória
- Não pode extrapolar esse espaço
- Exceção para casos de memória compartilhada

#### Registrador base-limite

- São mantidos dois registradores (base e limite) no hardware
- Quando um programa é alocado, o registrador base guarda o endereço de início e o limite guarda o final
- Toda manipulação da memória no programa é somada com o valor de base e verifica se está dentro dos limites
- Desvantagem por precisar fazer comparações e soma em toda instrução

#### Alocação Parciticionada Dinâmica

- Com o espaço de endereçamento e registrador base-limite é possível alocar dinamicamente
- As partições podem ter tamanho variado
- Resolve a **fragmentação interna** (blocos partição não utilizados)
- Não resolve a **fragmentação externa**

**Soluções:**

1. Agrupar espaços de memória adjacentes
    - dois espaços de memórias livres colados um no outro são agrupados em um só espaço
2. Compactação de memória
    - processos congelam para serem realocados em endereços contínuos
    - processo lento e que congela todos os processos

## Algoritmos de controle de memória

Os algoritmos de controle de memória encontram um espaço de memória disponível para um processo, com isso criando no espaço livre uma região dedicada ao processo e outra região de memória livre

### Best fit

Procura o menor espaço possível na memória para alocar um processo, principal problema é a performance e as vezes cria espaços minusculos inuteis de memória livre

### Worst fit

Procura o maior espaço possível na memória para alocar um processo, sofre com performance

### First fit

Procura o primeiro espaço capaz de alocar um processo na memória, na média é o mais rápido entre os algoritmos

O algoritmo mais frequentemente usado em sistemas é o **first fit**

## Swapping e Overlay

### Gerência de Memória Livre

É necessária para processos que requerem a alocação dinâmica de memória livre

#### Mapa de Bits

- A memória é dividida em um mapa de unidades de memória (bits), de tamanho representado em bytes
- Com uma unidade de memória pequena, o mapa fica muito grande
- Com unidade de memória grande, pode acontecer desperdício de memória

#### Lista Encandeada

- A memória segue uma estrutura de lista encadeada
- Cada membro tem o **tipo de segmento (livre ou ocupado), endereço de início, tamanho**
- No final de cada segmento de memória tem um endereço para o próximo segmento
- Pode ser implementado com listas duplamente encadeadas para obter os vizinhos antes e depois

### Swapping

Técnica que permite o gerenciador de memória jogar processos para a memória secundária e puxar processos da memória secundária para a principal

- (Swap-in) quando um processo é carregado da memória secundária
- (Swap-out) quando o processo fica inativo e é carregado para a memória secundária

### Overlay

- Divisão de um programa em módulos
- Útil quando os módulos não precisam ser carregados simultaneamente
- Permite que esses módulos independentes não precisem estar na memória