# Tabelas de dispersão (hashing)

*Aula 17/04/2024*

### 2. Endereçamento aberto

Consiste no uso de <ins>vetores</ins> para implementar **tabelas hash**.

Para resolução de colisões, há algumas técnicas, dentre os quais o mais comum chama-se <ins>sondagem linear</ins>: *se houver colisão, procure-se pela próxima "posição livre" no vetor.*

- **Posição livre: -1**

**<ins>Ex:</ins>**$\;\;\;T = 10$

|0|1|2|3|4|5|6|7|8|9| 
|-|-|-|-|-|-|-|-|-|-|
|99|-1|-1|33|43|-1|36|77|46|56|

<ins>chaves:</ins> 33 36 43 77 46 56 99

Vai ser boa quando a tabela for <ins>esparsa</ins>
- quando possui "muitos" elementos vazios.

**Densidade** é a porcentagem de elementos não-vazios do vetor.

$Densidade = \frac{qtde.\,elem.\,não\,vazios}{tamanho\,tabela}$

Um vetor com $densidade\le0,3$ pode ser considerado esparso.

Na prática, quando a tabela hash atingir uma densidade $D < 1$, podemos **redimensioná-la**. Uma boa é dobrar o tamanho.
Ao redimensionar, é necessário reinserir os elementos *(pois $T$ muda e, consequentemente, a função hash)*.

**Inserção**
```c
void insercao(int *v, int T, int ch) {
  int pos = hash(ch);
  while (v[pos] != 1) pos = (pos + 1) % T;
  v[pos] = ch;
}
```

**Busca**
```c
int busca(int *v, int T, int ch) {
  int pos = hash(ch);
  while (v[pos] != -1 && v[pos] != ch) pos = (pos + 1) % T;
  if (v[pos] == ch) return pos;
  return -1;
}
```

**Remoção**
- remove e marca como disponível *(posso inserir)* mas não vazia.
- reinserir na hash todos os elementos à direita até encontrar o valor.
```c
void remocao(int *v, int T, int ch) {
  int pos = busca(ch);
  if (pos >= 0) {
    v[pos] = -2;
  }
}
```
```c
void remocao(int *v, int T, int ch) {
  int pos = busca(ch);
  if (pos >= 0) {
    v[pos] = -1;
    pos = (pos + 1) % T;
    while (v[pos] != -1) {
      int elem = v[pos];
      v[pos] = -1;
      insercao(elem)
    }
  }
}
```