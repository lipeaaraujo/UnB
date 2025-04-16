-- =====     metatric    =====
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 09/04/2025
-- Autor(es) ..............: Ana Beatriz Norberto da Silva
-- Banco de Dados .........: MySQL 8.0.37
-- Nome da Base de Dados ..: metacritic
--
-- -- PROJETO => 01 Base de Dados
--            => 3 Tabelas
--
-- Quantidade de Tuplas em CADA TABELA dessa Base de Dados =>
--
-- +------------+--------+
-- |  TABELA    | TUPLAS |
-- +------------+--------+
-- | GAME       | 12044  |
-- | GENRE      | 12     |
-- | PUBLISHER  | 1696   |
-- +------------+--------+
--
--
-- ULTIMAS ATUALIZACOES
--   09/04/2025 => Criação do script.
--
-- ---------------------------------------------------------
-- 1) RESTAURAR O BACKUP ORIGINAL DA BASE DE DADOS:
--
-- (Após a Criacao da base de dados com o comando CREATE DATABASE
-- metacritic e selecionar a base criada USE metacritic, foi 
-- executado no terminal o seguinte comando)
--
-- mysql -u root -p metacritic < SqlDump_baseDados_Jogos.sql
--
-- ---------------------------------------------------------
-- 2) INSERÇÃO DO JOGO "War Thunder"

INSERT INTO GAME (
    name, id_genre, id_publisher, year_of_release, developer, platform,
    na_sales, eu_sales, jp_sales, other_sales, critic_score, critic_count,
    user_score, user_count, rating
) VALUES (
    'War Thunder', 3, 5789, '2012', 'Gaijin Entertainment', 'PC',
    1.25, 0.85, 0.10, 0.30, 80, 40, '8.7', 250, 'T'
);

-- ---------------------------------------------------------
-- 3) COMANDO DE BACKUP DA BASE DE DADOS (após inserção)
--
-- (Este comando foi executado no terminal)
-- mysqldump -u root -p metacritic > SqlDump_baseDados_Jogos.sql
--
