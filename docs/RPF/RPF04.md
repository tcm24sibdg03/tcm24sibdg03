# C4 : Esquema Relacional

---

## Tabelas

### Cliente

Regista os clientes da oficina, incluindo os seus dados de contacto.

| Nome        | Descrição               | Domínio                          | Por Omissão | Automático | Nulo |
|-------------|--------------------------|-----------------------------------|--------------|-------------|------|
| id  | Identificador do cliente | INT, PRIMARY KEY, AUTO_INCREMENT | -            | Sim         | Não  |
| nome        | Nome do cliente          | VARCHAR(100) NOT NULL            | -            | Não         | Não  |
| telefone    | Número de telefone       | VARCHAR(15) NOT NULL             | -            | Não         | Não  |
| email       | Email de contacto        | VARCHAR(100) NOT NULL            | -            | Não         | Não  |

---

### Veiculo

Contém os veículos registados na oficina, associados a um cliente.

| Nome        | Descrição                       | Domínio                                             | Por Omissão | Automático | Nulo |
|-------------|----------------------------------|------------------------------------------------------|--------------|-------------|------|
| id  | Identificador do veículo         | INT, PRIMARY KEY, AUTO_INCREMENT                     | -            | Sim         | Não  |
| matricula   | Matrícula do veículo             | VARCHAR(15) UNIQUE NOT NULL                          | -            | Não         | Não  |
| marca       | Marca do veículo                 | VARCHAR(50) NOT NULL                                 | -            | Não         | Não  |
| modelo      | Modelo do veículo                | VARCHAR(50) NOT NULL                                 | -            | Não         | Não  |
| ano         | Ano de fabrico                   | YEAR NOT NULL                                        | -            | Não         | Não  |
| km          | Quilometragem atual              | INT NOT NULL                                         | -            | Não         | Não  |
| vin         | Número de identificação do veículo | VARCHAR(30) UNIQUE NOT NULL                        | -            | Não         | Não  |
| id_cliente  | Referência ao dono (cliente)     | INT, FOREIGN KEY → Cliente(id_cliente) NOT NULL     | -            | Não         | Não  |

---

### Servico

Lista os tipos de serviços oferecidos pela oficina.

| Nome        | Descrição              | Domínio                              | Por Omissão | Automático | Nulo |
|-------------|-------------------------|---------------------------------------|--------------|-------------|------|
| id  | Identificador do serviço| INT, PRIMARY KEY, AUTO_INCREMENT     | -            | Sim         | Não  |
| tipo        | Tipo de serviço         | VARCHAR(100) NOT NULL                | -            | Não         | Não  |
| preco       | Preço base do serviço   | DECIMAL(10,2) NOT NULL               | -            | Não         | Não  |

---

### Agendamento

Marcações feitas para serviços a serem realizados.

| Nome               | Descrição                         | Domínio                                          | Por Omissão | Automático | Nulo |
|--------------------|------------------------------------|--------------------------------------------------|--------------|-------------|------|
| id_agendamento     | Identificador da marcação          | INT, PRIMARY KEY, AUTO_INCREMENT                | -            | Sim         | Não  |
| data               | Data da marcação                   | DATE NOT NULL                                   | CURRENT_DATE ()            | Não         | Não  |
| hora               | Hora da marcação                   | TIME NOT NULL                                   | CURRENT_TIME ()          | Não         | Não  |
| status | Estado da marcação (confirmado?)   | VARCHAR(20) NOT NULL                            | -            | Não         | Não  |
| id_veiculo         | Veículo a ser intervencionado      | INT, FOREIGN KEY → Veiculo(id_veiculo) NOT NULL | -            | Não         | Não  |
| id_servico         | Serviço a ser realizado            | INT, FOREIGN KEY → Servico(id_servico) NOT NULL | -            | Não         | Não  |

> **Nota:** Embora o campo `servicoId` esteja presente na estrutura relacional original para facilitar a compreensão e ligação direta em consultas simples, a implementação prática da API segue um modelo mais flexível, utilizando uma tabela de relação (Inclui) que permite associar múltiplos serviços a um único agendamento, com estados distintos. Esta decisão reflete melhor as necessidades reais do domínio e a escalabilidade do sistema.

---

### Histórico

Registos históricos de serviços executados, com possíveis anotações.

| Nome         | Descrição                       | Domínio                                               | Por Omissão | Automático | Nulo |
|--------------|----------------------------------|--------------------------------------------------------|--------------|-------------|------|
| id_historico | Identificador do registo         | INT, PRIMARY KEY, AUTO_INCREMENT                      | -            | Sim         | Não  |
| notas        | Observações sobre o serviço      | TEXT                                                  | -            | Não         | Sim  |
| id_agendamento | Referência à marcação anterior | INT, FOREIGN KEY → Agendamento(id_agendamento)       | -            | Não         | Não  |
| id_veiculo   | Veículo intervencionado          | INT, FOREIGN KEY → Veiculo(id_veiculo)               | -            | Não         | Não  |

---

### Inclui

Sugestões de intervenções futuras com data e estado planeado.

| Nome        | Descrição                       | Domínio                                        | Por Omissão | Automático | Nulo |
|-------------|----------------------------------|------------------------------------------------|--------------|-------------|------|
| agendamentoId     | Referência ao agendamento            | INT, FOREIGN KEY → Agendamento(id) NOT NULL          | -            | Não         | Não  |
| servicoId   | Referência ao serviço        | INT, FOREIGN KEY → Servico(id) NOT NULL                             | -            | Não         | Não  |
| recomendado        | Indica se o serviço foi recomendado                    | BOOLEAN NOT NULL                                 | FALSE            | Não         | Não  |
| executado      | Indica se o serviço foi executado           | BOOLEAN NOT NULL                          | FALSE            | Não         | Não  |
| pendente  | Indica se o serviço ainda está pendente               | BOOLEAN NOT NULL | TRUE          | Não         | Não  |

---

## Vista SQL

### vista_veiculos_com_agendamentos

```sql
CREATE VIEW veiculos_com_agendamentos_pendentes AS
SELECT 
  v.id,
  v.matricula,
  v.marca,
  v.modelo,
  s.tipo AS servico,
  a.data,
  a.status
FROM Veiculo v
JOIN Agendamento a ON v.id = a.veiculoId
JOIN Servico s ON a.servicoId = s.id
WHERE a.status = 'Pendente';
```

### vista_historico_veiculo
Histórico completo de um veículo com tipo de serviço e observações.

```sql
CREATE VIEW vista_historico_veiculo AS
SELECT
    v.matricula,
    a.status,
    h.notas,
    h.Id
FROM Historico h
JOIN Veiculo v ON h.veiculoId = v.id
JOIN Agendamento a ON h.agendamentoId = a.id;
```

---

| [< Previous](RPF03.md) | [^ Main](../../README.md) | [Next >](RPF05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
