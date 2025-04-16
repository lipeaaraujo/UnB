**Definição:** Estilo arquitetural que realiza comunicação e troca de informações por meio de **serviços** que disponibilizam dados e realizam certas funções de forma independente da aplicação que está usando o serviço.
## Surgimento

- O desenvolvimento da web promoveu o acesso de computadores clientes aos servidores remotos fora de suas próprias organizações. 
- Organizações convertiam suas informações em HTML, tornando-as acessíveis por esses computadores.
- Contudo, o acesso era somente por meio de navegador web, e o acesso direto aos repositórios de informações por outros programas não era prático.
- Isso impossibilitou as conexões convenientes entre os servidores, nas quais, por exemplo, um programa consulta uma série de catálogos.
- Para contornar esse problema, a noção de um **Web Service** foi proposta.

Usando esse tipo de serviço, as organizações que desejam tornar acessíveis suas informações a outros programas podem fazer isso com a definição e publicação de uma interface de **Web Service**.

- Essa interface define os dados disponíveis e como eles podem acessados.

## Serviços

**Essência de um serviço**: o fornecimento dos serviços é independente da aplicação que usa o serviço. Os provedores de serviços podem desenvolver serviços especializados e oferecê-los a uma gama de usuários de organizações diferentes.

### Componentes Arquiteturais

![[Pasted image 20250127091123.png]]
- Serviços podem ser oferecidos por qualquer provedor de serviços.
- O provedor de serviços torna pública as informações sobre o serviço
- A criação conveniente de novos serviços
- Os usuários de serviços podem pagar pelos serviços de acordo com o uso no local de fornecimento
- As aplicações podem se tornar menores, uma vez que parte de suas funcionalidades pode ser desempenhada pelos serviços
- As aplicações podem ser reativas e adaptar suas operações de acordo com o ambiente, por meio da vinculação de serviços diferentes à medida que o ambiente muda

### Protocolos de Web Service

- **SOAP:** (Simple Object Access Protocol) foco no transporte de dados (XML/HTML)
- **WSDL:** (Web Services Description Language) foco na descrição dos serviços
- **UDDI:** Universal Description Discovery and Interface.

**Organização UDDI:** 
- **Páginas brancas:** informações gerais
- **Páginas amarelas:** informações categorizadas dos serviços
- **Páginas verdes:** informações técnicas sobre o serviço utilizado