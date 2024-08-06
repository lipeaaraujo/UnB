-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo,
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
	IF NOT EXISTS aula10extra1;
    
USE aula10extra1;

-- TABELAS
CREATE TABLE ESTADO (
	sigla VARCHAR(2) NOT NULL,
    nomeEstado VARCHAR(20) NOT NULL,
    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
) ENGINE = InnoDB;

CREATE TABLE CIDADE (
	codigoCidade INT(5) NOT NULL AUTO_INCREMENT,
    nomeCidade VARCHAR(50) NOT NULL,
    siglaEstado VARCHAR(2) NOT NULL,
    habitantes BIGINT NOT NULL,
    CONSTRAINT CIDADE_PK PRIMARY KEY (codigoCidade),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (siglaEstado) REFERENCES ESTADO (sigla),
    CONSTRAINT CIDADE_NOME_ESTADO_UNIQUE UNIQUE (nomeCidade, siglaEstado)
) ENGINE = InnoDB AUTO_INCREMENT=0;

-- DROP DATABASE aula10extra1;
