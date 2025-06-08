# C3 : Normalização

---

## Relações derivadas do modelo EA

Com base no modelo entidade-associação, derivam-se as seguintes relações:

**Cliente**(id_cliente PK, nome, telefone, email)
- **DF1:** id_cliente → nome, telefone, email

**Veiculo**(id_veiculo PK, matricula, marca, modelo, ano, km, vin, #id_cliente → Cliente)
- **DF2:** id_veiculo → matricula, marca, modelo, ano, km, vin, id_cliente

**Servico**(id_servico PK, tipo_servico, preco)
- **DF3:** id_servico → tipo_servico, preco

**Agendamento**(id_agendamento PK, data, hora, status_confirmacao, #id_veiculo → Veiculo, #id_servico → Servico)
- **DF4:** id_agendamento → data, hora, status_confirmacao, id_veiculo, id_servico

**Historico**(id_historico PK, notas, #id_veiculo → Veiculo, #id_agendamento → Agendamento)
- **DF5:** id_historico → notas, id_agendamento, id_veiculo, id_servico

**Inclui**(agendamentoId PK, servicoId PK, recomendado, executado, pendente, #agendamentoId → Agendamento, #servicoId → Servico)
- **DF6:** agendamentoId, servicoId → recomendado, executado, pendente

---

## Normalização do Esquema Relacional

### 1FN - Primeira Forma Normal
Todas as relações estão na 1FN porque:
- Todos os atributos contêm valores atómicos.
- Não existem grupos repetitivos nem atributos multivalorados.

### 2FN - Segunda Forma Normal
- Todas as tabelas têm **chave primária simples**.
- Nenhum atributo não-chave depende de parte de uma chave composta.
→ Portanto, todas as relações estão em 2FN.

### 3FN - Terceira Forma Normal
- Não há dependências transitivas nos esquemas.
- Todos os atributos não-chave dependem **unicamente da chave primária**.

Portanto, todas as relações estão em **3FN** e não há necessidade de aplicar BCNF neste caso.

---

| [< Previous](REBD02.md) | [^ Main](../../README.md) | [Next >](REBD04.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
