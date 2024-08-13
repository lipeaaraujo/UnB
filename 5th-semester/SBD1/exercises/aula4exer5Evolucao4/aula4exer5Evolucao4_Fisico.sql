-- 
-- -------- < aula4exer5Evolucao4 Físico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 03/07/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos, Felipe Amorim de Araújo e Isaque Santos
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao4;
USE aula4exer5Evolucao4;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT AUTO_INCREMENT,
    nomeEspecialidade VARCHAR(50) NOT NULL,
    PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MEDICO (
    codigo INT AUTO_INCREMENT,
    estado VARCHAR(2),
    nomeCompleto VARCHAR(60) NOT NULL,
    idEspecialidade INT,
    PRIMARY KEY (codigo, estado),
    FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade) 
        ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PACIENTE (
    idPaciente INT AUTO_INCREMENT,
    nomeCompleto VARCHAR(60) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    complemento VARCHAR(15),
    PRIMARY KEY (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TELEFONE (
    idPaciente INT,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (idPaciente, telefone),
    FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente) 
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE MEDICAMENTO (
    idMedicamento INT AUTO_INCREMENT,
    nomeMedicamento VARCHAR(30) NOT NULL,
    PRIMARY KEY (idMedicamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CONSULTA (
    idConsulta INT AUTO_INCREMENT,
    dataConsulta DATE NOT NULL,
    idPaciente INT,
    codigo INT,
    estado VARCHAR(2),
    PRIMARY KEY (idConsulta),
    FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente) 
        ON DELETE CASCADE,
    FOREIGN KEY (codigo, estado) REFERENCES MEDICO(codigo, estado) 
        ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RECEITA (
    idReceita INT AUTO_INCREMENT,
    descricao VARCHAR(1000) NOT NULL,
    idConsulta INT,
    PRIMARY KEY (idReceita),
    FOREIGN KEY (idConsulta) REFERENCES CONSULTA(idConsulta) 
        ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PRESCREVE (
    idMedicamento INT,
    idReceita INT,
    PRIMARY KEY (idMedicamento, idReceita),
    FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTO(idMedicamento) 
        ON DELETE RESTRICT,
    FOREIGN KEY (idReceita) REFERENCES RECEITA(idReceita) 
        ON DELETE CASCADE
) ENGINE = InnoDB;