# Sistema de Arquivos

## Arquivos

- Conjunto de dados relacionados agrupados
- Cada arquivo possui um nome que o identifica e um tipo
- "nome_do_arquivo"."tipo"

### Organização de arquivos

Os dados dentro de um arquivo dependendo de seu tipo são organizados de maneiras diferentes

- **Sequência de bytes:** estrutura simples em que os dados são organizados em uma sequência de bytes. A forma de interpretar o arquivo depende da aplicação
- **Registros:** os dados são guardados em registros de tamanho fixo
- **Árvore de registros:** os dados são organizados em registros de tamanho variado em que cada um possui um campo de chave que ordena a árvore

### Tipo de arquivos

- **Regulares:** arquivos que guardam informações de usuário em texto ASCII ou binários
- **Diretórios:** arquivos que servem para manter a estrutura do sistema de arquivos
- **Caracteres:** usados para modelar dispositivos E/S seriais
- **Blocos:** usados para modelar discos

### Métodos de Acesso

- Sequencial: na ordem que os registros foram gravados
- Direto: baseado no número do registro (posição no arquivo)
- Aleatório: acesso aleatório no arquivo

### Atributos

São informações de controle presentes em cada arquivo

- Proteção: quem tem acesso e qual modo (leitura, escrita, execução)
- Criador: quem criou o arquivo
- Proprietário: o atual dono do arquivo
- Flag de acesso aleatório: flag que determina a permissão de acesso aleatório ou não
- Tamanho: tamanho em bytes do arquivo

## Diretórios

Diretórios são estruturas que permitem organizar logicamente os arquivos de um sistema

- Guardam nome, localização física, organização e demais atributos

**Sistemas de diretório em nível único:** existe um único diretório raiz que contém todos os outros arquivos do sistema

**Sistemas de diretório hierárquicos:** a partir de um diretório raiz, podem existir diretórios dentro de diretórios formando uma estrutura de árvore hierárquica

**Linux - Filesystem Hierarchy Standard (FHS)**

### Nomes de Caminhos

- Absoluto: endereço completo a partir do diretório raiz (/home/felipe/arquivo.txt)
- Relativo: endereço relativo do diretório atual (./arquivo.txt)

## Gerência

### Gerência de Espaço Livre em Disco

- Mapa de bits: o disco é dividido em blocos de um certo tamanho e um bit 0 ou 1 determina se o espaço está livre ou não

- Lista Encadeada: os blocos de memória livre ficam em uma estrutura de lista encadeada de todos os blocos livres

- Tabela de blocos livres: implementada com alocação contígua, blocos de espaço contínuo juntam em segmentos de blocos livres onde numa tabela ficam os endereços dos primeiros blocos de cada segmento e o número de blocos livres que o seguem

### Gerência de Alocação de Espaço

- **Alocação contígua:** os arquivos são guardados em espaços contínuos no disco, gera problemas de fragmentação externa. Para resolver tem a lenta **desfragmentação**

- **Alocação encadeada:** alocação com uma estrutura de lista encadeada, dificulta o seek pois o acesso do arquivo deve ser sequencial

- **Alocação indexada:** estratégia encadeada em que o primeiro bloco guarda as informações dos blocos usados pelos arquivos permitindo o acesso direto

## Proteção de Acesso

É essencial o Sistema Operacional gerenciar o controle de acesso diretamente nos arquivos do disco dos usuários que irão usar. Um bit da CPU consegue dizer se um processo é de usuário ou do sistema operacional.

- Proteção por atributos: depende dos atributos de permissão do arquivo em relação ao usuário
- Proteção por senha: proteção a partir de uma senha criptografada

### Operações com Arquivos

Quaisquer modificações feitas nos arquivos do disco são feitas a partir de chamadas de sistema

- Create: criar um arquivo vazio, estabele os atributos
- Delete: remover um arquivo não necessário do sistema de arquivos
- Open: abrir um arquivo, verificando as permissões e atributos
- Close: fechar um arquivo
- Read: ler os dados do arquivo, especificando a quantidade de dados a serem lidos da posição atual
- Write: escrever dados no arquivo, incrementando o tamanho do arquivo
- Append: adicionar dados no final do arquivo
- Seek: alterar a posição atual do arquivo para uma determinada
- Get attributes: retorna os atributos conhecidos do arquivo
- Set attributes: editar os atributos de um arquivo
- Rename: renomear um arquivo do disco

## Implementação de Caches

É interessante que partes do arquivos em disco fiquem salvos prontos na memória principal para acesso mais rápido (cache)

Uma parte da memória principal é dedicada para esse cacheamento

Processo chamado de **buffering**