# C2 : Esquema Conceptual

## Introdução

<img src="../img/REBD_new.png" alt="EA Model" width="1200" />

> Modelo Entidade-Associação do sistema de gestão de oficina mecânica. [*desenvolvido com DiaPortable*]

---

## Entidades e Associações

### Cliente
A entidade **Cliente** representa os indivíduos que contratam os serviços da oficina. Cada cliente possui um identificador único (`id`) e é caracterizado por atributos como `nome`, `telefone` e `email`. Cada cliente pode possuir vários veículos.

### Veículo
A entidade **Veículo** representa os automóveis registados na oficina. Os atributos incluem `id`, `matricula`, `marca`, `modelo`, `ano`, `km` e `vin`. Cada veículo pertence exclusivamente a um cliente.

### Serviço
A entidade **Serviço** define os tipos de serviços que a oficina oferece. Cada serviço tem um `id`, uma descrição (`tipo`) e um `preco` associado. Esta entidade é usada como referência nos agendamentos e nos registos de histórico.

### Agendamento
A entidade **Agendamento** representa a marcação de um serviço para um determinado veículo. Inclui `id`, `data`, `hora` e `status`, além das referências ao veículo e ao serviço agendado.

### Histórico
A entidade **Histórico** regista a execução efetiva de serviços previamente agendados. Inclui `id`, `notas`, e chaves estrangeiras que referem `agendamentoId`, `veiculoId` e `servicoId`.

### Inclui
Associação **Inclui** entre agendamentos e serviços, com indicação se o serviço foi recomendado `recomendados`, executado `executado` ou ainda está pendente `pendente`.

---

## Regras de Negócio Adicionais (Restrições)

As seguintes regras de negócio foram identificadas como necessárias à integridade do sistema, mas não são diretamente representáveis no modelo E/A:

- Um veículo não pode ter mais do que um serviço agendado na mesma data e hora.
- Não é permitido eliminar registos de histórico de serviços – o histórico deve ser permanente.
- As ações recomendadas devem estar sempre associadas a um veículo e conter uma descrição e um estado (pendente ou concluída).
- Cada serviço realizado deve constar obrigatoriamente no histórico de veículo.
- Um agendamento só pode existir se houver um veículo associado previamente registado.
- O status de confirmação de um agendamento deve ser atualizado antes da data do serviço.

---

| [< Previous](REBD01.md) | [^ Main](../../README.md) | [Next >](REBD03.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
