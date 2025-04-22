-- =====     <<Aula 1 - Exercício 2 Evolução 3>>     =====
--
--                    SCRIPT DE CRIAÇÃO (DDL)
--
-- Data Criação ...........: 26/03/2025
-- Autor(es) ..............: Luiza Maluf, Carlos Alves, Felipe Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 01 View
--         => 03 Perfis (role)
--         => 08 Usuarios
--
-- ÚLTIMAS ATUALIZAÇÕES
--   26/03/2025 => Criação da base de dados.
--   16/04/2025 => Deixando atributos em camelCase e adicionando nome ao produto
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao3;

USE aula1exer2Evolucao3;

-- TABELAS
CREATE TABLE PESSOA (
    cpf VARCHAR(11),
    nome VARCHAR(100),
    senha VARCHAR(100),
    CONSTRAINT PK_PESSOA PRIMARY KEY (cpf)
) ENGINE=InnoDB;


CREATE TABLE AREA (
    area VARCHAR(100),
    codigoArea INT AUTO_INCREMENT,
    CONSTRAINT PK_AREA PRIMARY KEY (codigoArea)
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE EMPREGADO (
    matricula INT AUTO_INCREMENT,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    cpf VARCHAR(11),
    CONSTRAINT PK_EMPREGADO PRIMARY KEY (matricula),
    CONSTRAINT FK_EMPREGADO_PESSOA FOREIGN KEY (cpf) REFERENCES PESSOA (cpf)
      ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE GERENTE (
    formacaoEscolar VARCHAR(100),
    email VARCHAR(100),
    cpf VARCHAR(11),
    CONSTRAINT PK_GERENTE PRIMARY KEY (cpf),
    CONSTRAINT UK_GERENTE_EMAIL UNIQUE (email),
    CONSTRAINT FK_GERENTE_PESSOA FOREIGN KEY (cpf) REFERENCES PESSOA (cpf)
      ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE TABLE PRODUTO (
    codigoProduto INT AUTO_INCREMENT,
    nomeProduto VARCHAR(100),
    precoUnitario DECIMAL(9,2),
    descricao VARCHAR(100),
    codigoArea INT,
    CONSTRAINT PK_PRODUTO PRIMARY KEY (codigoProduto),
    CONSTRAINT FK_PRODUTO_AREA FOREIGN KEY (codigoArea) REFERENCES AREA (codigoArea)
      ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE VENDA (
    codigoVenda INT AUTO_INCREMENT,
    matricula INT,
    CONSTRAINT PK_VENDA PRIMARY KEY (codigoVenda),
    CONSTRAINT FK_VENDA_EMPREGADO FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula)
      ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1;


CREATE TABLE telefone (
    matricula INT NOT NULL,
    telefone VARCHAR(11),
    CONSTRAINT PK_TELEFONE PRIMARY KEY (matricula, telefone),
    CONSTRAINT FK_TELEFONE_EMPREGADO FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula)
      ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE TABLE supervisiona (
    cpf VARCHAR(11),
    codigoArea INT,
    CONSTRAINT FK_SUPERVISIONA_GERENTE FOREIGN KEY (cpf) REFERENCES GERENTE (cpf)
      ON DELETE RESTRICT,
    CONSTRAINT FK_SUPERVISIONA_AREA FOREIGN KEY (codigoArea) REFERENCES AREA (codigoArea)
      ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE tem (
    codigoVenda INT,
    codigoProduto INT,
    data DATE,
    quantidade INT,
    CONSTRAINT FK_TEM_VENDA FOREIGN KEY (codigoVenda) REFERENCES VENDA (codigoVenda)
      ON DELETE RESTRICT,
    CONSTRAINT FK_TEM_PRODUTO FOREIGN KEY (codigoProduto) REFERENCES PRODUTO (codigoProduto)
      ON DELETE RESTRICT
) ENGINE=InnoDB;
