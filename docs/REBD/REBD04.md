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

### Servico
| Atributo     | Tipo                                     | Restrições                        |
|--------------|------------------------------------------|-----------------------------------|
| id_servico   | INT                                      | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| tipo         | ENUM('Revisão', 'Troca de Óleo', 'Inspeção', 'Outro') | NOT NULL                          |
| preco        | DECIMAL(10,2)                            | NOT NULL                          |

### Agendamento
| Atributo            | Tipo                               | Restrições                        |
|---------------------|------------------------------------|-----------------------------------|
| id_agendamento      | INT                                | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| data                | DATE                               | NOT NULL                          |
| hora                | TIME                               | NOT NULL                          |
| status_confirmacao  | ENUM('Pendente', 'Confirmado', 'Cancelado') | NOT NULL                          |
| id_veiculo          | INT                                | FOREIGN KEY REFERENCES Veiculo(id_veiculo), NOT NULL |
| id_servico          | INT                                | FOREIGN KEY REFERENCES Servico(id_servico), NOT NULL |

### Historico
| Atributo        | Tipo        | Restrições                        |
|-----------------|-------------|-----------------------------------|
| id_historico    | INT         | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| notas           | TEXT        | NULL                              |
| id_agendamento  | INT         | FOREIGN KEY REFERENCES Agendamento(id_agendamento), NOT NULL |
| id_veiculo      | INT         | FOREIGN KEY REFERENCES Veiculo(id_veiculo), NOT NULL |
| id_servico      | INT         | FOREIGN KEY REFERENCES Servico(id_servico), NOT NULL |

### Acao_Recomendada
| Atributo     | Tipo                              | Restrições                        |
|--------------|-----------------------------------|-----------------------------------|
| id_acao      | INT                               | PRIMARY KEY, AUTO_INCREMENT, NOT NULL |
| descricao    | TEXT                              | NOT NULL                          |
| data         | DATE                              | NOT NULL                          |
| status       | ENUM('Pendente', 'Concluída')     | NOT NULL                          |
| id_veiculo   | INT                               | FOREIGN KEY REFERENCES Veiculo(id_veiculo), NOT NULL |

---

## Vistas

_(Inserir a descrição e estrutura das vista, caso existam.)_

---

| [< Previous](REBD03.md) | [^ Main](../../README.md) | [Next >](REBD05.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
