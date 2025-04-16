>[!definição]
>O jogo _Wumpus World_ é baseado em um tabuleiro onde o jogador deve explorar células sem cair em poços (_Pits_) ou ser atacado pelo Wumpus. O agente usa sensores para detectar brisas (_B_) próximas a poços e brilho (_G_) próximo ao ouro.

**Fórmula brisa x poço:**
$(\lnot Bx,y \lor Px-1,y \lor Px+1,y \lor Px,y+1 \lor Px,y+1)$
$(Bx,y \lor \lnot Px-1,y)$
$(Bx,y \lor \lnot Px+1,y)$
$(Bx,y \lor \lnot Px,y-1)$
$(Bx,y \lor \lnot Px,y+1)$
## Implementação em bash script


### Versão 1

```sh

```

### Versão 2

```sh
#!/bin/bash

declare -A VAR
L=4
C=4
TOTVARS=1

for((i=0;i<L;i++)); do
	for((j=0;j<C;j++)); do
		VAR[B,$i,$j]=$TOTVARS
		VAR[r,$TOTVARS]=B,$i,$j
		((TOTVARS++))
		VAR[P,$i,$j]=$TOTVARS
		VAR[r,$TOTVARS]=P,$i,$j
		((TOTVARS++))
		VAR[S,$i,$j]=$TOTVARS
		VAR[r,$TOTVARS]=S,$i,$j
		((TOTVARS++))
		VAR[W,$i,$j]=$TOTVARS
		VAR[r,$TOTVARS]=W,$i,$j
		((TOTVARS++))
	done
done

#formula da brisa x poço
# (\lnot Bx,y \lor Px-1,y \lor Px+1,y \lor Px,y-1 \lor Px,y+1)
# (Bx,y \lor \lnot Px-1,y)
# (Bx,y \lor \lnot Px+1,y)
# (Bx,y \lor \lnot Px,y-1)
# (Bx,y \lor \lnot Px,y+1)

function adjacentes()
{
	local l=$1
	local c=$2
	local t=$3
	[[ -z "$t" ]] && t=P
	dl=(0  0 -1 1)
	dc=(-1 1  0 0)
	local x
	for((x=0;x<${#dl[@]};x++)); do
		nl=$((l+${dl[$x]}))
		nc=$((c+${dc[$x]}))
		if ((nl<0 ))|| ((nl>=L)); then
			continue;
		fi
		if ((nc<0 ))|| ((nc>=C)); then
			continue;
		fi
		echo -n " ${VAR[$t,$nl,$nc]}"
	done

}

CLAUSULAS=0
for((i=0;i<L;i++)); do
	for((j=0;j<C;j++)); do
		ADJ="$(adjacentes $i $j P)"
		echo "-${VAR[B,$i,$j]} $ADJ 0"
		((CLAUSULAS++))
		for XX in $ADJ; do
			echo "${VAR[B,$i,$j]} -$XX 0"
			((CLAUSULAS++))
		done
		ADJ="$(adjacentes $i $j W)"
		echo "-${VAR[S,$i,$j]} $ADJ 0"
		((CLAUSULAS++))
		for XX in $ADJ; do
			echo "${VAR[S
![[Recording 20250403165330.m4a]]
,$i,$j]} -$XX 0"
			((CLAUSULAS++))
		done
	done
done > regradasbrisas

MINUMWUMPUS=""
for((i=0;i<L;i++)); do
	for((j=0;j<C;j++)); do
		MINUMWUMPUS="${VAR[W,$i,$j]}"
	done
done
MINUMWUMPUS+="0"
echo "$MINUMWUMPUS" >> regradasbrisas

declare -a POSICOES
for((i=0;i<L;i++)); do
	for((j=0;j<C;j++)); do
		POSICOES+=($i,$j)
	done
done

posicaov=0
for P in ${POSICOES[@]}; do
	for((Pl=posicaov+1;P1=${#POSICOES[@]; Pl++})); do
		echo "-${VAR[W, $P]} -${VAR[[W, ${POSICOES[Pl]}]]}"
	done
	((posicaov++))
done >> regradasbrisas


KBSIZE=1
echo "-${VAR[P,0,0]} 0" > KB

#Sensores
# B - para brisa
# G - brilho
# S - cheiro nao usaremos hoje
# D - grito da morte! nao usaremos
# P - parece, trombou! nao usaremos


function LERSENSOR()
{
	local l=$1
	local c=$2
	read B S
	[[ "$B" == 1 ]] && echo "${VAR[B,$l,$c]} 0" >> KB
	[[ "$B" == 0 ]] && echo "-${VAR[B,$l,$c]} 0" >> KB
	[[ "$S" == 1 ]] && echo "${VAR[S,$l,$c]} 0" >> KB
	[[ "$S" == 0 ]] && echo "-${VAR[S,$l,$c]} 0" >> KB
	((KBSIZE++))
}

# return codes 1 - unsafe
#              0 - safe
#              2 - incerto
function pergunta()
{
	local alpha="$1"
	local alpha1="$2"
	local op="$3"
	local neg="${(-1*$alpha)}"
	local neg1="${(-1*$alpha1)}"
	> pergunta
	if [[ "$op" == "AND" ]]; then
		echo "$NEG $NEG1 0" >> pergunta
	else
		echo "$NEG 0" >> pergunta
		echo "$NEG1 0" >> pergunta
	fi

	cat regradasbrisas KB >> pergunta
	echo "$((-$alpha)) 0" >> pergunta
	echo "p cnf $TOTVARS $((CLAUSULAS+KBSIZE+1))" > pergunta.cnf
	cat pergunta >> pergunta.cnf
	clasp pergunta.cnf
	if (( $? == 20 )); then
	## XXX: O erro feito em sala era justamente que estava sendo armazenado o contrário
	#na base de conhecimento. Quando invertemos a pergunta, esquecemos de inverter aqui.
	#Agora foi resolvido enviando o alpha do jeito que se espera a pergunta, aqui na função
	#inverte o sinal de alpha para fazer a conjunção, e caso seja UNSAT, armazena na KB
	#o alpha original.
		echo "$alpha 0" >> KB
		echo "$alpha1 0" >> KB
		((KBSIZE++))
		return 1
	fi
	return 2
}

LERSENSOR 0 0
declare -a FILA
FILA=( 0,1 1,0 )
ifila=0
ffila=1

## visitados também já são seguros
declare -A VISITADOS 
		k="${VAR[r,$f]}"
VISITADOS[P,0,0]=1

declare -A NAFILA
function moveto()
{
	local pos=$1
	echo "MOVI PARA $pos"
	VISITADOS[P, $pos]=1
	echo -n "Sensor?"
	LERSENSOR  ${pos%,*} ${pos#*,}
	local ADJ=$(adjacentes ${pos%,*} ${pos#*,})
	local f
	local k
	echo -n "   enfileirando:"
	for f in $ADJ; do
		k="${VAR[r,$f]}"
		[[ -n "${VISITADOS[$k]}" ]] && continue
		[[ -n "${NAFILA[$k]}" ]] && continue
		((ffila++))
		FILA[$ffila]="${k#?,}"
		NAFILA[$k]=1
		echo -n " ${k#?,}"
	done
	echo
}

while (( ifila<=ffila )); do
	next=${FILA[$ifila]}
	unset ${FILA[$ifila]}
	unset ${NAFILA[P, $next]}
	((ifila++))
	echo "-- Decidindo ${VAR[r,${VAR[P,$next]}]}"
	# primeiro pergunta se não tem poço e não tem wumpus
	pergunta -${VAR[P,$next]} -${VAR[P, $next]} AND
	ret=$?
	(( ret == 0 )) && echo "$next é inseguro! FUJA!"
	(( ret == 1 )) && echo "$next é seguro, bora lá!!!!" && moveto $next
	(( ret == 2 )) && echo "$next é incerto, não vamos arriscar!!!!"
done

```

```bash
less ~ribas/wumpus.sh
cp ~ribas/wumpus.sh ~/
```

## Explicação do código

Esse código implementa um agente lógico para o jogo _Wumpus World_, utilizando a lógica proposicional e resolução por _SAT solver_ para determinar quais células do tabuleiro são seguras para se mover.

---

### 📌 **Entendendo o código**

O jogo _Wumpus World_ é baseado em um tabuleiro onde o jogador deve explorar células sem cair em poços (_Pits_) ou ser atacado pelo Wumpus. O agente usa sensores para detectar brisas (_B_) próximas a poços e brilho (_G_) próximo ao ouro.

Este código está estruturado em três partes principais:

1. **Modelagem do tabuleiro e variáveis lógicas**
2. **Geração de regras lógicas (Cláusulas CNF)**
3. **Exploração do tabuleiro com inferência lógica**
    

---

## **1️⃣ Modelagem do tabuleiro e variáveis lógicas**

O tabuleiro é modelado como uma matriz `L x C` (4x4 por padrão), e cada célula possui variáveis lógicas associadas:

- `B,x,y`: Indica se há uma brisa na célula `(x,y)`.
- `P,x,y`: Indica se há um poço na célula `(x,y)`.
- `r,n`: Armazena a posição associada ao número da variável (para referência reversa).

### 🔹 **Criando as variáveis**

A matriz de variáveis é criada no trecho:

```bash
declare -A VAR  # Declara um array associativo (dicionário)
L=4
C=4
TOTVARS=1  # Contador de variáveis proposicionais

for((i=0;i<L;i++)); do
    for((j=0;j<C;j++)); do
        VAR[B,$i,$j]=$TOTVARS
        VAR[r,$TOTVARS]=B,$i,$j
        ((TOTVARS++))
        VAR[P,$i,$j]=$TOTVARS
        VAR[r,$TOTVARS]=P,$i,$j
        ((TOTVARS++))
    done
done
```

Isso cria um mapeamento de cada célula `(i, j)` para duas variáveis lógicas:

- `VAR[B,i,j]` → variável que representa a brisa.
- `VAR[P,i,j]` → variável que representa um poço.

A tabela resultante ficaria algo assim:

|Célula `(i,j)`|Variável `B`|Variável `P`|
|---|---|---|
|`(0,0)`|1|2|
|`(0,1)`|3|4|
|`(0,2)`|5|6|
|...|...|...|

A variável `TOTVARS` garante que cada proposição tem um identificador único.

---

## **2️⃣ Geração de regras lógicas (CNF)**

O código constrói as regras de inferência do jogo:

### 🔹 **Função `adjacentes`**

Esta função retorna as células vizinhas de `(l, c)`, respeitando os limites do tabuleiro:

```bash
function adjacentes()
{
    local l=$1
    local c=$2
    dl=(0  0 -1 1)
    dc=(-1 1  0 0)
    local x
    for((x=0;x<${#dl[@]};x++)); do
        nl=$((l+${dl[$x]}))
        nc=$((c+${dc[$x]}))
        if ((nl<0 ))|| ((nl>=L)); then
            continue;
        fi
        if ((nc<0 ))|| ((nc>=C)); then
            continue;
        fi
        echo -n " ${VAR[P,$nl,$nc]}"
    done
}
```

Isso permite acessar células vizinhas para inferências.

### 🔹 **Construindo as cláusulas**

Cada célula `(i, j)` obedece às seguintes regras:

1. **Uma célula com brisa significa que há um poço adjacente**  
    **(¬B_x,y ∨ P_x-1,y ∨ P_x+1,y ∨ P_x,y-1 ∨ P_x,y+1)**  
    Implementado em:
    
    ```bash
    ADJ="$(adjacentes $i $j )"
    echo "-${VAR[B,$i,$j]} $ADJ 0"
    ```
    
2. **Se há um poço, então há brisa nas células vizinhas**  
    **(B_x,y ∨ ¬P_x-1,y) (B_x,y ∨ ¬P_x+1,y) ...**  
    Implementado em:
    
    ```bash
    for XX in $ADJ; do
        echo "${VAR[B,$i,$j]} -$XX 0"
    done
    ```
    

Essas cláusulas são salvas no arquivo `regradasbrisas`.

---

## **3️⃣ Exploração do tabuleiro com inferência lógica**

A exploração ocorre utilizando um _SAT solver_ (`clasp`).

### 🔹 **Lendo sensores**

O agente recebe informações sobre a presença de brisa e brilho ao visitar uma célula:

```bash
function LERSENSOR()
{
    local l=$1
    local c=$2
    read B G  # Lê valores do sensor
    [[ "$B" == 1 ]] && echo "${VAR[B,$l,$c]} 0" >> KB
    [[ "$B" == 0 ]] && echo "-${VAR[B,$l,$c]} 0" >> KB
    ((KBSIZE++))
}
```

Isso adiciona a informação à base de conhecimento `KB`.

### 🔹 **Perguntando se uma célula é segura**

A função `pergunta` verifica se a célula contém um poço usando um _SAT solver_:

```bash
function pergunta()
{
    local alpha="$1"
    cat regradasbrisas KB > pergunta
    echo "$((-$alpha)) 0" >> pergunta  # Negamos alpha
    echo "p cnf $TOTVARS $((CLAUSULAS+KBSIZE+1))" > pergunta.cnf
    cat pergunta >> pergunta.cnf
    clasp pergunta.cnf  # Executa o SAT solver
    if (( $? == 20 )); then
        echo "$alpha 0" >> KB
        ((KBSIZE++))
        return 1  # Célula é insegura
    fi
    return 2  # Célula é incerta
}
```

Se o SAT solver retornar `UNSAT`, significa que a célula não pode conter um poço e é segura.

### 🔹 **Exploração com BFS**

O agente usa _fila_ para explorar novas células:

```bash
declare -a FILA
FILA=( 0,1 1,0 )  # Começa nas células (0,1) e (1,0)
ifila=0
ffila=1
```

E processa cada célula:

```bash
while (( ifila<=ffila )); do
    next=${FILA[$ifila]}
    unset ${FILA[$ifila]}
    ((ifila++))
    pergunta -${VAR[P,$next]}
    ret=$?
    (( ret == 0 )) && echo "$next é inseguro! FUJA!"
    (( ret == 1 )) && echo "$next é seguro, bora lá!!!!" && moveto $next
    (( ret == 2 )) && echo "$next é incerto, não vamos arriscar!!!!"
done
```

O agente decide o próximo movimento:

- **Seguro (`ret == 1`)** → Move para a célula
- **Inseguro (`ret == 0`)** → Evita a célula
- **Incerto (`ret == 2`)** → Não visita a célula

[^1]: 
