# Reconhecedor de Sequência 1101 em Máquinas de Estados Finitos (Mealy e Moore)

Este projeto consiste na implementação, simulação e análise comparativa de um Reconhecedor de Sequência 1101 utilizando Máquinas de Estados Finitos (MEF) dos tipos Mealy e Moore, descritas em VHDL.
O trabalho tem como foco a consolidação dos conceitos de circuitos sequenciais, por meio da modelagem dos estados, desenvolvimento de testbenchs, simulação funcional e análise de desempenho dos dois modelos. Como etapa final, o reconhecedor baseado no modelo Moore foi adaptado e implementado em FPGA, utilizando a placa Intel DE10-Lite.

# Objetivos

## Objetivo Geral

Analisar, simular e implementar reconhecedores de sequência nos modelos Mealy e Moore, utilizando ferramentas de desenvolvimento e simulação de circuitos digitais, com posterior adaptação para execução em FPGA.

## Objetivos Específicos

- Desenvolver reconhecedores de sequência 1101 em VHDL nos modelos Mealy e Moore
- Simular os circuitos por meio do GHDL e analisar as formas de onda no GtkWave
- Comparar os modelos quanto a comportamento lógico, latência e complexidade estrutural
- Adaptar o código VHDL para a placa Intel DE10-Lite, mapeando corretamente entradas e saídas
- Validar o funcionamento do circuito em ambiente de hardware real

# Fundamentação Teórica

Máquinas de Estados Finitos são amplamente utilizadas em sistemas digitais para descrever o comportamento de circuitos sequenciais, sendo comuns em aplicações como controle de processos, automação e interfaces de usuário.
Os modelos de Mealy e Moore diferenciam-se principalmente pela forma como a saída é gerada:

- No modelo Mealy, a saída depende do estado atual e da entrada
- No modelo Moore, a saída depende exclusivamente do estado atual

Essa diferença impacta diretamente o tempo de resposta do sistema, a quantidade de estados necessários e a complexidade da implementação.

# Metodologia

O desenvolvimento do projeto seguiu uma abordagem estruturada, composta pelas seguintes etapas:
```markdown
1. Elaboração dos diagramas de estados e tabelas de transição dos modelos Mealy e Moore
2. Definição das expressões de saída a partir das tabelas de estados
3. Implementação dos reconhecedores em VHDL, utilizando descrição funcional
4. Desenvolvimento de testbenchs para geração de estímulos de entrada
5. Simulação funcional no GHDL e análise visual das formas de onda no GtkWave
6. Comparação dos resultados obtidos para os dois modelos
7. Adaptação do código do modelo Moore para a FPGA Intel DE10-Lite utilizando o Quartus Prime
```

# Implementação em FPGA

O reconhecedor de sequência baseado no modelo Moore foi adaptado para execução na placa Intel DE10-Lite, com o seguinte mapeamento:

- Entrada da sequência: chave SW(0)
- Clock manual: Pushbutton KEY(0)
- Saída do reconhecedor: display HEX5
- Estado atual da máquina: display HEX0

Ao inserir corretamente a sequência 1101, o display HEX5 indica a ativação da saída, confirmando o funcionamento do circuito em hardware.

# Tecnologias e Ferramentas Utilizadas

- VHDL
- GHDL
- GtkWave
- Quartus Prime
- FPGA Intel DE10-Lite

# Referências

FLOYD, T. L. Sistemas Digitais: fundamentos e aplicações. Artmed Bookman, 9ª edição, 2007.
TOCCI, R. J.; WIDMER, N. S.; MOSS, G. L. Sistemas Digitais: princípios e aplicações. Pearson, 11ª edição, 2011.
Manual da Placa Intel DE10-Lite.
