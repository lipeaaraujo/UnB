## Trabalho final

Não será preciso a compilação de procedimentos e funções e variáveis float. Será preciso a compilação de declaração de variáveis, loops, condicionais e variáveis inteiras, ou seja, somente variáveis de escopo global.

Nas regras no livro, tudo o que estiver com * não precisa ser implementado.

- Analisador léxico deverá retornar a quantidade dos tipos de tokens na avaliação
- Analisador sintático
- Gerador de código: converter um Pascal para MEPA na mão, segunda parte será receber um código Pascal e converter para MEPA com o gerador.

read e write são palavras especiais da própria linguagem.

## Sintático

Implementaremos um analisador sintático descendente recursivo, com lookahead = 1.

Toda vez que encontrarmos um token que equivale a uma regra da gramática, moveremos para a próxima função que equivale a essa regra.

## Conversor Pascal-MEPA

