# C3 : Normalização

---

## Relações derivadas do modelo EA

Com base no modelo entidade-associação e no REI, derivam-se as seguintes relações:

**Cliente**(id_cliente PK, nome, telefone, email)

**Veiculo**(id_veiculo PK, matricula, marca, modelo, ano, km, vin, #id_cliente → Cliente)

**Servico**(id_servico PK, tipo_servico, preco)

**Agendamento**(id_agendamento PK, data, hora, status_confirmacao, #id_veiculo → Veiculo, #id_servico → Servico)

**Historico**(id_historico PK, notas, #id_veiculo → Veiculo, #id_servico → Servico, #id_agendamento → Agendamento)

**Acao_Recomendada**(id_acao PK, descricao, data, status, #id_veiculo → Veiculo)

---

| [< Previous](REBD02.md) | [^ Main](../../README.md) | [Next >](REBD04.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
