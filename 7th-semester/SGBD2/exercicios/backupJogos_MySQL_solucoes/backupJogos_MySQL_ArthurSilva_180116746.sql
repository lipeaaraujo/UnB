-- =====     <<Exercício Extra 2 de Administração de Dados (Backup e Restore)>>     =====
--
--                    SCRIPT DE DOCUMENTAÇÃO
--
-- Data Criacao ...........: 09/04/2025
-- Autor(es) ..............: Arthur Heleno do Couto da Silva - Matrícula: 180116746
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados de Origem: MySQL 5.7.20
-- Base de Dados (nome) ...: metacritic
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas
--         => 00 Visoes
--         => 00 Perfis (role)
--         => 00 Usuarios
--         => 00 Sequencias
--         => 00 Triggers
--         => 00 Procedimentos
--         => 00 Funcoes
-- |---------------------|
-- |TABELA    |    TUPLAS|
-- |---------------------|
-- |GAME      | 1000    |
-- |GENRE     | 12       |
-- |PUBLISHER | 1000     |
-- ULTIMAS ATUALIZACOES
--
-- ---------------------------------------------------------
CREATE DATABASE metacritic;
USE metacritic;

-- 1) Restaurar o backup do arquivo que está na Área de Compartilhamento 
-- (pasta /aulas/basesDados e arquivo projetoBaseDados_Jogos_2020.zip):
-- No MySQL Workbench, clicar em Server -> Data Import -> Import from Self-Contained File
-- Selecionar o arquivo e selecionar a base de dados criada (metacritic)
-- Clicar na aba Import Progress -> Start Import

-- 2) Inserir na tabela GAME somente mais 1 tupla nova com o novo jogo sendo War Thunder 
-- com os demais dados somente OBRIGATÓRIOS sendo preenchidos com dados fictícios nesta tabela, 
-- mas respeitando as possíveis regras de negócio existentes e com o gênero devendo ser informado 
-- como de COMBATE (fighting):
INSERT INTO GAME (name, id_genre, id_publisher, year_of_release, developer, platform, na_sales, eu_sales, jp_sales, other_sales) value ('War Thunder', 10, 4616, '2012', 'Gaijin Entertainment', 'PS5', 0.25, 0.25, 0.25, 0.25);
SELECT * FROM GAME WHERE name='War Thunder';

-- 3) Comando que faz um novo backup desta base de dados contendo uma nova tupla incluída pela 
-- instrução anterior (questão 2):
-- No MySQL Workbench, clicar em Server -> Data Export
-- Na aba Object Selection, em Tables to Export, selecionar a base de dados metacritic
-- Certificar-se de deixar selecionado Dump Structure and Data
-- Em Export Options selecionar Export to Self-Contained File
-- Criar o arquivo de Dump backupJogos_Dump_MySQL_ArthurSilva_180116746.sql
-- Clicar em Start Export
DROP DATABASE metacritic;
 

