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

CLAUSULAS=0
for((i=0;i<L;i++)); do
	for((j=0;j<C;j++)); do
		ADJ="$(adjacentes $i $j )"
		echo "-${VAR[B,$i,$j]} $ADJ 0"
		((CLAUSULAS++))
		for XX in $ADJ; do
			echo "${VAR[B,$i,$j]} -$XX 0"
			((CLAUSULAS++))
		done
	done
done > regradasbrisas

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
	read B G
	[[ "$B" == 1 ]] && echo "${VAR[B,$l,$c]} 0" >> KB
	[[ "$B" == 0 ]] && echo "-${VAR[B,$l,$c]} 0" >> KB
	((KBSIZE++))
}

# return codes 1 - unsafe
#              0 - safe
#              2 - incerto
function pergunta()
{
	local alpha="$1"
	cat regradasbrisas KB > pergunta
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

function moveto()
{
	local pos=$1
	echo "MOVI PARA $pos"
	echo -n "Sensor?"
	LERSENSOR  ${pos%,*} ${pos#*,}
	local ADJ=$(adjacentes ${pos%,*} ${pos#*,})
	local f
	local k
	echo -n "   enfileirando:"
	for f in $ADJ; do
		((ffila++))
		k="${VAR[r,$f]}"
		FILA[$ffila]="${k#?,}"
		echo -n " ${k#?,}"
	done
	echo
}

while (( ifila<=ffila )); do
	next=${FILA[$ifila]}
	unset ${FILA[$ifila]}
	((ifila++))
	echo "-- Decidindo ${VAR[r,${VAR[P,$next]}]}"
	pergunta -${VAR[P,$next]}
	ret=$?
	(( ret == 0 )) && echo "$next é inseguro! FUJA!"
	(( ret == 1 )) && echo "$next é seguro, bora lá!!!!" && moveto $next
	(( ret == 2 )) && echo "$next é incerto, não vamos arriscar!!!!"
done
