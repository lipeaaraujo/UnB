#anotacao 

**Meios físicos para armazenamento:**
![[Pasted image 20250327140741.png]]
- Custo ($)
- Velocidade
- Armazenamento
Os dispositivos primários perdem os dados com a falta de energia (volátil). São usados para minimizar acesso a disco.

**Linguagens de BD:**
- [[SQL]] (Structured Query Language) em BD relacionais.
- Dois tipos principais:
	- **DDL (linguagem de definição de dados)**, resulta na criação no arquivo de [[Dicionário de Dados]] (metadados)
	- **DML (linguagem de manipulação de dados)**, viabiliza o acesso e manipulação dos dados armazenados no BD.

**Processador de Consultas:**
![[Pasted image 20250327141814.png]]
- Otimiza consultas submetidas ao SGBD e executa uma melhor
- Mantêm estatísticas para estimar o custo das operações
- Custo estimado considerando o acesso a disco.

**Conceito de [[Transação]]:**
- Unidade de execução de programa que acessa e manipula dados no BD. Consiste em todas as operações a serem executadas a partir do começo até o final.

**[[Modelo Entidade-Relacionamento]]:**
- Baseado na visão abstrata do mundo real
- Objetos básicos como: Entidade e Relacionamentos
- Visão lógica de alto nível

**[[Diagrama Entidade-Relacionamento]]:**
- Representação gráfica da estrutura lógica de um banco de dados.
- Composto por: retângulos (entidades), losangos (relacionamentos), elipses (atributos), linhas (ligações)

**[[Chaves]]:**
- Um ou mais atributos que permitem identificar unicamente uma tupla dentro de um conjunto
- **Candidata:** atributo ou conjunto de atributos que _pode_ identificar unicamente uma instância da entidade
- **Primária:** chave candidata definida para BD para identificar as instâncias em uma entidade.
- As chaves mapeiam as cardinalidades dos relacionamentos entre entidades.

**[[Cardinalidade]]**:
- Define o grau máximo de participação de cada entidade em um relacionamento.
![[Pasted image 20250327145719.png]]

**Etapas Modelo Entidade-Relacionamento:**
- Identificar entidades
- Descrever entidades
- Descrever relacionamentos

[[Formas Normais]]

**[[Especialização e Generalização]]:**
- Generalização é usada para enfatizar as semelhanças entre tipos de entidade de nível superior e ocultar suas diferenças
- Especialização consiste na identificação de subgrupos de entidades que são de alguma forma, diferentes de outras entidades do conjunto.

**[[Autorrelacionamento]]:**
- Caso particular que de relacionamento de uma entidade com ela mesma, respeitando as regras de cardinalidade ![[Pasted image 20250327153045.png]]

**Agregação:**
- Agregação ou entidade associativa é uma abstração por meio que os relacionamentos são tratados como entidades de nível superior.
![[Pasted image 20250327153444.png]]

