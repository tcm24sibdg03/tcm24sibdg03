# C4 : Esquema Relacional

---

## Tabelas

### Cliente

Regista os clientes da oficina, incluindo os seus dados de contacto.

| Nome        | Descrição               | Domínio                          | Por Omissão | Automático | Nulo |
|-------------|--------------------------|-----------------------------------|--------------|-------------|------|
| id_cliente  | Identificador do cliente | INT, PRIMARY KEY, AUTO_INCREMENT | -            | Sim         | Não  |
| nome        | Nome do cliente          | VARCHAR(100) NOT NULL            | -            | Não         | Não  |
| telefone    | Número de telefone       | VARCHAR(15) NOT NULL             | -            | Não         | Não  |
| email       | Email de contacto        | VARCHAR(100) NOT NULL            | -            | Não         | Não  |

---

### Veiculo

Contém os veículos registados na oficina, associados a um cliente.

| Nome        | Descrição                       | Domínio                                             | Por Omissão | Automático | Nulo |
|-------------|----------------------------------|------------------------------------------------------|--------------|-------------|------|
| id_veiculo  | Identificador do veículo         | INT, PRIMARY KEY, AUTO_INCREMENT                     | -            | Sim         | Não  |
| matricula   | Matrícula do veículo             | VARCHAR(15) UNIQUE NOT NULL                          | -            | Não         | Não  |
| marca       | Marca do veículo                 | VARCHAR(50) NOT NULL                                 | -            | Não         | Não  |
| modelo      | Modelo do veículo                | VARCHAR(50) NOT NULL                                 | -            | Não         | Não  |
| ano         | Ano de fabrico                   | YEAR NOT NULL                                        | -            | Não         | Não  |
| km          | Quilometragem atual              | INT NOT NULL                                         | -            | Não         | Não  |
| vin         | Número de identificação do veículo | VARCHAR(30) UNIQUE NOT NULL                        | -            | Não         | Não  |
| id_cliente  | Referência ao dono (cliente)     | INT, FOREIGN KEY → Cliente(id_cliente) NOT NULL     | -            | Não         | Não  |

---


## Vistas

### vista_historico_veiculo
Histórico completo de um veículo com tipo de serviço e observações.

```sql
CREATE VIEW vista_historico_veiculo AS
SELECT
    v.matricula
    s.tipo
    h.notas
    h.id_historico
FROM Historico h
JOIN Veiculo v ON h.id_veiculo = v.id_veiculo
JOIN Servico s ON h.id_servico = s.id_servico;
```

---

| [< Previous](REBD03.md) | [^ Main](../../README.md) | [Next >](REBD05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
