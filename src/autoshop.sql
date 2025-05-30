-- tcm24sibdg03

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
   `tipo` ENUM('Revisão', 'Troca de Óleo', 'Inspeção', 'Outro') NOT NULL,
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

-- Inserts Cliente
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 1', '912345671', 'cliente1@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 2', '912345672', 'cliente2@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 3', '912345673', 'cliente3@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 4', '912345674', 'cliente4@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 5', '912345675', 'cliente5@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 6', '912345676', 'cliente6@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 7', '912345677', 'cliente7@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 8', '912345678', 'cliente8@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 9', '912345679', 'cliente9@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 10', '912345670', 'cliente10@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 11', '912345671', 'cliente11@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 12', '912345672', 'cliente12@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 13', '912345673', 'cliente13@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 14', '912345674', 'cliente14@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 15', '912345675', 'cliente15@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 16', '912345676', 'cliente16@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 17', '912345677', 'cliente17@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 18', '912345678', 'cliente18@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 19', '912345679', 'cliente19@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 20', '912345670', 'cliente20@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 21', '912345671', 'cliente21@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 22', '912345672', 'cliente22@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 23', '912345673', 'cliente23@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 24', '912345674', 'cliente24@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 25', '912345675', 'cliente25@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 26', '912345676', 'cliente26@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 27', '912345677', 'cliente27@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 28', '912345678', 'cliente28@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 29', '912345679', 'cliente29@email.com');
INSERT INTO Cliente (nome, telefone, email)
VALUES ('Cliente 30', '912345670', 'cliente30@email.com');

-- Inserts Veiculo
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-01-ZZ', 'Marca1', 'Modelo1', 2011, 198269, 'VIN00001', 2);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-02-ZZ', 'Marca2', 'Modelo2', 2012, 14095, 'VIN00002', 3);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-03-ZZ', 'Marca3', 'Modelo3', 2013, 94323, 'VIN00003', 4);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-04-ZZ', 'Marca4', 'Modelo4', 2014, 104052, 'VIN00004', 5);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-05-ZZ', 'Marca0', 'Modelo5', 2015, 73230, 'VIN00005', 6);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-06-ZZ', 'Marca1', 'Modelo6', 2016, 108981, 'VIN00006', 7);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-07-ZZ', 'Marca2', 'Modelo7', 2017, 41786, 'VIN00007', 8);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-08-ZZ', 'Marca3', 'Modelo8', 2018, 193023, 'VIN00008', 9);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-09-ZZ', 'Marca4', 'Modelo9', 2019, 75199, 'VIN00009', 10);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-10-ZZ', 'Marca0', 'Modelo0', 2020, 136384, 'VIN00010', 11);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-11-ZZ', 'Marca1', 'Modelo1', 2021, 114140, 'VIN00011', 12);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-12-ZZ', 'Marca2', 'Modelo2', 2022, 65440, 'VIN00012', 13);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-13-ZZ', 'Marca3', 'Modelo3', 2023, 23638, 'VIN00013', 14);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-14-ZZ', 'Marca4', 'Modelo4', 2024, 127595, 'VIN00014', 15);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-15-ZZ', 'Marca0', 'Modelo5', 2010, 94070, 'VIN00015', 16);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-16-ZZ', 'Marca1', 'Modelo6', 2011, 167940, 'VIN00016', 17);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-17-ZZ', 'Marca2', 'Modelo7', 2012, 190794, 'VIN00017', 18);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-18-ZZ', 'Marca3', 'Modelo8', 2013, 111258, 'VIN00018', 19);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-19-ZZ', 'Marca4', 'Modelo9', 2014, 191955, 'VIN00019', 20);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-20-ZZ', 'Marca0', 'Modelo0', 2015, 74025, 'VIN00020', 21);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-21-ZZ', 'Marca1', 'Modelo1', 2016, 100603, 'VIN00021', 22);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-22-ZZ', 'Marca2', 'Modelo2', 2017, 16037, 'VIN00022', 23);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-23-ZZ', 'Marca3', 'Modelo3', 2018, 74409, 'VIN00023', 24);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-24-ZZ', 'Marca4', 'Modelo4', 2019, 121682, 'VIN00024', 25);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-25-ZZ', 'Marca0', 'Modelo5', 2020, 194621, 'VIN00025', 26);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-26-ZZ', 'Marca1', 'Modelo6', 2021, 167297, 'VIN00026', 27);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-27-ZZ', 'Marca2', 'Modelo7', 2022, 105135, 'VIN00027', 28);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-28-ZZ', 'Marca3', 'Modelo8', 2023, 164678, 'VIN00028', 29);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-29-ZZ', 'Marca4', 'Modelo9', 2024, 27608, 'VIN00029', 30);
INSERT INTO Veiculo (matricula, marca, modelo, ano, km, vin, clienteId)
VALUES ('AA-30-ZZ', 'Marca0', 'Modelo0', 2010, 16589, 'VIN00030', 1);

-- Inserts Servico
INSERT INTO Servico (tipo, preco)
VALUES ('Revisão', 60);
INSERT INTO Servico (tipo, preco)
VALUES ('Troca de Óleo', 70);
INSERT INTO Servico (tipo, preco)
VALUES ('Inspeção', 80);
INSERT INTO Servico (tipo, preco)
VALUES ('Outro', 90);

-- Inserts Agendamento
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-05-28', '9:00:00', 'Cancelado', 2, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-05-29', '10:00:00', 'Cancelado', 3, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-05-30', '11:00:00', 'Cancelado', 4, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-05-31', '12:00:00', 'Pendente', 5, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-01', '13:00:00', 'Cancelado', 6, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-02', '14:00:00', 'Confirmado', 7, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-03', '15:00:00', 'Cancelado', 8, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-04', '16:00:00', 'Pendente', 9, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-05', '17:00:00', 'Pendente', 10, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-06', '8:00:00', 'Pendente', 11, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-07', '9:00:00', 'Pendente', 12, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-08', '10:00:00', 'Confirmado', 13, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-09', '11:00:00', 'Pendente', 14, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-10', '12:00:00', 'Pendente', 15, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-11', '13:00:00', 'Cancelado', 16, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-12', '14:00:00', 'Cancelado', 17, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-13', '15:00:00', 'Confirmado', 18, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-14', '16:00:00', 'Cancelado', 19, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-15', '17:00:00', 'Pendente', 20, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-16', '8:00:00', 'Cancelado', 21, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-17', '9:00:00', 'Pendente', 22, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-18', '10:00:00', 'Cancelado', 23, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-19', '11:00:00', 'Pendente', 24, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-20', '12:00:00', 'Confirmado', 25, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-21', '13:00:00', 'Confirmado', 26, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-22', '14:00:00', 'Pendente', 27, 3);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-23', '15:00:00', 'Cancelado', 28, 4);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-24', '16:00:00', 'Pendente', 29, 1);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-25', '17:00:00', 'Confirmado', 30, 2);
INSERT INTO Agendamento (data, hora, status, veiculoId, servicoId)
VALUES ('2025-06-26', '8:00:00', 'Confirmado', 1, 3);

-- Inserts Historico
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 1', 2, 2, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 2', 3, 3, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 3', 4, 4, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 4', 5, 5, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 5', 6, 6, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 6', 7, 7, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 7', 8, 8, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 8', 9, 9, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 9', 10, 10, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 10', 11, 11, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 11', 12, 12, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 12', 13, 13, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 13', 14, 14, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 14', 15, 15, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 15', 16, 16, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 16', 17, 17, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 17', 18, 18, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 18', 19, 19, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 19', 20, 20, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 20', 21, 21, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 21', 22, 22, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 22', 23, 23, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 23', 24, 24, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 24', 25, 25, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 25', 26, 26, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 26', 27, 27, 3);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 27', 28, 28, 4);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 28', 29, 29, 1);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 29', 30, 30, 2);
INSERT INTO Historico (notas, agendamentoId, veiculoId, servicoId)
VALUES ('Nota do histórico 30', 1, 1, 3);

-- Inserts Inclui
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (1, 2, FALSE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (2, 3, TRUE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (3, 4, FALSE, TRUE, FALSE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (4, 1, TRUE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (5, 2, FALSE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (6, 3, TRUE, TRUE, FALSE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (7, 4, FALSE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (8, 1, TRUE, FALSE, TRUE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (9, 2, FALSE, TRUE, FALSE);
INSERT INTO Inclui (agendamentoId, servicoId, recomendado, executado, pendente)
VALUES (10, 3, TRUE, FALSE, TRUE);

-- Vistas

-- veiculos com servicos

CREATE VIEW veiculos_com_servicos AS
SELECT v.Id, v.matricula, v.marca, v.modelo, s.tipo AS servico, a.data, a.status
FROM Veiculo v
JOIN Agendamento a ON v.Id = a.veiculoId
JOIN Servico s ON a.servicoId = s.Id;

-- vista_historico_veiculo

CREATE VIEW vista_historico_veiculo AS
SELECT
    v.matricula,
    s.tipo,
    h.notas,
    h.Id
FROM Historico h
JOIN Veiculo v ON h.veiculoId = v.Id
JOIN Servico s ON h.servicoId = s.Id;

-- agendamentos_futuros

CREATE VIEW agendamentos_futuros AS
SELECT 
    a.id,
    a.data,
    a.hora,
    a.status,
    c.nome AS cliente,
    v.marca,
    v.modelo,
    s.tipo AS tipo_servico,
    s.preco
FROM Agendamento a
JOIN Veiculo v ON a.veiculoId = v.Id
JOIN Cliente c ON v.clienteId = c.Id
JOIN Servico s ON a.servicoId = s.Id
WHERE a.data >= CURDATE();