**Definição:** Algoritmo usado para a compressão de dados criado por Huffman . Utilizado em muitos, senão todos os algoritmos de compressão atuais 

Propriedades:
- **Gera códigos prefixos ótimos**
- **Barato para gerar códigos**
- **Barato em codificar e decodificar**

## Conceitos

- **Código de Tamanho Variável**: Um código de tamanho variável define uma bit string (codeword) de tamanho variável para cada símbolo. 
- **Código Unicamente Decodificável**: Um código unicamente decodificável é um código de tamanho variável em que cada bit string pode ser decomposta na sua codeword.

Já existem diversos Prefix Codes criados para diferentes situações.

## Tamanho Médio

Para um código $C$ com probabilidade associadas $p(c)$ o tamanho médio é definido por:

$$ACL(C)=\sum_{c\in C} p(c)l(c)$$   $l(c)$ = tamanho da codeword $c$ (um inteiro positivo)

## Algoritmo

1. Contar quantas vezes cada caractere aparece.
2. Manter um heap de mínimo com a frequência de caracteres.
3. Unir dois caracteres do mesmo peso retirando da heap.
4. Montar uma árvore binária que age como código prefixo.
5. Conferir se a raiz tem o mesmo valor da soma do total de caractere.
6. Para conseguir o código de cada símbolo, cada passo para esquerda na árvore é um 0 e para a direita é 1.
7. No fim, codificar a palavra

## Execução

Exemplo - `UniversidadedeBrasília`

![[execução-huffman.excalidraw]]

### Tabela de codificação:

| U     | n     | i   | v     | e   | r   | s   | d   | a   | B     | í    | l    |
| ----- | ----- | --- | ----- | --- | --- | --- | --- | --- | ----- | ---- | ---- |
| 00010 | 00011 | 001 | 00000 | 100 | 101 | 110 | 010 | 011 | 00001 | 1110 | 1111 |
Palavra codificada: `Universidade de Brasília = 0001000011001000001001011100010100110101000101000000110101111011101111001011`