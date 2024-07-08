# Entrada e Saída

É uma das funções mais complexas de um sistema operacional a **Gerência de E/S** devido à diversidade de dispositivos de E/S disponíveis.

O sistema operacional deve criar uma **máquina abstrata** para usuários e aplicações, o que requer um entendimento detalhado do funcionamento dos dispositivos.

## Estrutura do Subsistema de E/S

A gerência de E/S é dividida em múltiplas camadas

| Estrutura |
|-|
| Subsistema de E/S |
| Device drivers |
| Tratadores de interrupções |
| Controle e dispositivos de E/S |

## Dispositivos de E/S

- **Blocos:** dispositivos de blocos armazenam dados em unidades endereçaveis e independentes (HD, Blu-ray)

- **Caracteres:** trabalham com um fluxo constante de dados (impressoras, mouses)

## Subsistema de E/S

- **Comunicação:** Realizada através de rotinas de E/S, permitindo a comunicação com dispositivos sem a necessidade de lidar com detalhes de implementação

- **Independência:** As rotinas de E/S são independentes dos dispositivos específicos, facilitando a criação de arquivos ou a execução de outras operações

- **Tipos de Operações:** Podem ser síncronas (a aplicação aguarda a conclusão) ou assíncronas (a aplicação continua a execução)

- **Buffering:** uma região da memória é reservada para se comunicar com o dispositivo de E/S, assim não é preciso esperar o dispositivo terminar uma operação e pode-se acessar a memória principal

## Device Drivers

Implementam a comunicação entre o subsistema de E/S e os controladores dos dispositivos de E/S

- **Especificidade:** drivers são geralmente específicos para classes de dispositovs e são fornecidos pelos fabricantes

- **Empilhamento de Drivers:** alguns drivers, como os de dispostivos USB, podem ser empilhados no sistema operacional para lidar com diferentes dispositivos

## Controlador de E/S

- **Composição:** os dispotivos de E/S geralmente têm uma parte mecânica (hardware) e uma eletrônica (controladora)

- **Interação com a CPU:** a CPU interage com os dispositivos através do controlador de E/S, que pode ter interfaces padronizadas (ex: SATA, SCSI)

### E/S Programada

- Nesta técnica, o processador **controla diretamente a operação de E/S**, verificando constantemente o estado do dispositivo até que ele esteja pronto para a transferência de dados.
- A CPU emite um comando ao módulo de E/S, verifica o registrador de estado do módulo, e realiza a leitura ou escrita dos dados conforme o dispositivo fica pronto
- A desvantagem é que **utiliza intensamento o tempo do processador**, pois a CPU fica ociosa aguardando o dispositivo concluir a operação

### E/S Controlada por Interrupção

- Em vez de o processador verificar constantemente o estado do dispositivo, o dispositivo gera uma interrupção quando está pronto para a transferência de dados
- O processador emite um comando ao módulo de E/S e continua executando outras instruções. Quando o dispositivo está pronto, ele gera uma interrupção que avisa a CPU para realizar a transferência de dados
- Permite que a CPU execute outras tarefas enquanto espera pelo dispositivo, aumentando a eficiência

### Acesso Direto à Memória (DMA)

- O módulo de DMA permite a transferência de dados entre a **memória principal e o dispositivo de E/S sem a intervenção contínua da CPU**.
- O módulo de E/S utiliza o barramento de memória diretamente para transferir dados, podendo inclusive forçar a CPU a não usar o barramento (**roubo de ciclo**) durante a operação
- Ideal para grandes volumes de dados, pois libera a CPU para outras tarefas e aumenta a taxa de transferência de dados

## Gerenciamento de E/S

### Tratamento de Interrupções

**1. Salvar Contexto Atual:** salvar os registradores que ainda não foram salvos

**2. Estabelecer o Contexto para a Rotina de Tratamento:** sinalização do controlador de interrupção e cópia dos registradores para a tabela de processos

**3. Executar a Rotina de Tratamento de Interrupções:** utilizando as informações fornecidas pelo controlador de interrupções a rotina é executada

**4. Desbloqueio do Driver do Dispositivo:** após o tratamento, o driver que gerou a interrupção é desbloqueado

**5. Execução do Algoritmo de Escalonamento:** o Sistema Operacional deve escalonar o próximo processo a ser executado

**6. Restauração do Contexto do Processo:** carregamento do contexto do processo selecionado com alterações na MMU e carregamento dos registradores

**7. Iniciar a Execução do Novo Processo:** inicia o novo processo

### Problemas com Múltiplas Interrupções

- **Reentrância:** a rotina de tratamento de interrupções deve ser reentrante, ou seja, deve ser executá-la novamento mesmo que a execução anterior ainda não tenha terminado. Por exemplo, um driver de rede pode estar processando um pacote enquanto outro pacote chega

- **Minimização do Impacto no SO:** as interrupções devem afetar a menor parte possível do sistema operacional e as rotinas de tratamento devem ser pequenas, delegando funções complexas para outras camadas

- **Sincronização em Sistemas Multiprocessados:** Em sistemas multiprocessados, as interrupções devem ser gerenciadas utilizando mecanismos de sincronização como semáforos ou mutexes

## Discos magnéticos

- Tempo de interpretação, tempo de busca, tempo de latência, tempo de transferência

- **Buffering e Spooling:** técnicas usadas para gerenciar o acesso aos dispositivos de E/S e garantir a integridade das operações

- **Compartilhamento:** o sistema operacional gerencia o compartilhamento de dispositivos de E/S entre diferentes usuários e aplicações