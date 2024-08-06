-- -------- < CLINICA MEDICA > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 29/04/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdClinica
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--         => 00 Visoes
--         => 00 Perfis (role)
--         => 00 Usuarios
--         => 00 Sequencias
--         => 00 Triggers
--         => 00 Procedimentos
--         => 00 Funcoes

-- 
-- Ultimas Alteracoes
--   29/04/2024 => Criacao da base de dados e das tabelas.
--
-- ---------------------------------------------------------

CREATE DATABASE bdClinica;

USE bdClinica;

CREATE TABLE CRM (
  crmUf       VARCHAR(2)    NOT NULL,
  crmNumero   INT           NOT NULL
);

CREATE TABLE ESPECIALIDADE (
  idEspecialidade     INT           NOT NULL,
  nomeEspecialidade   VARCHAR(30)   NOT NULL,
  PRIMARY KEY (idEspecialidade)
);

CREATE TABLE MEDICO (
  nomeCompleto      VARCHAR(60)   NOT NULL,
  idEspecialidade   INT           NOT NULL,
  crmUf             VARCHAR(2)    NOT NULL,
  crmNumero         INT           NOT NULL,
  PRIMARY KEY (crmUf);
  PRIMARY KEY (crmNumero);
  FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade),
  FOREIGN KEY (crmUf) REFERENCES CRM(crmUf),
  FOREIGN KEY (crmNumero) REFERENCES CRM(crmNumero)
);

CREATE TABLE PACIENTE (
  idade           INT               NOT NULL,
  idPaciente      INT               NOT NULL,
  nomeCompleto    VARCHAR(60)       NOT NULL,
  sexo            ENUM('M', 'F')    NOT NULL,
  PRIMARY KEY (idPaciente)
);

CREATE TABLE endereco (
  cidade        VARCHAR(20)   NOT NULL,
  estado        VARCHAR(2)    NOT NULL,
  complemento   VARCHAR(15)
  cep           BIGINT        NOT NULL,
  idPaciente    INT           NOT NULL,
  FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente)
);

CREATE TABLE telefone (
  telefone      VARCHAR(15)   NOT NULL,
  idPaciente    INT           NOT NULL,
  FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente)
);

CREATE TABLE CONSULTA (
  data          DATE          NOT NULL,
  idConsulta    INT           NOT NULL,
  idPaciente    INT           NOT NULL,
  crmUf         VARCHAR(2)    NOT NULL,
  crmNumero     INT           NOT NULL,
  PRIMARY KEY (idConsulta);
  FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente),
  FOREIGN KEY (crmUf) REFERENCES MEDICO(crmUf),
  FOREIGN KEY (crmNumero) REFERENCES MEDICO(crmNumero)
);

CREATE TABLE RECEITA (
  idReceita     INT             NOT NULL,
  descricao     VARCHAR(1000)   NOT NULL,
  idConsulta    INT             NOT NULL,
  PRIMARY KEY (idReceita),
  FOREIGN KEY (idConsulta) REFERENCES CONSULTA(idConsulta)
);

CREATE TABLE MEDICAMENTO (
  idMedicamento     INT           NOT NULL,
  nomeMedicamento   VARCHAR(30)   NOT NULL,
  PRIMARY KEY (idMedicamento)
);

CREATE TABLE preescreve (
  idMedicamento   INT   NOT NULL,
  idReceita       INT   NOT NULL,
  FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTO(idMedicamento),
  FOREIGN KEY (idReceita) REFERENCES RECEITA(idReceita)
)
