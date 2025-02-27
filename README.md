# Processador RISC de 32 bits em VHDL

## Descrição
Implementação de um processador de 32 bits utilizando a lingugagem de máquina VHDL. A arquitetura foi projetada para executar operações básicas de um CPU, incluindo controle de fluxo, operações aritméticas e manipulação de memória.

## Estrutura do Projeto
O processador foi dividido em diversos módulos, cada um responsável por uma função específica:

- **CPU**: Unidade central de processamento, integrando os demais módulos.
- **CONTROL**: Unidade de controle responsável pela execução das instruções.
- **ULA (Unidade Lógica e Aritmética)**: Realiza operações matemáticas e lógicas.
- **REGISTERS**: Conjunto de registradores para armazenamento temporário de dados.
- **INSTRUCTION MEMORY**: Memória de instruções para armazenar os programas a serem executados.
- **DATA MEMORY**: Memória de dados para operações de leitura e escrita.
- **MUX 2X1 32 BITS e MUX 2X1 5 BITS**: Multiplexadores utilizados na seleção de dados.
- **SHIFT LEFT (2 e 28 BITS)**: Operações de deslocamento de bits.
- **PROGRAM COUNTER**: Contador de programa, responsável pelo fluxo de execução.
- **SOMADORES**: Implementação de somadores para operações de endereçamento.
- **TESTBENCH**: Arquivos para simulação e validação do projeto.
