# C1 : Introdução

## Descrição do Trabalho

O projeto consiste na especificação e desenvolvimento de um sistema de gestão de uma oficina mecânica. Este sistema tem como principal objetivo melhorar a organização interna da oficina e otimizar os seus processos de registo, agendamento e gestão de serviços. O desenvolvimento deste sistema planeia permitir automatizar tarefas, reduzindo a possibilidade de erros humanos e proporcionando assim um controle bastante mais eficiente sobre os serviços realizados. A implementação do sistema não só beneficiará a oficina, mas também melhorará a experiência geral dos clientes ao permitir uma gestão mais eficaz dos veículos e serviços prestados.

Uma oficina mecânica enfrenta desafios significativos na gestão de clientes, veículos e agendamentos de serviços dos mesmos. Atualmente, a oficina utiliza métodos manuais para o registo de toda a informação, o que pode levar a confusões e à perda de dados importantes. Cada cliente pode possuir vários veículos, e cada veículo poderá requerer diferentes serviços ao longo do tempo, dificultando o acompanhamento do histórico de serviços realizados e a gestão eficiente dos agendamentos em geral.

Para otimizar a gestão, é necessário o desenvolvimento de um sistema de gestão que permita registar e organizar a informação de forma eficiente e simples, melhorando a comunicação com os clientes e a gestão interna da própria oficina. O sistema deverá incluir funcionalidades que possibilitem o cadastro de clientes, onde se registam os seguintes dados: nome, telefone e e-mail. Além disso, o cadastro de veículos deve abranger informações sobre modelo, marca, ano, quilometragem, matrícula e número de identificação do veículo (VIN).

O sistema também irá permitir agendar os serviços, facilitando a marcação de diferentes intervenções para cada veículo, e incluir também um status de confirmação do agendamento. Para garantir um histórico detalhado, será essencial implementar uma tabela de histórico de veículo, onde serão registados todos os serviços realizados e as ações recomendadas, permitindo um acompanhamento claro e organizado dos veículos.

Adicionalmente, o sistema deve oferecer funcionalidades de comunicação com os clientes, como notificações sobre alterações nos serviços agendados, confirmações de serviços e lembretes automáticos para a conclusão de serviços. Por fim, a interface deve permitir a consulta do histórico de serviços realizados para cada veículo, incluindo custos e frequência de serviços, contribuindo assim para uma melhor organização interna da oficina e aumentando a satisfação dos clientes.

Com este sistema informatizado, espera-se não apenas a eliminação de erros associados a processos manuais, mas também uma melhoria na organização interna da oficina, na eficiência operacional e na experiência global do cliente. A estruturação adequada da informação permitirá uma gestão mais rigorosa dos serviços, com acesso rápido a dados relevantes, histórico atualizado e planeamento mais eficaz. Embora o sistema não seja diretamente acessível aos clientes, os mesmos irão beneficiar da sua implementação pela melhoria da eficiência dos serviços prestados e da redução de erros nos processos. O sistema será exclusivamente utilizado pelos mecânicos e pela equipe administrativa da oficina, permitindo um foco mais detalhado nas necessidades operacionais internas. A gestão do histórico de serviços e agendamentos ajudará os mecânicos a fornecer um atendimento mais preciso e ágil, tornando o ambiente de trabalho mais organizado e produtivo.

## Modelação do Problema

Para a modelação do problema, foram assumidos os seguintes pressupostos:

- Cada cliente pode possuir vários veículos.
- Cada veículo pertence apenas a um cliente.
- Um veículo pode ter múltiplos agendamentos e serviços associados.
- Os serviços são definidos por tipo e preço.
- Cada agendamento inclui data, hora, tipo de serviço e estado (status).
- O sistema mantém um histórico completo dos serviços realizados.

---

# Descrição dos requisitos do utilizador

## Atores e Funcionalidades

As opções disponíveis no sistema de gestão da oficina mecânica dependerão do tipo de utilizador autenticado. Embora a distinção entre os diferentes utilizadores não seja rígida, foram definidos dois perfis principais com permissões distintas mas complementares.

- **Administrativo da Oficina**: Responsável pela gestão geral da informação, registo de clientes e veículos, agendamento de serviços e comunicação com os clientes.
- **Mecânico**: Responsável pela execução dos serviços, consulta de informações relevantes sobre os veículos e marcação de serviços recomendados.

### Funcionalidades Disponíveis

Assim, cada utilizador poderá ter acesso às seguintes funcionalidades:

#### Administrativo da Oficina
- Registo de novos clientes.
- Registo de novos veículos.
- Agendamento de serviços (com seleção de data, hora e tipo de serviço).
- Atualização do estado de confirmação dos agendamentos.
- Comunicação com os clientes (confirmações, lembretes e notificações).
- Consultar e gerir o histórico de serviços.

#### Mecânico
- Consulta dos serviços agendados.
- Consultar dados técnicos dos veículos.
- Registo de serviços realizados.
- Marcação de serviços recomendados.
- Aceder ao histórico de serviços de cada veículo.

> **Nota:** Os clientes **não terão acesso direto ao sistema**. A comunicação com os mesmos será feita através de notificações (por e-mail, SMS ou outro canal), com lembretes de agendamento e confirmações de serviço.

---

| [< Previous](RPF00.md) | [^ Main](../../README.md) | [Next >](RPF02.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
