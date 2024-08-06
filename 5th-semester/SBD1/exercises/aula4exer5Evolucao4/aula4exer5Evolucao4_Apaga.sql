-- 
-- -------- < aula4exer5Evolucao4 Apaga > --------
--
--                  SCRIPT DE APAGA (DML)
--
-- Data Criacao ...........: 03/07/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos, Felipe Amorim de Araújo e Isaque Santos
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas

-- ---------------------------------------------------------

USE aula4exer5Evolucao4;

DROP USER IF EXISTS 'saulo';
DROP USER IF EXISTS 'paulo';
DROP USER IF EXISTS 'adriana';
DROP USER IF EXISTS 'carla';

DROP ROLE IF EXISTS dono;
DROP ROLE IF EXISTS usuario;

DROP TABLE IF EXISTS PRESCREVE;
DROP TABLE IF EXISTS RECEITA;
DROP TABLE IF EXISTS CONSULTA;
DROP TABLE IF EXISTS MEDICAMENTO;
DROP TABLE IF EXISTS TELEFONE;
DROP TABLE IF EXISTS PACIENTE;
DROP TABLE IF EXISTS MEDICO;
DROP TABLE IF EXISTS ESPECIALIDADE;

