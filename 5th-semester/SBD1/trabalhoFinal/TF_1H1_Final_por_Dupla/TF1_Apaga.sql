-- 
-- -------- < TF1H1 Apaga > --------
--
--                    SCRIPT DE DELEÇÃO (DDL)
--
-- Data Criacao ...........: 03/06/2024
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
--   17/06/2024 => Adicionando DROP de usuários e roles.
--
-- ---------------------------------------------------------

USE TF_1H1_felipearaujo;

# DROP dos usuários
DROP USER IF EXISTS 'adminGeral';
DROP USER IF EXISTS 'adminAuxiliar';
DROP USER IF EXISTS 'leticia';
DROP USER IF EXISTS 'auxiliar';
DROP USER IF EXISTS 'leitor';
DROP USER IF EXISTS 'leitorAuxiliar';


# DROP dos perfis (roles)
DROP ROLE IF EXISTS perfilAdmin;
DROP ROLE IF EXISTS perfilVendedor;
DROP ROLE IF EXISTS perfilLeitor; 

# DROP das tabelas.
DROP TABLE IF EXISTS localRetirada;
DROP TABLE IF EXISTS endereco;
DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS itemVenda;
DROP TABLE IF EXISTS itemPedido;
DROP TABLE IF EXISTS BOLETO;
DROP TABLE IF EXISTS PARCELA;
DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS ESTOQUE;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS MARCA;