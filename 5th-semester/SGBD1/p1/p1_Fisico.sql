-- -------- < Prova 1 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 21/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: FelipeAraujo
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

CREATE DATABASE
	IF NOT EXISTS FelipeAraujo;

USE FelipeAraujo;

CREATE TABLE EMPREGADO (
	matricula INT NOT NULL,
    nomeCompleto VARCHAR(60) NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula)
) ENGINE = InnoDB;

CREATE TABLE telefone (
	matricula INT NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT endereco_EMPREGADO_FK FOREIGN KEY (matricula) references EMPREGADO (matricula)
) ENGINE = InnoDB;

CREATE TABLE PROJETO (
	idProjeto INT NOT NULL AUTO_INCREMENT,
    nomeProjeto VARCHAR(60) NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE ATIVIDADE (
	idAtividade INT NOT NULL AUTO_INCREMENT,
	idProjeto INT NOT NULL,
    matriculaEmpregado INT NOT NULL,
    nomeCompleto VARCHAR(60) NOT NULL,
    CONSTRAINT ATIVIDADE_PK PRIMARY KEY (idAtividade),
    CONSTRAINT ATIVIDADE_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) references EMPREGADO (matricula),
    CONSTRAINT ATIVIDADE_PROJETO_FK FOREIGN KEY (idProjeto) references PROJETO (idProjeto)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE EQUIPAMENTO (
	idEquipamento INT NOT NULL,
    nomeEquipamento VARCHAR(60) NOT NULL,
    peso DECIMAL(6,2) NOT NULL,
    CONSTRAINT EQUIPAMENTO_PK PRIMARY KEY (idEquipamento)
) ENGINE = InnoDB;

CREATE TABLE usa (
	idEquipamento INT NOT NULL,
    idAtividade INT NOT NULL,
	CONSTRAINT usa_EQUIPAMENTO_FK FOREIGN KEY (idEquipamento) references EQUIPAMENTO (idEquipamento),
    CONSTRAINT usa_ATIVIDADE_FK FOREIGN KEY (idAtividade) references ATIVIDADE (idAtividade)
) ENGINE = InnoDB;