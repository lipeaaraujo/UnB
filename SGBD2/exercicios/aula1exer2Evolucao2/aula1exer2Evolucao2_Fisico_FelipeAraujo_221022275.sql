-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 07/04/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   07/04/2025 => Criação da base de dados e tabelas
--
-- ---------------------------------------------------------

create database if not exists aula1exer2Evolucao2;
use aula1exer2Evolucao2;

CREATE TABLE PESSOA (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(60) not null,
    senha VARCHAR(50) not null
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    formacao VARCHAR(30) not null,
    email VARCHAR(60) not null,
    cpfPessoa VARCHAR(11) PRIMARY KEY,
    foreign key (cpfPessoa) references PESSOA(cpf)
		on delete cascade on update cascade
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    matricula VARCHAR(30) not null UNIQUE,
    cpfPessoa VARCHAR(11) PRIMARY KEY,
    foreign key (cpfPessoa) references PESSOA(cpf)
		on delete cascade on update cascade
) ENGINE = InnoDB;

CREATE TABLE AREA (
    idArea INT PRIMARY KEY,
    nomeArea VARCHAR(50) not null,
    cpfGerente VARCHAR(11) not null,
    foreign key (cpfGerente) references GERENTE(cpfPessoa)
		on delete restrict on update restrict
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    codigo VARCHAR(13) PRIMARY KEY,
    nome VARCHAR(60) not null,
    idArea INT not null,
    foreign key (idArea) references AREA(idArea)
		on delete restrict on update restrict
) ENGINE = InnoDB;

CREATE TABLE NOTAFISCAL (
    numeroNota INT PRIMARY KEY,
    dataEmissao DATE not null,
    cpfEmpregado VARCHAR(11) not null,
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on delete restrict on update restrict
) ENGINE = InnoDB;

CREATE TABLE ITEMVENDA (
    qntd INT not null,
    numeroNota INT not null,
    codigoProduto VARCHAR(13) not null,
    PRIMARY KEY (numeroNota, codigoProduto),
    foreign key (numeroNota) references NOTAFISCAL(numeroNota)
		on delete cascade on update cascade,
	foreign key (codigoProduto) references PRODUTO(codigo)
		on delete restrict on update restrict
) ENGINE = InnoDB;

CREATE TABLE HISTORICO (
    data DATE not null,
    preco DECIMAL(6, 2) not null,
    idHistorico INT PRIMARY KEY not null,
    codigoProduto VARCHAR(13) not null,
    foreign key (codigoProduto) references PRODUTO(codigo)
		on delete cascade on update cascade
) ENGINE = InnoDB;

CREATE TABLE telefone (
    cpfEmpregado VARCHAR(11) NOT NULL,
    telefone VARCHAR(15) not null,
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on delete cascade on update cascade
) ENGINE = InnoDB;

CREATE TABLE endereco (
    logradouro VARCHAR(200) not null,
    numero INT not null,
    cep VARCHAR(50) not null,
    cidade VARCHAR(50) not null,
    estado VARCHAR(2) not null,
    complemento VARCHAR(200),
    cpfEmpregado VARCHAR(11),
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on delete cascade on update cascade
) ENGINE = InnoDB;