**Definição:** A arquitetura Peer To Peer é uma arquitetura de sistemas distribuídos caracterizada pela descentralização das funções na rede, onde cada nodo realiza tanto funções de cliente quanto de servidor.

**Responsabilidades do peer, como cliente:**
- Enviar pedidos de serviço a outros *peers*, e
- Receber as respostas de pedidos de serviço feitos a outros *peers*.

**Responsabilidades do peer, como servidor:**
- Receber pedidos de serviço de outros *peers*.
- Processar os pedidos e executar o serviço requerido.
- Enviar a resposta com os resultados do serviço requerido

### Vantagens
- Eliminar o gargalo de fonte única, usando o P2P para distribuir dados e fazer o balanceamento de pedidos na rede
- Eliminar o risco de um único ponto de falha, e
- A infraestrutura P2P permite acesso direto aos recursos compartilhados, e isso confere capacidade de manutenção remota

### Desvantangens
- Principalmente, uma implementação bem mais complexa demandando mais conhecimento da equipe de implantação e manutenção
- **Overheads:** comunicações replicadas entre pares, ou seja, mesma busca sendo processada por muitos nós diferentes