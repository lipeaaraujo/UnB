**Definição:** É um estilo arquitetural onde todos as comunicações são regidas por [eventos](Evento.md) gerados externamente.

**Modelos de controle:**
- **Broadcast:** evento transmitido a todos os subsistemas. Qualquer subsistema programado para manipular esse evento pode responder a ele.
- **Orientado a interrupções:** usado em sistemas de tempo real onde as interrupções externas são detectadas por um tratador de interrupções. A partir daí, são passadas para algum outro componente de processamento.

Os subsistemas registram interesse em eventos específicos. Quando esses eventos ocorrem, o controle é transferido para o subsistema que pode tratar o evento.
Todos os eventos podem ser transmitidos a todos os subsistemas, mas isso pode gerar um grande **overhead**.

**Obs:** O padrão [[Observer]] é construído em cima dessa arquitetura. Na verdade, o padrão popularizou o uso da arquitetura.

![[Pasted image 20250127082344.png]]


### Exemplo: Interface Java

A interface gráfica em Java é dita orientada a eventos. Cada vez que um usuário clica em um botão, seleciona um item em uma lista, ou pressiona uma tecla, o sistema gera um evento.
- Se uma aplicação está interessada em um evento específico, deve solicitar o sistema a **"escutar"** o evento.


## Vantagens e Desvantagens
### Vantagens

- Evolução é relativamente simples.
- Um novo subsistema para tratar classes específicas de eventos pode ser integrado por meio do registro de seus eventos no tratador de eventos.
- Qualquer subsistema pode ativar qualquer outro subsistema sem saber seu nome ou sua localização.
- Os subsistemas podem ser implementados em máquinas distribuídas.

### Desvantagens

- Subsistemas não sabem se ou quando os eventos serão manipulados.
- É possível que subsistemas diferentes se registrem para os mesmos eventos podendo causar conflitos quando os resultados de manipulação de eventos forem disponibilizados.