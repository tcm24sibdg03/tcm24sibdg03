# C4 : Esquema Relacional

---

## Tabelas

### Cliente
| Atributo     | Tipo          | Restrições                        |
|--------------|---------------|-----------------------------------|
| id_cliente   | INT           | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| nome         | VARCHAR(100)  | NOT NULL                          |
| telefone     | VARCHAR(15)   | NOT NULL                          |
| email        | VARCHAR(100)  | NOT NULL                          |

### Veiculo
| Atributo        | Tipo          | Restrições                        |
|-----------------|---------------|-----------------------------------|
| id_veiculo      | INT           | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| matricula       | VARCHAR(15)   | UNIQUE, NOT NULL                  |
| marca           | VARCHAR(50)   | NOT NULL                          |
| modelo          | VARCHAR(50)   | NOT NULL                          |
| ano             | YEAR          | NOT NULL                          |
| km              | INT           | NOT NULL                          |
| vin             | VARCHAR(30)   | UNIQUE, NOT NULL                  |
| id_cliente      | INT           | FOREIGN KEY REFERENCES Cliente(id_cliente), NOT NULL |



## Vistas

_(Inserir a descrição e estrutura das vista, caso existam.)_

---

| [< Previous](REBD03.md) | [^ Main](../../README.md) | [Next >](REBD05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
