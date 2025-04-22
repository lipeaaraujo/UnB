**Definição:** VLAN ou Virtual LAN  é uma ferramenta que permite a segmentação lógica de uma mesma rede. Proporcionando melhor segurança e desempenho em redes de maior escala ao separá-la em partes lógicas que não compartilham todos os dados.

Uma [[LAN]] tradicional permite que todos os dispositivos se comuniquem pelo mesmo [[broadcast]], compartilhando todos os dados entre si. As VLANs entram em jogo quando é necessária essa segmentação.
## Introdução

Usando VLANs é possível criar sub-redes dentro de uma mesma rede física. Permitindo que os dispositivos se comuniquem como se estivessem em redes separadas, mesmo compartilhando o mesmo switch.

- **Modo Acesso:** O modo de acesso permite que uma porta se dedique a transmitir dados de apenas uma VLAN específica, atuando como uma estrada de **via única** ou uma via exclusiva para os dispositivos na VLAN.

- **Modo Trunk:**  O modo trunk é exatamente o contrário do modo de acesso, ele atua como uma via de **múltiplas faixas** que permite que dados de várias VLANs diferentes trafeguem por uma porta do switch. Os dados de cada VLAN são identificados com tags para garantir a comunicação correta.
## Passo a passo

![[Pasted image 20250112162221.png]]

