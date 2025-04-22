-- =====     <<Aula 1 - Exercício 2 Evolução 3>>     =====
--
--                    SCRIPT DE CONSULTAS
--
-- Data Criação ...........: 07/04/2025
-- Autor(es) ..............: Carlos Alves, Felipe Araújo
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
--   26/03/2025 => Criação da base de dados.
--   07/04/2025 => Novas tuplas
--   16/04/2025 => Adicionando nome as tuplas de produto e corrigindo nome dos atributos
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula1exer2Evolucao3;


-- CONSULTAS
-- =======================================================================
-- A) Consultar todas as vendas feitas por um empregado específico
SELECT *
  FROM VENDA
 WHERE matricula = 2;


-- =======================================================================
-- B) Relacionar todos os dados de uma venda específica com todas as informações dos produtos comercializados por esta venda e mostrar o preço total por item da venda (usuário definirá uma venda específica na consulta);
SELECT v.codigoVenda, v.matricula, pr.codigoProduto,
       pr.precoUnitario, t.quantidade, t.data,
       (pr.precoUnitario * t.quantidade) AS totalItem
  FROM VENDA v
       JOIN tem t ON v.codigoVenda = t.codigoVenda
       JOIN PRODUTO pr ON t.codigoProduto = pr.codigoProduto
 WHERE v.codigoVenda = 1;


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
CREATE OR REPLACE VIEW vwQuantidadeProdutoVendido AS
  SELECT p.codigoProduto, p.descricao, p.precoUnitario, SUM(t.quantidade) AS totalVendido
    FROM PRODUTO p
         JOIN tem t ON p.codigoProduto = t.codigoProduto
   GROUP BY p.codigoProduto, p.descricao, p.precoUnitario
   ORDER BY totalVendido DESC;

-- CONSULTA
-- =======================================================================
-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código, nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.
SELECT p.codigoProduto, p.nomeProduto, p.descricao, SUM(t.quantidade) AS totalVendido
  FROM PRODUTO p
       JOIN tem t ON p.codigoProduto = t.codigoProduto
 WHERE p.descricao LIKE CONCAT('%', 'd', '%')
 GROUP BY p.codigoProduto, p.descricao
 ORDER BY p.descricao DESC;
