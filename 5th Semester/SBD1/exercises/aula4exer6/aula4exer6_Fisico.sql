-- -------- < DETRAN > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 01/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdDetran
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
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

CREATE DATABASE bdClinica;

USE bdClinica;

/* aula4exer6_Logico_FelipeAraujo_221022275: */

CREATE TABLE VEICULO (
    estado VARCHAR(2),
    numero VARCHAR(4),
    chassi VARCHAR(30),
    cor VARCHAR(15),
    anoFabricacao INT,
    codigoCategoria INT,
    codigoModelo INT,
    cpfProprietario INT,
    PRIMARY KEY (estado, numero),
    FOREIGN KEY (codigoCategoria) REFERENCES CATEGORIA(codigo),
    FOREIGN KEY (codigoModelo) REFERENCES MODELO(codigo),
    FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO(cpf)
);

CREATE TABLE CATEGORIA (
    codigo INT PRIMARY KEY,
    nomeCategoria VARCHAR(20)
);

CREATE TABLE MODELO (
    codigo INT PRIMARY KEY,
    nomeModelo VARCHAR(30)
);

CREATE TABLE PROPRIETARIO (
    cpf INT PRIMARY KEY,
    nomeCompleto VARCHAR(60),
    sexo CHAR('M','F'),
    dataNascimento DATE,
    idade INT
);

CREATE TABLE INFRACAO (
    estado VARCHAR(2),
    numero VARCHAR(4),
    dtHora TIMESTAMP,
    idTipo INT,
    velocidadeAferida INT,
    codigoLocal INT,
    matriculaAgente INT,
    PRIMARY KEY (estado, numero, dtHora, idTipo),
    FOREIGN KEY (idTipo) REFERENCES TIPOINFRACAO(id),
    FOREIGN KEY (codigoLocal) REFERENCES LOCAL(codigo),
    FOREIGN KEY (matriculaAgente) REFERENCES AGENTE(matricula),
);

CREATE TABLE TIPOINFRACAO (
    id INT PRIMARY KEY,
    nomeInfracao VARCHAR(60),
    valor REAL
);

CREATE TABLE LOCAL (
    codigo INT PRIMARY KEY,
    velocidadePermitida INT
);

CREATE TABLE AGENTE (
    matricula INT PRIMARY KEY,
    nomeCompleto VARCHAR(60),
    dataContratacao DATE,
    tempoServico TIME
);

CREATE TABLE endereco (
    estado VARCHAR(2),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cpf INT,
    FOREIGN KEY (cpf) REFERENCES PROPRIETARIO(cpf),
);

CREATE TABLE telefone (
    telefone VARCHAR(11),
    cpf INT
    FOREIGN KEY (cpf) REFERENCES PROPRIETARIO(cpf),
);

CREATE TABLE posicao (
    codigo INT,
    latitude REAL(-90,90),
    longitude REAL(-180,180)
    FOREIGN KEY (codigo) REFERENCES LOCAL(codigo),
);