# C4 : Esquema Relacional

---

## Tabelas

- [Relações](#relações)
  - [Tabela_a](#tabela_a)
  - [Tabela_b](#tabela_b)
- [Vistas](#vistas)

## Relações

### Tabela_a

#### DESCRIÇÃO

Descrição da Tabela A

#### COLUNAS

| Nome     | Descrição                 | Domínio     | por Omissão | Automático | Nulo |
| :------- | :------------------------ | :---------- | :---------- | :--------- | :--- |
| id       | identificador da tabela A | BIGINT      | -           | Sim        | Não  |
| data     | Data do registo           | DATE        | now()       | Não        | Não  |
| nome     | Nome do registo           | VARCHAR(50) | -           | Não        | Não  |
| conteudo | Conteudo do documento     | TEXT        | -           | Não        | Sim  |
| tipo     | tipo de testes            | BIGINT      | -           | Não        | Sim  |

#### RESTRIÇÕES DE INTEGRIDADE

- **Chave Primária**: 

| Coluna(s) |
| --------- |
| id        |

- **Unicidade** (valores únicos)*:

| Nome        | Coluna(s) | Indexar |
| ----------- | --------- | ------- |
| nome_unique | nome      | Sim     |

- **Referêncial** (chaves estrangeiras)*:

| Nome  | Coluna(s) | Tabela referênciada | Coluna(s) referênciada(s) | Indexar |
| ----- | --------- | ------------------- | ------------------------- | ------- |
| ta_fk | tipo      | Tabela_c            | id                        | Não     |

- **Atributos** (check)*:

| Nome | Coluna(s) | condição |
| ---- | --------- | -------- |
|      |           |          |

- **Outros Indices***:

| Nome | Coluna(s) |
| ---- | --------- |
|      |           |

  *Remover se não existir.

### Tabela_b

#### DESCRIÇÃO

Descrição da Tabela B

#### COLUNAS

| Nome     | Descrição                 | Domínio     | por Omissão | Automático | Nulo |
| :------- | :------------------------ | :---------- | :---------- | :--------- | :--- |
| id       | identificador da tabela A | BIGINT      | -           | Sim        | Não  |
| data     | Data do registo           | DATE        | now()       | Não        | Não  |
| nome     | Nome do registo           | VARCHAR(50) | -           | Não        | Não  |
| conteudo | Conteudo do documento     | TEXT        | -           | Não        | Sim  |
| tipo     | tipo de testes            | BIGINT      | -           | Não        | Sim  |

#### RESTRIÇÕES DE INTEGRIDADE

- **Chave Primária**: 

| Coluna(s) |
| --------- |
| id        |

- **Unicidade** (valores únicos)*:

| Nome        | Coluna(s) | Indexar |
| ----------- | --------- | ------- |
| nome_unique | nome      | Sim     |

- **Referêncial** (chaves estrangeiras)*:

| Nome  | Coluna(s) | Tabela referênciada | Coluna(s) referênciada(s) | Indexar |
| ----- | --------- | ------------------- | ------------------------- | ------- |
| ta_fk | tipo      | Tabela_c            | id                        | Não     |

- **Atributos** (check)*:

| Nome | Coluna(s) | condição |
| ---- | --------- | -------- |
|      |           |          |

- **Outros Indices***:

| Nome | Coluna(s) |
| ---- | --------- |
|      |           |

  *Remover se não existir.

## Vistas

_(Inserir a descrição e estrutura das vista, caso existam.)_

---

| [< Previous](REBD03.md) | [^ Main](../../README.md) | [Next >](REBD05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
