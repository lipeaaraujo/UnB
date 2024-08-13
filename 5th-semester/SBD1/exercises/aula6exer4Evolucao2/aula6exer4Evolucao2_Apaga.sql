-- -------- < Aula 6 Exercicio 4 Evolução 2 > --------
--
--                    SCRIPT DE DELEÇÃO (DDL)
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

DROP USER 'addbd';
DROP USER 'superr';
DROP USER 'jose';
DROP USER 'anaM';

DROP ROLE administrador;
DROP ROLE funcionario;

DROP TABLE trabalha;
DROP TABLE PROJETO;
DROP TABLE DEPARTAMENTO;
DROP TABLE DEPENDENTE;
DROP TABLE EMPREGADO;