
-- -------- < aula6Subconsultas > --------
--
--                    SCRIPT DE REMOÇÃO (DDL)
--
-- Data Criacao ...........: 24/06/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

use aula4exer6Evolucao3;

-- 1) Instrução SQL que realiza uma operação de INSERÇÃO através
--    de uma CONSULTA (SELECT) integrada na instrução INSERT;
INSERT INTO VEICULO (placa, chassi, corPredominante, codModelo, codCategoria, anoDeFabricacao, cpfProprietario)
SELECT 'XYZ1234', '1HGCM82633A004352', 'Azul', m.codModelo, 1, 2020, p.cpfProprietario
FROM MODELO m, PROPRIETARIO p
WHERE m.nomeModelo = 'Can-Am Renegade' AND p.nomeProprietario = 'Emanuel Vieira';

-- 2) Instrução SQL que realiza uma operação de ALTERAÇÃO envolvendo
--    uma CONSULTA (SELECT) integrada na instrução UPDATE;
UPDATE VEICULO v
JOIN MODELO m ON v.codModelo = m.codModelo
SET v.corPredominante = 'Preto'
WHERE m.nomeModelo = 'UNO CS';

-- 3) Instrução SQL que realiza uma operação de EXCLUSÃO envolvendo
--    uma CONSULTA (SELECT) integrada na instrução DELETE;
DELETE FROM INFRACAO
WHERE placa IN (
  SELECT v.placa 
  FROM VEICULO v
  JOIN PROPRIETARIO p ON v.cpfProprietario = p.cpfProprietario
  WHERE p.nomeProprietario = 'Arthur Heleno'
);

-- 4) Instrução SQL que realiza uma CONSULTA (SELECT) possuindo
--    uma SUBCONSULTA (outro SELECT) integrada na instrução SELECT
SELECT v.placa, v.chassi, v.corPredominante, v.codModelo, v.codCategoria, v.anoDeFabricacao, v.cpfProprietario
FROM VEICULO v
WHERE v.placa IN (SELECT i.placa FROM INFRACAO i WHERE i.matriculaAgente = (SELECT matriculaAgente FROM AGENTE WHERE nomeAgente = 'Alexandre'));
