#summary 
## Protocolo User Datagram Protocol
- Datagramas de tamanho variável
- Não há estabelecimento de conexão
- Pequeno overhead no cabeçalho do pacote (favorece aplicações multimídia)
- Apropriado para processos que transmitem mensagens curtas
- Taxa de envio não regulada
	- Não tem controle de fluxo
	- Receptor pode ser inundado se chegar um número excessivo de mensagens

## Cabeçalho de datagrama
- Portas de origem e destino
- Tamanho do datagrama UDP de até 64kb
- Checksum (16 bits) para detecção de erros
	- **Erro => datagrama descartado**
![[Pasted image 20250409095616.png]]
## Utilidade
- Aplicações que queiram mais controle sobre o fluxo de transmissão de dados
- Aplicações que suportem perdas de dados pequenas
- **Exemplos:**
	- Multimídia
	- VoIP
	- Gerenciamento de rede (SNMP)
	- Protocolo de roteamento RIP
	- Serviço de nomes DNS