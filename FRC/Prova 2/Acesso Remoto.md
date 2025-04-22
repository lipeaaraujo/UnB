**Definição:** O acesso remoto é uma forma de se conectar e realizar configurações em um servidor de forma remota, onde não se precisa ter acesso físico a nenhum componente do servidor e as alterações podem ser feitas de qualquer lugar.

## Protocolos

- Existem diversos protocolos de acesso remoto, os mais conhecidos são o [[Telnet]] e o [[SSH]]
- A principal diferença entre os dois protocolos é que o serviço de [[Telnet]] é **não encriptado** e o [[SSH]] possui **criptografia**

## Vulnerabilidades 

- Hackers podem interceptar mensagens vulneráveis usando métodos como o **Man In The Middle** e **Sniffer**.
- O sniffer fareja e detecta os pacotes sendo transmitidos em uma rede, se os pacotes não forem **criptografados** ele é capaz de acessar o conteúdo das mensagens. Exemplo: **Wireshark**.