-- tcm24sibdg03

CREATE DATABASE IF NOT EXISTS autoshop;
USE `autoshop`;

DROP TABLE IF EXISTS `Historico`;
DROP TABLE IF EXISTS `Acao_Recomendada`;
DROP TABLE IF EXISTS `Agendamento`;
DROP TABLE IF EXISTS `Veiculo`;
DROP TABLE IF EXISTS `Cliente`;
DROP TABLE IF EXISTS `Servico`;

DROP VIEW IF EXISTS agendamentos_futuros;
DROP VIEW IF EXISTS vista_historico_veiculo;

CREATE TABLE IF NOT EXISTS `Cliente` (
   `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
   `nome` VARCHAR(100) NOT NULL,
   `telefone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Veiculo` (
   `id_veiculo` INT AUTO_INCREMENT PRIMARY KEY,
   `matricula` VARCHAR(15) NOT NULL UNIQUE,
   `marca` VARCHAR(50) NOT NULL,
   `modelo` VARCHAR(50) NOT NULL,
   `ano` YEAR NOT NULL,
   `km` INT NOT NULL,
   `vin` VARCHAR(30) NOT NULL UNIQUE,
   `id_cliente` INT NOT NULL,
   FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`)
);

CREATE TABLE IF NOT EXISTS `Servico` (
   `id_servico` INT AUTO_INCREMENT PRIMARY KEY,
   `tipo` ENUM('Revisão', 'Troca de Óleo', 'Inspeção', 'Outro') NOT NULL,
   `preco` DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Agendamento` (
   `id_agendamento` INT AUTO_INCREMENT PRIMARY KEY,
   `data` DATE NOT NULL,
   `hora` TIME NOT NULL,
   `status_confirmacao` ENUM('Pendente', 'Confirmado', 'Cancelado') NOT NULL,
   `id_veiculo` INT NOT NULL,
   `id_servico` INT NOT NULL,
   FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`),
   FOREIGN KEY (`id_servico`) REFERENCES `Servico`(`id_servico`)
);

CREATE TABLE IF NOT EXISTS `Historico` (
   `id_historico` INT AUTO_INCREMENT PRIMARY KEY,
   `notas` TEXT,
   `id_agendamento` INT NOT NULL,
   `id_veiculo` INT NOT NULL,
   `id_servico` INT NOT NULL,
   FOREIGN KEY (`id_agendamento`) REFERENCES `Agendamento`(`id_agendamento`),
   FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`),
   FOREIGN KEY (`id_servico`) REFERENCES `Servico`(`id_servico`)
);

CREATE TABLE IF NOT EXISTS `Acao_Recomendada` (
   `id_acao` INT AUTO_INCREMENT PRIMARY KEY,
   `descricao` TEXT NOT NULL,
   `data` DATE NOT NULL,
   `status` ENUM('Pendente', 'Concluída') NOT NULL,
   `id_veiculo` INT NOT NULL,
   FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`)
);

-- Inserts

INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cristiano Ronaldo', '912345678', 'cr7@mail.com');

INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, id_cliente)
VALUES ('BI-34-MV', 'VW', 'Sirocco', 2010, 200000, 'W1234567890ABC123', 1);

INSERT INTO Servico (tipo, preco)
VALUES ('Revisão', 59.90);

INSERT INTO Agendamento (data, hora, status_confirmacao, id_veiculo, id_servico)
VALUES ('2025-05-22', '09:30:00', 'Confirmado', 1, 1);

INSERT INTO Historico (notas, id_agendamento, id_veiculo, id_servico)
VALUES ('Substituição do filtro de ar incluída.', 1, 1, 1);

INSERT INTO Acao_Recomendada (descricao, data, status, id_veiculo)
VALUES ('Trocar pastilhas de travão', '2025-05-22', 'Pendente', 1);

-- Consultas

-- Ver agendamentos com status confirmado para uma determinada data
SELECT * FROM Agendamento
WHERE data = '2025-05-22' AND status_confirmacao = 'Confirmado';

-- Ver o histórico de serviços de um cliente
SELECT h.*, s.tipo, v.marca, v.modelo
FROM Historico h
JOIN Servico s ON h.id_servico = s.id_servico
JOIN Veiculo v ON h.id_veiculo = v.id_veiculo
WHERE v.id_cliente = 1;

-- Ver todas as ações recomendadas com status pendente
SELECT * FROM Acao_Recomendada
WHERE status = 'Pendente';

-- Vistas

CREATE VIEW agendamentos_futuros AS
SELECT 
    a.id_agendamento,
    a.data,
    a.hora,
    a.status_confirmacao,
    c.nome AS cliente,
    v.marca,
    v.modelo,
    s.tipo AS tipo_servico,
    s.preco
FROM Agendamento a
JOIN Veiculo v ON a.id_veiculo = v.id_veiculo
JOIN Cliente c ON v.id_cliente = c.id_cliente
JOIN Servico s ON a.id_servico = s.id_servico
WHERE a.data >= CURDATE();

CREATE VIEW vista_historico_veiculo AS
SELECT
    v.matricula,
    s.tipo,
    h.notas,
    h.id_historico
FROM Historico h
JOIN Veiculo v ON h.id_veiculo = v.id_veiculo
JOIN Servico s ON h.id_servico = s.id_servico;