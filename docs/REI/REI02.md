# C2 : Especificação de Requisitos

## Atores e Funcionalidades

As opções disponíveis no sistema de gestão da oficina mecânica dependerão do tipo de utilizador autenticado. Embora a distinção entre os diferentes utilizadores não seja rígida, foram definidos dois perfis principais com permissões distintas mas complementares.

- **Administrativo da Oficina**: Responsável pela gestão geral da informação, registo de clientes e veículos, agendamento de serviços e comunicação com os clientes.
- **Mecânico**: Responsável pela execução dos serviços, consulta de informações relevantes sobre os veículos e marcação de ações recomendadas.

### Funcionalidades Disponíveis

Assim, cada utilizador poderá ter acesso às seguintes funcionalidades:

#### Administrativo da Oficina
- Registo de novos clientes.
- Registo de novos veículos.
- Agendamento de serviços (com seleção de data, hora e tipo de serviço).
- Atualização do estado de confirmação dos agendamentos.
- Comunicação com os clientes (confirmações, lembretes e notificações).
- Consulta e gestão do histórico de serviços de cada veículo.

#### Mecânico
- Consulta dos serviços agendados.
- Consulta dos dados dos veículos.
- Registo de serviços realizados.
- Marcação de ações recomendadas com descrição e estado.
- Consulta do histórico de serviços e ações associadas aos veículos.

> **Nota:** Os clientes **não terão acesso direto ao sistema**. A comunicação com os mesmos será feita através de notificações geradas pelo sistema (por e-mail, SMS ou outro canal), com lembretes de agendamento e confirmações de serviço.

---

| [< Previous](REI01.md) | [^ Main](../../README.md) | [Next >](REI03.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
