--
-- -------- < TF_tema1 Controle > --------
--
--                    SCRIPT DE CONTROLE (DDL e DCL)
--
-- Data Criacao ...........: 16/06/2024
-- Autor(es) ..............: Bruno Oliveira, Eduardo Silva, Carlos Alves, Lucas Gabriel, Guilherme Dutra, Flávio Melo, Carlos Rodrigues,
--                           Bruno Araújo, Gabriel Santos, Eduardo Sandes, Arthur Silva, Caio Braga, Ian Mesquita, Artur Fontinele, Artur Bartz,
--                           André Silva, Harryson Martins, Hugo Melo, Gabryel Sousa, Danilo Melo, Caio Rodrigues, Cássio Reis, Diego Leite,
--                           Cauã Corrêa, Felipe Araújo, Ana Santos, Isaque Santos, Gabriel Alencar, Breno Gomes
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_tema1
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--         => 02 Perfis (roles)
--         => 06 Usuarios 
--
-- Ultimas Alteracoes
--   21/06/2024 => adição dos usuários

--
-- ----------------------------------------------------

USE TF_tema1;

--  PERFIS
CREATE ROLE ADMINISTRADOR;
CREATE ROLE REVENDEDOR;

-- PRIVILÉGIOS DOS PERFIS
GRANT ALL PRIVILEGES ON TF_tema1.* TO ADMINISTRADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON TF_tema1.* TO REVENDEDOR;

-- USUÁRIOS
CREATE USER 'Joao' IDENTIFIED BY 'Joao123';
CREATE USER 'Dutra' IDENTIFIED BY 'Dutra123';
CREATE USER 'Pedro' IDENTIFIED BY 'Pedro123';
CREATE USER 'Leticia' IDENTIFIED BY 'Leticia123';
CREATE USER 'Lurdinha' IDENTIFIED BY 'Lurdinha123';
CREATE USER 'Lucas' IDENTIFIED BY 'Luquinhas123';


-- PRIVILÉGIOS dos USUÁRIOS
GRANT ADMINISTRADOR TO 'Joao';
SET DEFAULT ROLE ADMINISTRADOR TO 'Joao';
GRANT ADMINISTRADOR TO 'Dutra';
SET DEFAULT ROLE ADMINISTRADOR TO 'Dutra';
GRANT ADMINISTRADOR TO 'Pedro';
SET DEFAULT ROLE ADMINISTRADOR TO 'Pedro';
GRANT REVENDEDOR TO 'Leticia';
SET DEFAULT ROLE REVENDEDOR TO 'Leticia';
GRANT REVENDEDOR TO 'Lurdinha';
SET DEFAULT ROLE REVENDEDOR TO 'Lurdinha';
GRANT REVENDEDOR TO 'Lucas';
SET DEFAULT ROLE REVENDEDOR TO 'Lucas';

-- ATUALIZAR PRIVILÉGIOS
FLUSH PRIVILEGES;

