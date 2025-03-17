**Definição:** O TDD ou Test-Driven Development é uma metodologia de desenvolvimento voltado ao desenvolvimento de testes. Ela centra todo o processo em volta da criação dos testes antes de começar a desenvolver, e usá-los como base para o desenvolvimento de uma funcionalidade.

O fluxo pode ser descrito de forma resumida da seguinte forma:
1. **Red:** Escreva um teste que falhe
2. **Green:** Faça o código funcionar e o teste passar
3. **Refactor:** Refatore a funcionalidade desenvolvida para evitar redundância

![[tdd-fluxo.png]]
## Metodologia

- Analisar e documentar os **requisitos** que a funcionalidade a ser desenvolvida precisa cumprir.
- Começar o desenvolvimento dos testes, cumprindo cada requisito especificado com clareza e começar partes essenciais do código.
- O código é desenvolvido ao longo do desenvolvimento dos testes para permitir a correta execução, erros de compilação podem ser corrigidos escrevendo as declarações necessárias no código.

## Técnicas

- **Falsificação:** quando ainda não se sabe como **implementar** uma unidade, pode-se simular o retorno correto para validar o teste temporariamente.
- **Duplicação:** mesmo após a criação do primeiro teste, se ainda não se sabe como implementar a unidade, o código de falsificação pode ser duplicado para extrair alguma **lógica** da forma que a unidade deve ser implementada.
- **Triangulação:** a triangulação de testes (pelo menos 3 testes diferentes passando) pode garantir maior confiabilidade que a **unidade** está bem testada.
