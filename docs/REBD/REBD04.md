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

### agendamentos_futuros
Consultar todos os agendamentos futuros, juntamente com os dados do cliente, veículo e serviço.

```sql
CREATE VIEW agendamentos_futuros AS
SELECT 
    a.id,
    a.data,
    a.hora,
    a.status,
    c.nome AS cliente,
    v.marca,
    v.modelo,
    s.tipo AS tipo_servico,
    s.preco
FROM Agendamento a
JOIN Veiculo v ON a.veiculoId = v.Id
JOIN Cliente c ON v.clienteId = c.Id
JOIN Servico s ON a.servicoId = s.Id
WHERE a.data >= CURDATE();
```

### vista_historico_veiculo
Histórico completo de um veículo com tipo de serviço e observações.

```sql
CREATE VIEW vista_historico_veiculo AS
SELECT
    v.matricula,
    s.tipo,
    h.notas,
    h.Id
FROM Historico h
JOIN Veiculo v ON h.veiculoId = v.Id
JOIN Servico s ON h.servicoId = s.Id;
```

---

| [< Previous](REBD03.md) | [^ Main](../../README.md) | [Next >](REBD05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
