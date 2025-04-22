-- 
-- -------- < TF1H1 Controle > --------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 16/06/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos e Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_1H1_felipearaujo
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--         => 03 Perfis (role)
--         => 06 Usuarios
--
-- Ultimas Alteracoes
--   17/06/2024 => Criando perfil de vendedor e adicionando usuários.
--
-- ---------------------------------------------------------

# Criação do perfil de admin, vendedor e leitor
CREATE ROLE perfilAdmin;
GRANT ALL PRIVILEGES ON TF_1H1_felipearaujo.* TO perfilAdmin;

CREATE ROLE perfilVendedor;
GRANT SELECT, INSERT, UPDATE, DELETE ON TF_1H1_felipearaujo.* TO perfilVendedor;

CREATE ROLE perfilLeitor;
GRANT SELECT ON TF_1H1_felipearaujo.* TO perfil_leitor;

# Criação dos usuários admin
CREATE USER 'adminGeral' IDENTIFIED BY 'adm54367';
GRANT perfilAdmin TO 'adminGeral';
SET DEFAULT ROLE perfilAdmin TO 'adminGeral';

CREATE USER 'adminAuxiliar' IDENTIFIED BY 'adm78234';
GRANT perfilAdmin TO 'adminAuxiliar';
SET DEFAULT ROLE perfilAdmin TO 'adminAuxiliar';

# Criação dos usuários vendedores
CREATE USER 'leticia' IDENTIFIED BY 'vend53285';
GRANT perfilVendedor TO 'leticia';
SET DEFAULT ROLE perfilVendedor TO 'leticia';

CREATE USER 'auxiliar' IDENTIFIED BY 'vend12385';
GRANT perfilVendedor TO 'auxiliar';
SET DEFAULT ROLE perfilVendedor TO 'auxiliar';

# Criação dos usuários leitores
CREATE USER 'leitor' IDENTIFIED BY 'ler12987';
GRANT perfilLeitor TO 'leitor';
SET DEFAULT ROLE perfilLeitor TO 'leitor';

CREATE USER 'leitorAuxiliar' IDENTIFIED BY 'ler98745';
GRANT perfilLeitor TO 'leitorAuxiliar';
SET DEFAULT ROLE perfilLeitor TO 'leitorAuxiliar';