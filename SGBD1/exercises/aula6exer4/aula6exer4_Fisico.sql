--
-- -------- < aula6exer4 Fisico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 05/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------



CREATE DATABASE
	IF NOT EXISTS aula6exer4;

USE aula6exer4;

CREATE TABLE LOCALIZACAO (
    idLocalizacao INT NOT NULL,
    rua VARCHAR(60) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (idLocalizacao)
);

CREATE TABLE DEPARTAMENTO (
    numeroDep INT NOT NULL,
    nomeDep VARCHAR(60) NOT NULL,
    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (numeroDep)
);

CREATE TABLE EMPREGADO (
    matricula INT NOT NULL,
    nomeEmpregado VARCHAR(60) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dtNascimento DATE NOT NULL,
    idLocalizacao INT NOT NULL,
    numeroDep INT NOT NULL,
    matriculaSupervisor INT,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT EMPREGADO_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao) REFERENCES LOCALIZACAO (idLocalizacao),
    CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY (numeroDep) REFERENCES DEPARTAMENTO (numeroDep),
    CONSTRAINT EMPREGADO_SUPERVISOR_FK FOREIGN KEY (matriculaSupervisor) REFERENCES EMPREGADO (matricula)
);

CREATE TABLE gerencia (
    matricula INT NOT NULL,
    numeroDep INT NOT NULL UNIQUE,
    dataGerente DATE NOT NULL,
    CONSTRAINT GERENCIA_EMPREGADO_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula),
    CONSTRAINT GERENCIA_DEPARTAMENTO_FK FOREIGN KEY (numeroDep) REFERENCES DEPARTAMENTO (numeroDep),
    CONSTRAINT GERENCIA_PK PRIMARY KEY (matricula, numeroDep)
);

CREATE TABLE DEPENDENTE (
    idDependente INT NOT NULL,
    nomeDepen VARCHAR(60) NOT NULL,
    sexoDepen ENUM('M', 'F') NOT NULL,
    dtNascimento DATE NOT NULL,
    matricula INT NOT NULL,
    CONSTRAINT DEPENDENTE_PK PRIMARY KEY (idDependente),
    CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula)
);

CREATE TABLE PROJETO (
    numeroProj INT NOT NULL,
    nomeProj VARCHAR(60) NOT NULL,
    idLocalizacao INT NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY (numeroProj),
    CONSTRAINT PROJETO_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao) REFERENCES LOCALIZACAO (idLocalizacao)
);

CREATE TABLE trabalha (
    matricula INT NOT NULL,
    numeroProj INT NOT NULL,
    horasSemanais INT NOT NULL,
    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula),
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (numeroProj) REFERENCES PROJETO (numeroProj)
);

CREATE TABLE possui (
    idLocalizacao INT NOT NULL,
    numeroDep INT NOT NULL,
    CONSTRAINT possui_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao) REFERENCES LOCALIZACAO (idLocalizacao),
    CONSTRAINT possui_DEPARTAMENTO_FK FOREIGN KEY (numeroDep) REFERENCES DEPARTAMENTO (numeroDep)
);
