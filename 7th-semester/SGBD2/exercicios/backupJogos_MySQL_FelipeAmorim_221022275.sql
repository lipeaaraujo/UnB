-- =====     << backupJogos >>     =====
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 09/04/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: baseDados_Jogos
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   09/04/2025 => 
--
-- ---------------------------------------------------------

-- | TABELA    | TUPLAS |
-- | GAME      | 12043  |
-- | GENRE     | 12     |
-- | PUBLISHER | 1696   |

create database if not exists baseDados_Jogos;
use baseDados_Jogos;

-- 1
-- mysql -u root -p baseDados_Jogos < SqlDump_baseDados_Jogos.sql

-- 2
INSERT INTO GAME (
  name,
  developer,
  platform,
  na_sales,
  eu_sales,
  jp_sales,
  other_sales,
  critic_score,
  year_of_release,
  user_score,
  user_count,
  rating,
  id_genre,
  id_publisher
) VALUES (
  'War Thunder',
  'Gaijin Entertainment',
  'PC',
  500.00,
  800.00,
  100.00,
  300.00,
  78,
  2012,
  8.2,
  150000,
  'T',
  10,
  5000
);

-- 3
-- mysqldump -u root -p baseDados_Jogos > /home/

select count(*) from PUBLISHER;
