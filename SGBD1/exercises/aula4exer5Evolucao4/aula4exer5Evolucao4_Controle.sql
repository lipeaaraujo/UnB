-- 
-- -------- < aula4exer5Evolucao4 Controle > --------
--
--                  SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 03/07/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos, Felipe Amorim de Araújo e Isaque Santos
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 01 Visoes
--         => 02 Perfis (role)
--         => 04 Usuarios
-- ---------------------------------------------------------

USE aula4exer5Evolucao4;

CREATE ROLE dono;
GRANT ALL PRIVILEGES ON aula4exer5Evolucao4 TO dono;

CREATE ROLE usuario;
GRANT SELECT ON aula4exer5Evolucao4.* TO usuario;
GRANT INSERT ON aula4exer5Evolucao4.MEDICO TO usuario;

-- Criar usuários com suas senhas
CREATE USER 'saulo' IDENTIFIED BY 'dono22';
GRANT dono TO 'saulo';
SET DEFAULT ROLE dono TO 'saulo';

CREATE USER 'paulo' IDENTIFIED BY 'outrodono';
GRANT dono TO 'paulo';
SET DEFAULT ROLE dono TO 'paulo';

CREATE USER 'adriana' IDENTIFIED BY 'usu22';
GRANT usuario TO 'adriana';
SET DEFAULT ROLE usuario TO 'adriana';

CREATE USER 'carla' IDENTIFIED BY 'outroUsu';
GRANT usuario TO 'carla';
SET DEFAULT ROLE usuario TO 'carla';

FLUSH PRIVILEGES;