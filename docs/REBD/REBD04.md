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
