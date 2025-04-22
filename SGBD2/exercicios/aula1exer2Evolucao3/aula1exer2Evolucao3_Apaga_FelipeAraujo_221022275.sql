-- =====     <<Aula 1 - Exercício 2 Evolução 3>>     =====
--
--                    SCRIPT DE EXCLUSÃO
--
-- Data Criação ...........: 26/03/2025
-- Autor(es) ..............: Luiza Maluf, Carlos Alves, Felipe Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 01 View
--         => 03 Perfis (role)
--         => 08 Usuarios
-- 
-- ÚLTIMAS ATUALIZAÇÕES
--   26/03/2025 => Criação da base de dados.
--   07/04/2025 => Drop das novas tabelas
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula1exer2Evolucao3;

-- VIEW
DROP VIEW if exists vwQuantidadeProdutoVendido;

-- TABELA
DROP TABLE if exists tem;
DROP TABLE if exists supervisiona;
DROP TABLE if exists telefone;
DROP TABLE if exists VENDA;
DROP TABLE if exists PRODUTO;
DROP TABLE if exists GERENTE;
DROP TABLE if exists EMPREGADO;
DROP TABLE if exists AREA;
DROP TABLE if exists PESSOA;