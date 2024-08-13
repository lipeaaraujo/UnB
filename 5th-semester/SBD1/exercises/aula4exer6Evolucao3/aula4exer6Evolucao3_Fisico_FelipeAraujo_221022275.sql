-- -------- < aula4exer6Evolucao3 Fisico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 08/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;

USE aula4exer6Evolucao3;

CREATE TABLE
    PROPRIETARIO (
        cpfProprietario DECIMAL(11) NOT NULL,
        nomeProprietario VARCHAR(60) NOT NULL,
        dtNascimento DATE NOT NULL,
        sexo ENUM('M', 'F') NOT NULL,
        CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpfProprietario)
    ) ENGINE = InnoDB;

CREATE TABLE
    telefone (
        cpfProprietario DECIMAL(11) NOT NULL,
        telefone VARCHAR(15) NOT NULL,
        CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpfProprietario)
    ) ENGINE = InnoDB;

CREATE TABLE
    endereco (
        cpfProprietario DECIMAL(11) NOT NULL,
        bairro VARCHAR(20) NOT NULL,
        cidade VARCHAR(20) NOT NULL,
        estado VARCHAR(2) NOT NULL,
        cep DECIMAL(8) NOT NULL,
        CONSTRAINT endereco_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpfProprietario)
    ) ENGINE = InnoDB;

CREATE TABLE
    MODELO (
        codModelo DECIMAL(6) NOT NULL,
        nomeModelo VARCHAR(20) NOT NULL,
        CONSTRAINT MODELO_PK PRIMARY KEY (codModelo)
    ) ENGINE = InnoDB;

CREATE TABLE
    CATEGORIA (
        codCategoria DECIMAL(2) NOT NULL,
        nomeCategoria VARCHAR(20) NOT NULL,
        CONSTRAINT CATEGORIA_PK PRIMARY KEY (codCategoria)
    ) ENGINE = InnoDB;

CREATE TABLE
    VEICULO (
        placa VARCHAR(8) NOT NULL,
        chassi VARCHAR(18) NOT NULL,
        corPredominante VARCHAR(15) NOT NULL,
        anoFabricacao DECIMAL(4) NOT NULL,
        codModelo DECIMAL(6) NOT NULL,
        codCategoria DECIMAL(2) NOT NULL,
        cpfProprietario DECIMAL(11) NOT NULL,
        CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
        CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codModelo) REFERENCES MODELO (codModelo),
        CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria) REFERENCES CATEGORIA (codCategoria),
        CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpfProprietario)
    ) ENGINE = InnoDB;

CREATE TABLE
    LOCAL (
        codLocal DECIMAL(6) NOT NULL,
        velocidadePermitida DECIMAL(3) NOT NULL,
        CONSTRAINT LOCAL_PK PRIMARY KEY (codLocal)
    ) ENGINE = InnoDB;

CREATE TABLE
    posicao (
        codLocal DECIMAL(6) NOT NULL,
        latitude DECIMAL(10, 8) NOT NULL,
        longitude DECIMAL(11, 8) NOT NULL,
        CONSTRAINT posicao_LOCAL_FK FOREIGN KEY (codLocal) REFERENCES LOCAL (codLocal)
    ) ENGINE = InnoDB;

CREATE TABLE
    AGENTE (
        matriculaAgente DECIMAL(15) NOT NULL,
        nomeAgente VARCHAR(60) NOT NULL,
        dtContratacao DATE NOT NULL,
        CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaAgente)
    ) ENGINE = InnoDB;

CREATE TABLE
    TIPOINFRACAO (
        codTipo DECIMAL(4) NOT NULL,
        descricaoInfracao VARCHAR(100) NOT NULL,
        valorMulta DECIMAL(8, 2) NOT NULL,
        CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (codTipo)
    ) ENGINE = InnoDB;

CREATE TABLE
    INFRACAO (
        dtHora DATETIME NOT NULL,
        velocidadeAferida DECIMAL(3),
        codTipo DECIMAL(4) NOT NULL,
        codLocal DECIMAL(6) NOT NULL,
        matriculaAgente DECIMAL(15) NOT NULL,
        placa VARCHAR(8) NOT NULL,
        CONSTRAINT INFRACAO_PK PRIMARY KEY (dtHora),
        CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (codTipo) REFERENCES TIPOINFRACAO (codTipo),
        CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codLocal) REFERENCES LOCAL (codLocal),
        CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaAgente) REFERENCES AGENTE (matriculaAgente),
        CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa) REFERENCES VEICULO (placa)
    ) ENGINE = InnoDB;