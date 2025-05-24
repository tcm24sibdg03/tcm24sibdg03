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

## Normalização do Esquema Relacional

### 1FN - Primeira Forma Normal
Todas as relações estão na 1FN porque:
- Todos os atributos contêm valores atómicos.
- Não existem grupos repetitivos nem atributos multivalorados.

### 2FN - Segunda Forma Normal
- Todas as tabelas têm **chave primária simples**.
- Nenhum atributo não-chave depende de parte de uma chave composta (pois nenhuma tabela tem chave composta).
→ Portanto, todas as relações estão em 2FN.

### 3FN - Terceira Forma Normal
- Não há dependências transitivas nos esquemas.
- Todos os atributos não-chave dependem **unicamente da chave primária**.

---

| [< Previous](REBD02.md) | [^ Main](../../README.md) | [Next >](REBD04.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
