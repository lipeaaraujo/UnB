#anotacao 

**Definições:**
- **[[Banco de Dados]]:**  
- **Abstração:** observar apenas os aspectos de interesse de dados diversos e representá-los. 
- **Dado:** denota um fato que pode ser registrado e armazenado que sozinho tem significado implícito;
- **Informação:** organização em relação a um conteúdo ou uma novidade.

**Propriedades de BD:**
- Um BD é uma coleção logicamente coerente de dados.
- Um BD é projetado para um propósito específico
- Um BD possui um grupo de usuários e aplicações a quais esses usuários estão interessados.
- Um BD representa um aspecto do mundo real e uma alteração nesse aspecto deve refletir no BD.

**Um banco de dados tem:**
- **Fonte** de dados
- **Taxa de interação** com eventos do mundo real
- **Interessados** no conteúdo
- **Quantidade de dados**
- Variação de **complexidade**
- Criação e manutenção **manualmente** ou por **equipamento(s)**

**Arquitetura de um BD:**
![[Pasted image 20250325150315.png]]

- Nível externo: descreve o BD por meio de estruturas mais simples e amigáveis ao usuário, mantendo apenas a complexidade do tamanho do BD.
- Nível conceitual: descreve os dados que serão armazenados e as relações entre eles.
- Nível físico: descreve como os dados são realmente armazenados fisicamente.

**SGBD x Arquivos:**
- SGBD: um único repositório compartilhado, acesso de todos os usuários sobre o mesmo BD com um único espaço de armazenamento, atualização em só uma estrutura de BD e com controle de acesso
- Arquivos: implementação para uma aplicação específica que contém redundância, gerando geralmente desperdício de espaço e esforço adicional para atualização. Os arquivos geralmente são de fácil acesso.

**[[Sistema Gerenciador de Banco de Dados]]:**
- É uma coleção de programas para criação e manutenção de Banco de Dados.
- Software de propósito geral que facilita a **Definição**, **Construção** e **Manipulação** de uma Base de Dados.

**Perfis envolvidos em BD:**
- Administrador de Banco de Dados (DBA).
- Projetista do Banco de Dados (ou designer).
- Analista de Sistemas.
- Programador de Aplicações.
- Usuário Final.

**Características do SGBD:**
- Controle de redundância.
- Compartilhamento de dados.
- Restrição de acesso
- Fornecimento de múltiplas interfaces.
- Restrições de integridade:
	- Regras associadas aos dados respeitando a coerência na representação do mundo real.
- Sistema de backup e recovery

**Vantagens do SGBD:**
- Desenvolvimento de padrões.
- Flexibilidade.
- Tempo de desenvolvimento reduzido.
- Disponibilidade de informações atualizadas.

**Quando não usar SGBD:**
- Custo adicional ou desnecessário.
- Alto investimento inicial com software e hardware.
- Aplicações em real time com overhead de segurança, controle de concorrência, recuperação e funções de integridade.
- BD simples com aplicações bem definidas.
- Quando múltiplos acessos não são necessários.

![[Pasted image 20250325153002.png]]

**Terminologias:**
- **Campo (atributos):** unidade básica de informação mínimo com significado.
- Registro (tuplas): conjunto de campos.
- Arquivos (tabela ou relação): conjunto de registros.
- Banco de Dados (BD): conjunto de arquivos e suas formas de manipulação.

**Atribuições do SGBD:**
- SGBD também armazena os **metadados** que são informações (definições e descrições) sobre a estrutura que forma a Base de Dados.
- Metadados contém definições da estrutura que armazena os dados (arquivos), tipo, formato e as restrições que sejam inerentes a estes dados.

**Modelo de Dados:**
- Conjunto de conceitos utilizados para descrever a estrutura de uma base de dados.
- Principal ferramenta para fornecer dados sobre a abstração realizada para o mundo real.
- Pode ser: Conceitual, Implementação ou Físico

**Diagrama de Esquemas:**
- Representação simplificada para ajudar na identificação de um esquema e suas inter-relações, baseado na forma de representação do gráfico de *Gantt*.

![[Pasted image 20250325154853.png]]

**Arquitetura Interna de BD:**
- O SGBD pode ser dividido em módulos, conforme suas responsabilidades.

![[Pasted image 20250325155020.png]]