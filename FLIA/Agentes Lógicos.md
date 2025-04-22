### Bases de conhecimento
- **Base de conhecimento:** Conjunto de **sentences** em uma linguagem formal.
- **Para construção de um agente**: Dizer o que ele precisa saber
- A partir daí pode-se perguntar o que ser feito - respostas com base na base de conhecimento
- **No nível de implementação**: estruturas de dados que modelam a base de conhecimento e algoritmos para os agentes

**Um agente deve ser capaz de:**
- Representar estados, ações, etc;
- Incorporar novas percepções;
- Atualizar representações internas do mundo;
- Deduzir propriedades escondidas do mundo;
- Deduzir ações apropriadas.

[[Mundo de Wumpus]]

### [[Lógica]]
- **Lógica:** Uma linguagem formal para representação de informação, de forma que conclusões podem ser obtidas.
- **Sintaxe:** Define as sentenças da linguagem
- **Semântica:** Define o significado das sentenças

### [[Implicação]]
- Implicação: Significa que uma coisa resulta em outra.
- Implicação é uma relação entre sentenças baseada em semântica

### [[Modelos]]
- **Modelo:** um mundo estruturado em respeito as verdades que podem ser avaliadas.

### [[Inferência]]
- Significa que um uma sentença pode ser derivada da base de conhecimento por meio de um procedimento $i$.

### [[Lógica proposicional]]
- Semântica: cada modelo especifica verdadeiro ou falso para cada símbolo de preposição.

### [[Equivalência lógica]]

### [[Validade e satisfatibilidade]]
- Uma sentença só é valida se ela for verdadeira em todos os modelos
- Validade está conectada com a inferência pelo Teorema da Dedução
- A sentença é satisfazivel se é verdadeira em algum modelo
- A sentença é insatisfazivel se ela não verdadeira em nenhum modelo

### [[Mecanismos de prova]]
- Aplicação de regras de inferência
- Model checking

**SAT Solvers:**

> Clasp
> Minisat
> Glucose

```cnf
p cnf 1 1
1 -1 0
```

```bash
clasp teste.cnf
```

