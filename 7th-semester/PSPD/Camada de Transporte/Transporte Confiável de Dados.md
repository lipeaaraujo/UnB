#summary 

Como garantir a entrada de dados em ordem e sem erros no receptor?

## Sequenciamento dos segmentos
- Bytes transmitidos em cada conexão são numerados pelo [[Protocolo TCP|TCP]]
	- O número inicial é escolhido aleatoriamente, o campo de sequência no cabeçalho define o número do primeiro byte contido no segmento
- O campo de reconhecimento indica o número do próximo byte esperado pelo receptor, é um número cumulativo.
![[Pasted image 20250402132956.png]]

## Estabelecimento de conexão
- Acordos entre as partes sobre o tipo de serviço prestado
- Define valores iniciais para as variáveis de controle que serão utilizadas na fase de transferência de dados
![[Pasted image 20250409101003.png]]
## Controle de fluxo
- Receptor indica quantos bytes pode receber no máximo, usando uma janela deslizante
- O [[Protocolo TCP|TCP]] possui funcionalidades similares ao Go-Back-N e à Repetição Seletiva
	- O emissor pode ter bytes transmitidos mas ainda não reconhecidos na janela
	- O receptor recebe segmentos ordenados, ao receber, devolve um ACK para o emissor e entrega os bytes para a camada de aplicação
	- O receptor envia apenas reconhecimentos cumulativos, não reconhece segmentos que chegarem fora de ordem e armazena segmentos fora de ordem em buffers de recepção (não descarta)
![[Pasted image 20250409100947.png]]

## Controle de erros
- Checksum
- Confirmação
- Retransmissão
	- Temporização (RTO - Retransmission Time-Out)
	- Após três segmentos com ACK duplicados (retransmissão rápida)
- RTO
![[Pasted image 20250409101517.png]]
- Retransmissão rápida
![[Pasted image 20250409101538.png]]

## Encerramento de transmissão
- Encerra os acordos feitos entre as partes sobre o tipo de serviço prestado
![[Pasted image 20250409101621.png]]