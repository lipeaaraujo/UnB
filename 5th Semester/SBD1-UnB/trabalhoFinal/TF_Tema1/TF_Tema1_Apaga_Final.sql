--
-- -------- < TF_Tema1 Apaga > --------
--
--                    SCRIPT DE REMOÇÃO (DDL)
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
--   16/06/2024 => remoção das entidades inclui e compra
--              => renomeio da entidade PEDIDO para PEDIDOMARCA
--              => adição das entidades PEDIDOCLIENTE, VENDA e FORMAPAGAMENTO.
--   21/06/2024 => adição da entidade PARCELA
--   04/07/2024 => remoção da tabela telefoneCliente e telefoneMarca
--              => adição de IF EXISTS em todos os comandos
--
-- ----------------------------------------------------

use TF_tema1;

DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS telefoneCliente;
DROP TABLE IF EXISTS ITEM;
DROP TABLE IF EXISTS PARCELA;
DROP TABLE IF EXISTS PEDIDOCLIENTE;
DROP TABLE IF EXISTS PEDIDOMARCA;
DROP TABLE IF EXISTS FORMAPAGAMENTO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS telefoneMarca;
DROP TABLE IF EXISTS MARCA;

DROP USER IF EXISTS 'Leticia';
DROP USER IF EXISTS 'Lurdinha';
DROP USER IF EXISTS 'Lucas';
DROP USER IF EXISTS 'Joao';
DROP USER IF EXISTS 'Dutra';
DROP USER IF EXISTS 'Pedro';

DROP ROLE IF EXISTS ADMINISTRADOR;
DROP ROLE IF EXISTS REVENDEDOR;