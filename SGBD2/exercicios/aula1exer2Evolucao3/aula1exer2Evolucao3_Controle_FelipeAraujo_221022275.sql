-- =====     <<Aula 1 - Exercício 2 Evolução 3>>     =====
--
--                    SCRIPT DE CONTROLE
--
-- Data Criação ...........: 16/04/2025
-- Autor(es) ..............: Felipe Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 01 View
--         => 03 Perfis (role)
--         => 08 Usuarios
--
-- ULTIMAS ATUALIZACOES
--   16/04/2025 => Criação dos perfis
--
-- ---------------------------------------------------------

create role empregado;
grant select on aula1exer2Evolucao3.* to empregado;
grant insert on aula1exer2Evolucao3.VENDA to empregado;
grant insert on aula1exer2Evolucao3.tem to empregado;

create role gerente;
grant select, insert, update on aula1exer2Evolucao3.AREA to gerente;
grant select, insert, update on aula1exer2Evolucao3.PRODUTO to gerente;
grant select, insert, update on aula1exer2Evolucao3.supervisiona to gerente;
grant select, insert, update on aula1exer2Evolucao3.telefone to gerente;
grant select, insert, update on aula1exer2Evolucao3.tem to gerente;
grant select, insert, update on aula1exer2Evolucao3.VENDA to gerente;
grant select on aula1exer2Evolucao3.PESSOA to gerente;
grant select on aula1exer2Evolucao3.EMPREGADO to gerente;
grant select on aula1exer2Evolucao3.GERENTE to gerente;

create role superior;
grant all privileges on aula1exer2Evolucao3.* to superior;

-- SUPERIOR
create user 'admins' identified by '1admin';
grant superior to 'admins';
set default role superior to 'admins';

-- GERENTE
create user 'anamaria' identified by '2anam';
grant superior to 'anamaria';
set default role superior to 'anamaria';

create user 'ruicarlos' identified by '3ruic';
grant superior to 'ruicarlos';
set default role superior to 'ruicarlos';

-- EMPREGADO
create user 'maria' identified by '4maria';
grant superior to 'maria';
set default role superior to 'maria';

create user 'paulo' identified by '5paulo';
grant superior to 'paulo';
set default role superior to 'paulo';

create user 'jose' identified by '6jose';
grant superior to 'jose';
set default role superior to 'jose';

create user 'giovana' identified by '7giovana';
grant superior to 'giovana';
set default role superior to 'giovana';

create user 'pedro' identified by '8pedro';
grant superior to 'pedro';
set default role superior to 'pedro';