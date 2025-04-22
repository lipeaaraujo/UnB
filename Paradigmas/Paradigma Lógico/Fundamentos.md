#annotation #summary 
## Paradigma Lógico
- Foi elaborado a partir de um teorema proposto no contexto do processamento de linguagens naturais.
- Programação declarativa, programas compostos por séries de relações lógicas e consultas.
- Caso seja verdadeira, também é possível determinar qual atribuição de valores lógicas às variáveis da sentença aberta a torna uma proposição verdadeira.

### Prolog
- Proposta em 1972 por **Alain Colmerauer** e **Philippe Roussel**, com base nos trabalhos de **Robert Kowalski**.
- "PROgramming in LOGic".

**SWI Prolog instalação:**
```bash
sudo apt-get install swi-prolog
```

**Invocando o interpretador:**
```bash
prolog
```

### Programas em Prolog
- Composto por **predicados**.
- Semelhantes às subrotinas de outras linguagens.
- Inserir códigos no interpretador Prolog - **consultar**.

**Comando para consultar um arquivo-fonte:**
```prolog
?- consult(source).
```

**Reconsultar:**
```prolog
?- reconsult(source).
```

- A extensão dos arquivo-fonte deve ser `.pl`.

**Carregar o arquivo-fonte:**
```bash
prolog -s source.pl
```

**Carregar sem entrar no modo iterativo:**
```bash
prolog -s source.pl -g "goal(X,print(X),nl,fail." -t halt
```

### Exemplo de programa em Prolog

Proposição: "*Todo estudante da FCTE é estudante da UnB*"
```prolog
unb(X) :- fcte(X).
```
> ou "*Para todo X, X é aluno da UnB, se X estuda na FCTE*"

Afirmações sobre estudantes da FCTE, predicado `fcte/1`:
```prolog
fcte(ana).
fcte(beto).
fcte(carlos).
```

**Arquivo fonte:**
```prolog
% exemplo de arquivo-fonte em prolog
unb(X) :- fcte(X).

fcte(ana).
fcte(beto).
fcte(carlos).
```

Sendo inseridos no arquivo `students.pl`, ele pode ser consultado no interpretador Prolog através no predicado `consult/1`:
```prolog
?- consult(students).
true.
```

Checando se Ana é estudante da UnB:
```
?- unb(ana).
true.
```

Para listar todos os estudantes conhecidos na UnB, faça a consulta:
```prolog
?- unb(X)
X = ana .
```

Para obter os demais valores de X utilize o operador ( `;` ) após cada retorno:
```prolog
?- unb(X)
X = ana ;
X = beto ;
X = carlos.
```

Para formatar a listar de estudantes podemos usar os predicados `write/1` e `nl/0`.
- O predicado `write/1` escreve seu argumento no terminal.
- O `nl/0` inicia uma nova linha no terminal.

```prolog
unb(X) :- fcte(X).

fcte(ana).
fcte(beto).
fcte(carlos).

unb_report :-
	write('Estudantes da UnB: '), nl,
	unb(X),
	write(X), nl,
	fail.
```

Para consultar no interpretador: `?- unb_report.`

### Terminologia
- Jargão = termos de programação, de banco de dados e termos lógicos
- Dados = procedimentos
- Programa = banco de dados em Prolog
- Predicado = nome + número (aridade)
- Aridade = número de argumentos do predicado
- Dois predicados com nomes iguais, mas aridades distintas, são distintos
- Cada cláusula pode ser uma **regra** ou **fato**

## Fatos
- São os predicados mais simples do Prolog.
- Sintaxe:
```prolog
pred(arg1, arg2, ..., argN).
```

### Termos
- **inteiro:** qualquer número positivo, negativo ou zero
- **átomo:** uma constante de texto iniciada com letra minúscula
- **variável:** começa com letra maiúscula ou sublinhado ('_')
- **estrutura:** termos complexos

### Fatos em programas Prolog
- Fatos são utilizados para inserir informações no programa
```prolog
paciente('Maria Rita', 35, sus)
paciente('Pedro Silva', 70, amil)
```
- Fatos podem ser inseridos diretamente no interpretador: `asserta/1` e `assertz/1`
	- _O primeiro insere no inicio e o segundo no final_
- Os nomes dos fatos pouco importam para o Prolog.
- `fato(a,b)` e `fato(b,a)` são distintos

## Consultas simples
- O interpretador pode responder a consultas (_queries_) a respeito dos fatos.
- Casamento de padrões (_pattern matching_)
- O padrão de uma consulta é denominado objetivo (goal)
- Objetivo alcançado `true` caso contrário `false.`

### Unificação (simplificada)
- Casamento de padrões são chamados de unificação
- Se um programa contém apenas fatos, a unificação é bem sucedida se as três condições abaixo são satisfeitas:
	- o predicado citado no objetivo e na base é o mesmo.
	- ambos tem a mesma aridade.
	- todos os argumentos são os mesmos.

### Variáveis Lógicas
- Objetivos podem ser generalizados por meio de variáveis
- Substituem um ou mais argumentos no objetivo
- A variável terá como valor os termos os quais casaram com ela
- Os valores serão o retorno da consulta
- Se não houverem mais valores a resposta será "Não"
- O nome das variáveis devem iniciar em maiúsculas.

```prolog
algoritmo(strings, kmp).
algoritmo(strings, z-function).
algoritmo(strings, lcs).
```
Consultas:
```prolog
?- algoritmo(strings, X)
X = kmp ;
X = z-function ;
X = lcs .
```

### Backtracking
- Para satisfazer um objetivo, o Prolog percorre todas as cláusulas que definem o predicado.
- Quando o usuário solicita mais respostas ele retoma a busca das cláusulas da onde terminou
- Na retomada a última variável que foi casada é desatada.

### Objetivos e Fluxos de Controle
- Fluxo de controle: 
	- chamada (call): quando a avaliação do objetivo começa
	- saída (exit): quando a chamada é bem sucedida
	- retomada (redo): quando é seguida de um `;`.
	- falha (fail): quando a chamada não tem mais valores para satisfazer o objetivo.

![[Pasted image 20250401192757.png]]
### Rastreamento
- É possível rastrear o fluxo de controle com o predicado `trace/0`
- Todas as consultas subsequentes são rastreadas
- `creep` avança para o próximo passo
- `notrace/0` seguido do `nodebug/0` desativa o trace

### Generalizações
- São fatos que casam com qualquer outro valor
- Afirmação "Todos dormem": `asserta(sleeps(X)).`

## Consultas compostas
- Combinações de consultas simples
- Sintaxe `query1(a1, ..., ak), query2(b1, ..., br), ...`
- O escopo de uma variável lógica é uma consulta, simples ou composta.
- O backtracking é usado para tentar casar todos os padrões, da esquerda para direita

![[Pasted image 20250401193404.png]]

### Predicados pré-definidos
- Prolog tem predicados (built-in)
- Não há cláusula para tais
- São chamados de predicados extra-lógicos
- Respondem tanto na porta **call** quanto na porta **redo**
- **Exemplos:**
	- `write/1`: escreve um argumento no console.
	- `nl/0`: imprime uma nova linha.
	- `tab/1`: avança $n$ espaços, onde $n$ é o argumento.
	- `fail/0`: sempre falha.

```prolog
triangle(equilateral).
triangle(isosceles).
triangle(scalene).

quadrilateral(square).
quadrilateral(rectangle).
quadrilateral(rhombus).
quadrilateral(trapezoid).

equal_sides(equilateral).
equal_sides(square).
equal_sides(rhombus).
right_angles(square).
right_angles(rectangle).

?- quadrilateral(X), equal_sides(X), write(X), nl, fail.
```