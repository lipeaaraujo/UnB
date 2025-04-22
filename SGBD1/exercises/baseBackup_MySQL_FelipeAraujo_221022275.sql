-- Felipe Amorim de Araújo, 221022275

-- Nome da Base de Dados => gamesDatabase

-- Quantidades de Tabelas nesta Base de Dados => 1

-- Quantidades de Tuplas em CADA TABELA dessa Base de Dados  100

-- 1) Restaurar o backup do arquivo que está na Área de Compartilhamento (pasta /aulas/basesDados e arquivo baseDados_metacritic_jogos.zip):

CREATE database IF NOT EXISTS gamesDatabase;
mysql -u root -p gamesDatabase < /home/felipe/Downloads/baseDados_metacritic_jogos.sql;

-- 2) Inserir na tabela GAME somente mais 1 tupla nova com o novo jogo sendo Rainbow Six com os demais dados podendo ser fictícios nesta tabela, mas respeitando as possíveis regras de negócio existentes:

use gamesDatabase;
INSERT INTO GAME (
    name, id_genre, id_publisher, year_of_release, developer, platform, 
    na_sales, eu_sales, jp_sales, other_sales, 
    critic_score, critic_count, user_score, user_count, rating
) VALUES (
    'Rainbow Six', 2, 3, '2015', 'Ubisoft', 'PS4',
    2.35, 1.12, 0.78, 0.34,
    90, 120, 8.5, 250, 'M'
);

-- 3) Comando que faz um novo backup desta base de dados contendo uma nova tupla:

mysqldump -u root -p gamesDatabase > /home/felipe/Downloads/baseDados_metacritic_jogos.sql;

