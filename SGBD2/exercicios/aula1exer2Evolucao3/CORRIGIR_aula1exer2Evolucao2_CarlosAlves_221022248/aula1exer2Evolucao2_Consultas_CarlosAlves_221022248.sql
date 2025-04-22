-- -------------------< AULA1EXER2EVOLUCAO2 > ------------------------------------
--
--                    SCRIPT DE CONSULTAS
--
-- Data Criação ...........: 07/04/2025
-- Autor(es) ..............: Carlos Alves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 01 View
--
--
-- --------------------------------------------------------------------------

-- BASE DE DAODS
USE aula1exer2evolucao2;


-- CONSULTAS
-- =======================================================================
-- A) Consultar todas as vendas feitas por um empregado específico
SELECT *
  FROM VENDA
 WHERE matricula = 2;


-- =======================================================================
-- B) Relacionar todos os dados de uma venda específica com todas as informações dos produtos comercializados por esta venda e mostrar o preço total por item da venda (usuário definirá uma venda específica na consulta);
SELECT v.codigo_venda, v.matricula, pr.codigo_produto,
       pr.preco_unitario, t.quantidade, t.data,
       (pr.preco_unitario * t.quantidade) AS total_item
  FROM VENDA v
       JOIN tem t ON v.codigo_venda = t.codigo_venda
       JOIN PRODUTO pr ON t.codigo_produto = pr.codigo_produto
 WHERE v.codigo_venda = 1;


-- =======================================================================
-- C) Mostrar empregados que NÃO são gerentes em ordem alfabética
SELECT e.matricula, p.nome, p.cpf
  FROM EMPREGADO e
       JOIN PESSOA p ON e.cpf = p.cpf
 WHERE e.cpf NOT IN (SELECT cpf FROM GERENTE)
 ORDER BY p.nome ASC;


-- VISAO (VIEW)
-- =======================================================================
-- D) Quantidade de cada produto vendido, implementada como VIEW
CREATE OR REPLACE VIEW vw_quantidade_produto_vendido AS
  SELECT p.codigo_produto, p.descricao, p.preco_unitario, SUM(t.quantidade) AS total_vendido
    FROM PRODUTO p
         JOIN tem t ON p.codigo_produto = t.codigo_produto
   GROUP BY p.codigo_produto, p.descricao, p.preco_unitario
   ORDER BY total_vendido DESC;

-- CONSULTA
-- =======================================================================
-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código, nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.
SELECT p.codigo_produto, p.descricao, SUM(t.quantidade) AS total_vendido
  FROM PRODUTO p
       JOIN tem t ON p.codigo_produto = t.codigo_produto
 WHERE p.descricao LIKE CONCAT('%', 'd', '%')
 GROUP BY p.codigo_produto, p.descricao
 ORDER BY p.descricao DESC;
