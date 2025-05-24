# C5 : SQL (DDL & DML)

---

## DDL

```sql
USE `autoshop`;

DROP TABLE IF EXISTS `Cliente`;
DROP TABLE IF EXISTS `Veiculo`;
DROP TABLE IF EXISTS `Servico`;
DROP TABLE IF EXISTS `Agendamento`;
DROP TABLE IF EXISTS `Historico`;
DROP TABLE IF EXISTS `Acao_Recomendada`;

CREATE TABLE IF NOT EXISTS `Cliente` (
  `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL
) 

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
) 

CREATE TABLE IF NOT EXISTS `Servico` (
  `id_servico` INT AUTO_INCREMENT PRIMARY KEY,
  `tipo` ENUM('Revisão', 'Troca de Óleo', 'Inspeção', 'Outro') NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL
) 

CREATE TABLE IF NOT EXISTS `Agendamento` (
  `id_agendamento` INT AUTO_INCREMENT PRIMARY KEY,
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `status_confirmacao` ENUM('Pendente', 'Confirmado', 'Cancelado') NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_servico` INT NOT NULL,
  FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`),
  FOREIGN KEY (`id_servico`) REFERENCES `Servico`(`id_servico`)
) 

CREATE TABLE IF NOT EXISTS `Historico` (
  `id_historico` INT AUTO_INCREMENT PRIMARY KEY,
  `notas` TEXT,
  `id_agendamento` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_servico` INT NOT NULL,
  FOREIGN KEY (`id_agendamento`) REFERENCES `Agendamento`(`id_agendamento`),
  FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`),
  FOREIGN KEY (`id_servico`) REFERENCES `Servico`(`id_servico`)
) 

CREATE TABLE IF NOT EXISTS `Acao_Recomendada` (
  `id_acao` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao` TEXT NOT NULL,
  `data` DATE NOT NULL,
  `status` ENUM('Pendente', 'Concluída') NOT NULL,
  `id_veiculo` INT NOT NULL,
  FOREIGN KEY (`id_veiculo`) REFERENCES `Veiculo`(`id_veiculo`)
) 
```

---

## DML

---

| [< Previous](REBD04.md) | [^ Main](../../README.md) |
|:----------------------------------:|:----------------------------------:|
