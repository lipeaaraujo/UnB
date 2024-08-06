# Construção de Compiladores

## Analisador Léxico

Envolve a geração de tokens específicos a partir de um vocabulário terminal. 

## Analisador sintático

Pega os tokens gerados pelo analisador léxico e verifica se os mesmos fazem parte da sintaxe da linguagem.

Usaremos uma análise ascendente para fazer redução saindo dos símbolos terminais para os não terminais. (Parser Bottom Up)

- SLR(0)
- SLR(1)
- LALR(1)
- LR(1)

O bison usa o LALR(1)

### Componentes
- **Entrada**
- **Parser**
- **Floresta**
- **Tabela ação**
- **Tabela desvios**

### Tabela de Desvios

É um grafo desenhado numa tabela, as linhas são vértices e as colunas são variáveis e terminais da gramática. É basicamente representada por um autômato com pilha.

### Tabela de Ações

Indica o que deve ser feito em um vértice do grafo em função de um token da entrada.

- e (empilha)
- R (reduz)
- A (aceita)
- (erro)

### Tabela de Ação e Desvio

Equivale a fusão das tabelas de ação e desvio.