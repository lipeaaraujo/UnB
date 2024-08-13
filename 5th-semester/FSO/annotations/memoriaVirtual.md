# Memória Virtual

É um esquema de endereçamento onde a memória principal e secundária são unificadas criando um espaço de endereçamento virtualmente "infinito" para os processos

- O endereçamento não é mais físico mas sim com endereços virtuais
- Implementado diretamente no hardware

## Endereçamento Virtual e Mapeamento

### Endereçamento Virtual

- Os processos fazem referência a endereços de memória do espaço virtual
- O Sistema Operacional é responsável por traduzir esses endereços para endereços reais

### Mapeamento

- Mecanismo para mapear os endereços virtuais para endereços reais
- MMU: Unidade de Mapeamento de Memória

#### Tabela de Mapeamento

- Não é possível guardar todos os endereços diretamente
- É mantida uma tabela de páginas para cada processo
- Cada página tem um tamanho fixo
- Um registrador na CPU faz referência a entrada da tabela de um processo

| Espaço de Endereçamento Virtual | Tamanho do bloco | Número de entradas na tabela de mapeamento |
|-|-|-|
| 2^32 endereços | 512 endereços | 2^23 |
| 2^32 endereços | 4K endereços | 2^20 |
| 2^64 | 4K endereços | 2^52 |
| 2^64 | 64K endereços | 2^48 |

- A tabela de paǵinas é mantida na memória principal
- A MMU mantém uma cache que carrega e guarda algumas entradas de paǵinas

## Memória Virtual por Paginação

**paginação:** divide a memória física e virtual em páginas de tamanho **fixo**

**segmentação:** divide a memória física e virtual em unidades de tamanho **variado**

- As páginas no espaço virtual são chamadas páginas virtuais
- As páginas no espaço real são chamadas de frames
- A MMU recebe o endereço em formato (p, d)
- O endereço virtual (p, d) é traduzido em um enereço real (f, d)

- **(page fault):** quando a memória virtual referenciada não está na memória principal
- **(page-in):** carregamento da memória secundária para a principal, durante isso o processo é bloqueado
- **(page-out):** descarregamento da memória principal para a secundária

#### Busca de Páginas

**demand paging:** as páginas só são carregadas quando referenciadas

**pre-paging:** quando uma página é carregada, as suas páginas vizinhas também são

### Alocação

**Alocação fixa:**
- cada processo tem um número fixo de frames que pode ter alocado
- se o número de páginas for pequeno acontecem muitos page faults
- se o número de páginas for grande, os processos ocupam muito espaço na memória

**Alocação variável:**
- cada processo pode possuir um número variável de páginas
- depende da usagem de cada processo
- se um processo tem muitos page faults ele pode aumentar seu limite de frames
- um processo que está utilizando pouca memória pode liberar suas páginas

### Substituição

Processo em que ocorre o page-out de uma página na memória principal para o page-in de uma página que está na memória secundária

- local: apenas as páginas do processo que teve o page fault podem ser candidatas a serem realocadas
- global: todas as páginas na memória principal, excluindo as bloqueadas são candidatas a realocação

#### Working Set

- localidade espacial: quando uma página é referenciada é mais provável que páginas próximas sejam referenciadas também
- localidade temporal: quando acontece uma referência, é provável que a mesma página seja referenciada em um curto espaço de tempo

O modelo de working set divide o programa em fases, usando esses conceitos de localidade espacial e temporal, auxiliando a descobrir as páginas necessárias para a execução

#### Algoritmos de Substituição de Páginas

- **Ótimo:** seleciona uma página que não vai mais ser referenciada no futuro. Impossível de implementar
- **Aleatório:** seleciona aleatoriamente, não muito eficiente
- **FIFO:** seleciona a página que está mais tempo na memória, pode retirar páginas que foram criadas recentemente
- **Least-Frequently-Used:** seleciona a página menos utilizada, tem que manter um contador de acessos a memória
- **Least-Recently-Used:** seleciona a página a mais tempo sem ser utilizada, alto custo de implementação
- **Not-Recently-Used:** utiliza um bit de referência que periodicamente vira 0 e muda pra 1 quando a página é acessada, pega uma página em que este bit está em 0
- **FIFO Circular:** semelhante ao FIFO porém usa uma fila circular com bit de referência que é 0 quando a página pode ser removida ou 1 quando a página foi usada recentemente. Toda vez que o algoritmo passa por uma página com bit 1 ela coloca em 0 e move para o próximo

### Tamanho das Páginas

- Tamanho das páginas é variável e pode ser modificável
- Páginas muito pequenas podem causar problemas de performance e a tabela de páginas ficar muito grande
- Páginas muito grandes causam fragmentação interna

#### Paginação em níveis

Para diminuir o problema do tamanho da tabela de páginas, a paginação pode ser feita em níveis

- É mantida em memória uma quantidade bem menor de tabelas

### Proteção da Memória

- A MMU realiza a tradução de endereços virtuais dentro da tabela de mapeamento de cada processo, não deixando eles acessarem memória fora de sua tabela
- São utilizados os bits (L, G) para fazer proteção de leitura e gravação

| (L,G) | Modo |
|-|-|
| (0,0) | Sem acesso |
| (0,1) | Acesso leitura |
| (1,1) | Acesso leitura e gravação |

## Memória Virtual por Segmentação

- Memória dividida em unidades variáveis (segmentos)
- Cada programa é dividido em sub-rotinas e estruturas de dados que guardam suas informações
- Guarda-se ao invés de páginas, o segmento, deslocamento e fim do segmento, além do tamanho do segmento
- Não é necessário substituição, apenas alterar o tamanho do segmento
- Não é útil quando o programa não está modularizado

## Memória Virtual com Paginação e Segmentação

- Combinação da paginação com a segmentação
- Os endereços dos segmentos são divididos entre páginas
- **Endereço: numéro de segmento + número de página**

