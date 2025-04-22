-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE DELECAO (DDL)
--
-- Data Criacao ...........: 07/04/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   07/04/2025 => Adicao dos comandos de drop das tabelas da base de dados
--
-- ---------------------------------------------------------

use aula1exer2Evolucao2;

drop table if exists endereco;
drop table if exists telefone;
drop table if exists HISTORICO;
drop table if exists ITEMVENDA;
drop table if exists PRODUTO;
drop table if exists NOTAFISCAL;
drop table if exists AREA;
drop table if exists EMPREGADO;
drop table if exists GERENTE;
drop table if exists PESSOA;
drop view if exists vw_quantidade_produtos_vendidos;