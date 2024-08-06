-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE CONSULTA (DML)
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo,
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula10extra1;

-- Projeção de sigla e nome do estado de sigla SP e DF.
SELECT 
    sigla, nomeEstado
FROM
    ESTADO
WHERE
    sigla = 'SP' OR sigla = 'DF';
    
-- Projeção de sigla e nome das cidades dos estados RJ, DF e GO.
SELECT siglaEstado, nomeCidade
FROM CIDADE
WHERE siglaEstado = 'RJ' OR siglaEstado = 'DF' OR siglaEstado = 'GO';

-- Projeção do nome, nome do estado e sigla das cidades do primeiro estado cadastrado.
SELECT nomeCidade, nomeEstado, sigla
FROM ESTADO, CIDADE 
WHERE siglaEstado = 'SP' AND sigla = 'SP';

--  Projeção do nome do estado, sigla, nome da cidade, habitantes de todas as cidades do ultimo estado cadastrado em ordem crescente de nome de estado e decrescente de nome de cidade.
SELECT nomeEstado, sigla, nomeCidade, habitantes
FROM ESTADO, CIDADE
WHERE siglaEstado = 'RJ' AND sigla = 'RJ'
ORDER BY nomeEstado ASC, nomeCidade DESC;
    
