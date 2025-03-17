**Definição:** Estilo arquitetural que fornece uma estrutura para sistemas que processam **fluxo de dados**, ou seja, considera uma rede pela qual flui dados de uma extremidade (origem) à outra (fim).

![[Pasted image 20250124082009.png]] 
- O fluxo de dados ocorre pelos **dutos**.
- Os dados sofrem transformações quando processados nos **filtros**.
- Os **filtros** podem ter diferentes granularidades (maior ou menor).

É uma arquitetura geralmente utilizada para dividir uma grande tarefa de processamento em uma sequência de pequenos e independentes passos de processamento (Filters), os quais são conectados pelos canais (Pipes).

| Elemento              | **Filtro**                                                                     | **Duto**                                                                          | **Outros**                             |
| --------------------- | ------------------------------------------------------------------------------ | --------------------------------------------------------------------------------- | -------------------------------------- |
| **Responsabilidades** | - receber o dado da entrada<br>- processar o dado<br>- colocar o dado na saída | - transferir o dado<br>- realizar "buffer"<br>- sincronizar os filtros "vizinhos" | - fonte de dados<br>- coletor de dados |
Uma sequência de filtros e dutos é geralmente chamada de **tubulação de processamento**.

**Ex:** Compilador

![[Pasted image 20250124091935.png]]
- Um padrão de projeto interessante para esse contexto do pipes and filters é o [[Decorator]]. É importante observar a aplicabilidade dos padrões nesse contexto.