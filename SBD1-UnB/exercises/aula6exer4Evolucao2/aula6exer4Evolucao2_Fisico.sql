-- -------- < Aula 6 Exercicio 4 Evolução 2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 17/06/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula6exer4Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Perfis
--         => 02 Usuários
--         => 01 View
--
-- ---------------------------------------------------------

CREATE DATABASE
	IF NOT EXISTS aula6exer4Evolucao2;

USE aula6exer4Evolucao2;

CREATE TABLE EMPREGADO (
    idPessoa INT NOT NULL,
    matricula VARCHAR(32) NOT NULL,
    salario FLOAT NOT NULL,
    numero VARCHAR(3) NOT NULL,
    bairro VARCHAR(128) NOT NULL,
    rua VARCHAR(128) NOT NULL,
    idSupervisor INT,
    nome VARCHAR(256) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (idPessoa),
    CONSTRAINT EMPREGADO_UK UNIQUE (matricula),
    CONSTRAINT EMPREGADO_EMPREGADO_FK FOREIGN KEY (idSupervisor)
        REFERENCES EMPREGADO (idPessoa)
        ON DELETE RESTRICT ON UPDATE CASCADE
)  ENGINE=INNODB;
 
CREATE TABLE DEPENDENTE (
    idPessoa INT NOT NULL,
    nome VARCHAR(256) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    grauLigacao VARCHAR(128) NOT NULL,
    idEmpregado INT NOT NULL,
    CONSTRAINT DEPENDENTE_PK PRIMARY KEY (idPessoa),
    CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY (idEmpregado)
        REFERENCES EMPREGADO (idPessoa)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB;

CREATE TABLE DEPARTAMENTO (
    codigo INT NOT NULL,
    nome VARCHAR(128) NOT NULL,
    idSupervisor INT NOT NULL,
    dataAssumiu DATE NOT NULL,
    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (codigo),
    CONSTRAINT DEPARTAMENTO_EMPREGADO_FK FOREIGN KEY (idSupervisor)
        REFERENCES EMPREGADO (idPessoa)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT DEPARTAMENTO_UK UNIQUE (idSupervisor)
)  ENGINE=INNODB;
 
CREATE TABLE PROJETO (
    idProjeto INT NOT NULL,
    nome VARCHAR(128) NOT NULL,
    rua VARCHAR(128) NOT NULL,
    numero VARCHAR(3) NOT NULL,
    bairro VARCHAR(128) NOT NULL,
    idDepartamento INT NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento)
        REFERENCES DEPARTAMENTO (codigo)
        ON DELETE RESTRICT ON UPDATE CASCADE
)  ENGINE=INNODB;

CREATE TABLE trabalha (
    idProjeto INT NOT NULL,
    idPessoa INT NOT NULL,
    horasSemanais INT NOT NULL,
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (idProjeto)
        REFERENCES PROJETO (idProjeto)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (idPessoa)
        REFERENCES EMPREGADO (idPessoa)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT trabalha_UK UNIQUE (idProjeto , idPessoa)
)  ENGINE=INNODB;