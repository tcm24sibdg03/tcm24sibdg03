# C5 : SQL (DDL & DML)

---

## DDL

```sql
CREATE DATABASE IF NOT EXISTS autoshop;
USE `autoshop`;

DROP TABLE IF EXISTS `Historico`;
DROP TABLE IF EXISTS `Inclui`;
DROP TABLE IF EXISTS `Agendamento`;
DROP TABLE IF EXISTS `Veiculo`;
DROP TABLE IF EXISTS `Cliente`;
DROP TABLE IF EXISTS `Servico`;

CREATE TABLE IF NOT EXISTS `Cliente` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `nome` VARCHAR(100) NOT NULL,
   `telefone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Veiculo` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `matricula` VARCHAR(15) NOT NULL UNIQUE,
   `marca` VARCHAR(50) NOT NULL,
   `modelo` VARCHAR(50) NOT NULL,
   `ano` YEAR NOT NULL,
   `km` INT NOT NULL,
   `vin` VARCHAR(30) NOT NULL UNIQUE,
   `clienteId` INT NOT NULL,
   FOREIGN KEY (`clienteId`) REFERENCES `Cliente`(`id`)
);

CREATE TABLE IF NOT EXISTS `Servico` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `tipo` VARCHAR(100) NOT NULL,
   `preco` DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Agendamento` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `data` DATE NOT NULL,
   `hora` TIME NOT NULL,
   `status` ENUM('Pendente', 'Confirmado', 'Cancelado') NOT NULL,
   `veiculoId` INT NOT NULL,
   `servicoId` INT NOT NULL,
   FOREIGN KEY (`veiculoId`) REFERENCES `Veiculo`(`id`),
   FOREIGN KEY (`servicoId`) REFERENCES `Servico`(`id`)
);

CREATE TABLE IF NOT EXISTS `Historico` (
   `id` INT AUTO_INCREMENT PRIMARY KEY,
   `notas` TEXT,
   `agendamentoId` INT NOT NULL,
   `veiculoId` INT NOT NULL,
   `servicoId` INT NOT NULL,
   FOREIGN KEY (`agendamentoId`) REFERENCES `Agendamento`(`id`),
   FOREIGN KEY (`veiculoId`) REFERENCES `Veiculo`(`id`),
   FOREIGN KEY (`servicoId`) REFERENCES `Servico`(`id`)
);

CREATE TABLE IF NOT EXISTS `Inclui` (
  `agendamentoId` INT NOT NULL,
  `servicoId` INT NOT NULL,
  `recomendado` BOOLEAN DEFAULT FALSE,
  `executado` BOOLEAN DEFAULT FALSE,
  `pendente` BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (agendamentoId, servicoId),
  FOREIGN KEY (agendamentoId) REFERENCES Agendamento(id),
  FOREIGN KEY (servicoId) REFERENCES Servico(id)
);
```

---

## DML

### Inserts (exemplos)
```sql
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cristiano Ronaldo', '912345678', 'cr7@mail.com');

INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('BI-34-MV', 'VW', 'Sirocco', 2010, 200000, 'W1234567890ABC123', 1);

INSERT INTO Servico (tipo, preco)
VALUES ('Revisão', 59.90);

INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-05-22', '09:30:00', 'Confirmado', 1, 1);

INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Substituição do filtro de ar incluída.', 1, 1, 1);

INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (1, 2, TRUE, FALSE, TRUE);
```

### Consultas (exemplos)
```sql
-- Ver agendamentos com status confirmado para uma determinada data
SELECT * FROM Agendamento
WHERE data = '2025-05-22' AND status = 'Confirmado';

-- Ver o histórico de serviços de um cliente
SELECT h.*, s.tipo, v.marca, v.modelo
FROM Historico h
JOIN Servico s ON h.servicoId = s.Id
JOIN Veiculo v ON h.veiculoId = v.Id
WHERE v.clienteId = 1;

```

---

| [< Previous](RPF04.md) | [^ Main](../../README.md) | [Next >](RPF06.md) |
|:----------------------------------:|:----------------------------------:|:----------------------------------:|
