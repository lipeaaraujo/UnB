-- -------- < Aula 6 Exercicio 4 Evolução 2 > --------
--
--                    SCRIPT DE CONTROLE (DDL)
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

USE aula6exer4Evolucao2;

CREATE ROLE administrador;
GRANT ALL PRIVILEGES ON aula6exer4Evolucao2.* TO administrador;

CREATE ROLE funcionario;
GRANT SELECT ON aula6exer4Evolucao2.* TO funcionario;
GRANT INSERT ON aula6exer4Evolucao2.DEPENDENTE TO funcionario;

CREATE USER 'addbd' IDENTIFIED BY '123admin';
GRANT administrador TO 'addbd';
SET DEFAULT ROLE administrador TO 'addbd';

CREATE USER 'superr' IDENTIFIED BY 'admsuperR';
GRANT administrador TO 'superr';
SET DEFAULT ROLE administrador TO 'superr';

CREATE USER 'jose' IDENTIFIED BY 'usu123';
GRANT administrador TO 'jose';
SET DEFAULT ROLE administrador TO 'jose';

CREATE USER 'anaM' IDENTIFIED BY 'mana2023';
GRANT administrador TO 'anaM';
SET DEFAULT ROLE administrador TO 'anaM';



