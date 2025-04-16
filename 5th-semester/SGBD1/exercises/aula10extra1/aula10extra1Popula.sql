-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo,
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula10extra1;

INSERT INTO ESTADO VALUES
('SP', 'São Paulo'),
('DF', 'Distrito Federal'),
('RJ', 'Rio de Janeiro');

INSERT INTO CIDADE (nomeCidade, siglaEstado, habitantes) VALUES
('Brasília', 'DF', 3100000),
('São Paulo', 'SP', 12330000),
('Rio de Janeiro', 'RJ', 6748000),
('São Gonçalo', 'RJ', 1000000),
('Duque de Caxias', 'RJ', 850000),
('Guarulhos', 'SP', 120000),
('Osasco', 'SP', 750000);
