-- -------- < Detran > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 00 Visoes
--         => 00 Perfis (role)
--         => 00 Usuarios
--         => 00 Sequencias
--         => 00 Triggers
--         => 00 Procedimentos
--         => 00 Funcoes
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

CREATE DATABASE aula4exer6Evolucao2;

USE aula4exer6Evolucao2;

CREATE TABLE
  PROPRIETARIO (
    cpfProprietario bigint (12) primary key,
    nomeProprietario varchar(60) NOT NULL,
    bairro varchar(20) NOT NULL,
    cidade varchar(20) NOT NULL,
    estado varchar(2) NOT NULL,
    cep bigint (9) NOT NULL,
    sexo enum ('M', 'F') NOT NULL,
    dtNascimento date NOT NULL
  );

CREATE TABLE
  telefone (
    cpfProprietario bigint (12) primary key,
    telefone varchar(15) NOT NULL,
    foreign key (cpfProprietario) references PROPRIETARIO (cpfProprietario)
  );

CREATE TABLE
  CATEGORIA (
    codCategoria int (2) primary key,
    nomeCategoria varchar(20) NOT NULL
  );

CREATE TABLE
  MODELO (
    codModelo int (6) primary key,
    nomeModelo varchar(20) NOT NULL
  );

CREATE TABLE
  VEICULO (
    placa varchar(8) primary key,
    chassi varchar(18) NOT NULL,
    corPredominante varchar(15) NOT NULL,
    anoFabricacao int (5) NOT NULL,
    codModelo int (6) NOT NULL,
    codCategoria int (2) NOT NULL,
    cpfProprietario bigint (12) NOT NULL,
    foreign key (codModelo) references MODELO (codModelo),
    foreign key (codCategoria) references CATEGORIA (codCategoria),
    foreign key (cpfProprietario) references PROPRIETARIO (cpfProprietario)
  );

CREATE TABLE
  TIPOINFRACAO (
    codInfracao int (4) primary key,
    descricaoInfracao varchar(100) NOT NULL,
    valorMulta decimal(8, 2) NOT NULL
  );

CREATE TABLE
  LOCAL (
    codLocal int (6) primary key,
    latitude int (2) NOT NULL,
    longitude int (2) NOT NULL,
    velocidadePermitida int (3) NOT NULL
  );

CREATE TABLE
  AGENTE (
    matriculaAgente int (6) primary key,
    nomeAgente varchar(60) NOT NULL,
    dtContratacao date NOT NULL,
  );

CREATE TABLE
  INFRACAO (
    dtHora datetime primary key,
    velocidadeAferida int (3),
    codInfracao int (4) NOT NULL,
    codLocal int (6) NOT NULL,
    matriculaAgente int (6) NOT NULL,
    placa varchar(8) NOT NULL,
    foreign key (codInfracao) references TIPOINFRACAO (codInfracao),
    foreign key (codLocal) references LOCAL (codLocal),
    foreign key (matriculaAgente) references AGENTE (matriculaAgente),
    foreign key (placa) references VEICULO (placa)
  );