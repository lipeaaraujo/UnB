-- =====     << Jogos >>     =====

-- Autor(es) ..............: Caio Falcao Habibe Costa
--                          221021868
-- Nome da Base de Dados ...: Jogos
--
-- Quantidade de tabelas nesta base de dados: 3
--
-- Quantidades de Tuplas em CADA TABELA dessa Base de Dados =>
--
-- | Tabela         | Tuplas |
-- |----------------|--------|
-- | GAME           | 12175  |
-- | GENRE          | 12     |
-- | PUBLISHER      | 0      |


-- mysql -u root -p projetoBaseDados_Jogos_2020 < /aulas/basesDados/projetoBaseDados_Jogos_2020.sql

INSERT INTO GAME (
  name, 
  id_genre, 
  id_publisher, 
  year_of_release, 
  developer, 
  platform, 
  na_sales, 
  eu_sales, 
  jp_sales, 
  other_sales, 
  critic_score, 
  critic_count, 
  user_score, 
  user_count, 
  rating
) VALUES (
  'War Thunder', 
  (SELECT id_genre FROM GENRE WHERE name = 'COMBATE' LIMIT 1),
  (SELECT id_publisher FROM PUBLISHER ORDER BY RAND() LIMIT 1),
  '2012', 
  'Gaijin Entertainment', 
  'PC', 
  0.50, 
  0.40, 
  0.10, 
  0.05, 
  80, 
  30, 
  '8.5', 
  200, 
  'T'
);

-- mysqldump -u root -p projetoBaseDados_Jogos_2020 > backupAtualizado_WarThunder.sql
