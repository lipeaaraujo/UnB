#summary 

>[!objetivo]
>Oferecer transporte de dados entre processos do usuário (camada de aplicação) residentes em *hosts* distintos

- Extensão dos serviços da camada de rede, atua como um intermediário entre as camadas de aplicação e de rede
- Comunicação fim-a-fim (host-to-host)

**Modelos OSI e TCP/IP:**
![[Pasted image 20250408233446.png]]

## Multiplexação/demultiplexação
- O protocolo de transporte aceita mensagens de vários processos
- Transporte entrega mensagens para vários processos

![[Pasted image 20250409094027.png]]
## Endereçamento
- Processos (aplicações do usuário) são vinculados a endereços de transporte (portas)
- Portas são números inteiros de 16 bits

## Paradigma cliente-servidor
- Processo no host local (cliente) solicita serviços a outro processo, normalmente localizado no host remoto (servidor)
![[Pasted image 20250409094857.png]]
## Protocolos de Transporte
- [[Protocolo UDP]]
- [[Protocolo TCP]]

## [[Transporte Confiável de Dados]]