-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 28/03/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   28/03/2025 => Adicao dos comandos para criacao da base de dados e das tabelas
--              => Adicao dos constraints de foreign keys.
--
-- ---------------------------------------------------------

create database if not exists aula1exer2;
use aula1exer2;

CREATE TABLE PESSOA (
    nome VARCHAR(60) not null,
    cpf VARCHAR(11) PRIMARY KEY,
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

CREATE TABLE PRODUTO (
    codigo VARCHAR(13) PRIMARY KEY,
    nomeProduto VARCHAR(60) not null,
    precoUnitario DECIMAL(6,2) not null
) ENGINE = InnoDB;

CREATE TABLE NOTAFISCAL (
    numero INT PRIMARY KEY,
    dataEmissao DATE not null
) ENGINE = InnoDB;

CREATE TABLE PROCESSO (
    idProcesso INT PRIMARY KEY auto_increment,
    dataVenda DATE not null,
    qntd INT not null,
    cpfEmpregado VARCHAR(11) not null,
    codigoProd VARCHAR(13) not null,
    numeroNota INT not null,
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on delete restrict on update cascade,
	foreign key (codigoProd) references PRODUTO(codigo)
		on delete restrict on update cascade,
	foreign key (numeroNota) references NOTAFISCAL(numero)
		on delete restrict on update cascade
) ENGINE = InnoDB auto_increment = 1;

CREATE TABLE endereco (
    logradouro VARCHAR(100),
    numero INT not null,
    bairro VARCHAR(50) not null,
    cidade VARCHAR(50) not null,
    estado VARCHAR(2) not null,
    cpfEmpregado VARCHAR(11) not null,
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on update cascade on delete cascade
) ENGINE = InnoDB;

CREATE TABLE telefone (
    telefone VARCHAR(15) not null,
    cpfEmpregado VARCHAR(11) not null,
    foreign key (cpfEmpregado) references EMPREGADO(cpfPessoa)
		on update cascade on delete cascade
) ENGINE = InnoDB;

CREATE TABLE supervisiona (
    cpfGerente VARCHAR(11) not null,
    cpfEmpregado VARCHAR(11) not null
) ENGINE = InnoDB;