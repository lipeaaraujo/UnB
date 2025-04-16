-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE CONSULTA (DDL)
--
-- Data Criacao ...........: 07/04/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   07/04/2025 => Adicao dos comandos de drop das tabelas da base de dados
--
-- ---------------------------------------------------------

-- A
SELECT NF.numeroNota, NF.dataEmissao, P.nome AS nomeEmpregado, E.matricula
FROM NOTAFISCAL NF
JOIN EMPREGADO E ON NF.cpfEmpregado = E.cpfPessoa
JOIN PESSOA P ON E.cpfPessoa = P.cpf
WHERE E.cpfPessoa = '08685123224';

-- B
SELECT 
    NF.numeroNota,
    NF.dataEmissao,
    P.nome AS nomeEmpregado,
    PR.codigo AS codigoProduto,
    PR.nome AS nomeProduto,
    IV.qntd,
    H.preco AS precoUnitario,
    (IV.qntd * H.preco) AS totalItem
FROM NOTAFISCAL NF
JOIN EMPREGADO E ON NF.cpfEmpregado = E.cpfPessoa
JOIN PESSOA P ON E.cpfPessoa = P.cpf
JOIN ITEMVENDA IV ON NF.numeroNota = IV.numeroNota
JOIN PRODUTO PR ON IV.codigoProduto = PR.codigo
JOIN HISTORICO H ON PR.codigo = H.codigoProduto
WHERE NF.numeroNota = 101  -- Substitua pelo número da nota desejada
AND H.data = (
	SELECT MAX(H2.data) 
	FROM HISTORICO H2 
	WHERE H2.codigoProduto = PR.codigo
);

-- C
SELECT 
    P.cpf,
    P.nome,
    E.matricula
FROM 
    EMPREGADO E
JOIN 
    PESSOA P ON E.cpfPessoa = P.cpf
WHERE 
    E.cpfPessoa NOT IN (
        SELECT G.cpfPessoa
        FROM GERENTE G
    )
ORDER BY 
    P.nome ASC;
    
-- D
CREATE VIEW vw_quantidade_produtos_vendidos AS
SELECT 
    P.codigo AS codigoProduto,
    P.nome AS nomeProduto,
    A.nomeArea,
    SUM(IV.qntd) AS quantidadeTotalVendida
FROM 
    ITEMVENDA IV
JOIN 
    PRODUTO P ON IV.codigoProduto = P.codigo
JOIN 
    AREA A ON P.idArea = A.idArea
GROUP BY 
    P.codigo, P.nome, A.nomeArea
ORDER BY 
    quantidadeTotalVendida DESC;
    
SELECT * FROM vw_quantidade_produtos_vendidos;

-- E
SELECT 
    P.codigo AS codigoProduto,
    P.nome AS nomeProduto,
    SUM(IV.qntd) AS quantidadeTotalVendida
FROM 
    PRODUTO P
JOIN 
    ITEMVENDA IV ON P.codigo = IV.codigoProduto
WHERE 
    P.nome LIKE CONCAT('%', "Notebook", '%')  
GROUP BY 
    P.codigo, P.nome
ORDER BY 
    P.nome DESC;



