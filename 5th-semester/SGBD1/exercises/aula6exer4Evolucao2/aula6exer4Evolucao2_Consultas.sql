-- -------- < Aula 6 Exercicio 4 Evolução 2 > --------
--
--                    SCRIPT DE CONSULTA (DQL)
--
-- Data Criacao ...........: 17/06/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula6exer4Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Perfis
--         => 02 Usuários
--         => 01 View
--
-- ---------------------------------------------------------

SELECT EMPREGADO.* FROM EMPREGADO
INNER JOIN trabalha ON trabalha.idPessoa = EMPREGADO.idPessoa
INNER JOIN PROJETO ON PROJETO.idProjeto = trabalha.idProjeto
INNER JOIN DEPARTAMENTO ON DEPARTAMENTO.codigo = PROJETO.idDepartamento
WHERE DEPARTAMENTO.codigo = '101';

SELECT DEPARTAMENTO.nome AS departamento, EMPREGADO.nome AS gerente
FROM DEPARTAMENTO
INNER JOIN EMPREGADO ON EMPREGADO.idPessoa = DEPARTAMENTO.idSupervisor;

SELECT EMPREGADO.* FROM EMPREGADO
WHERE dataNascimento BETWEEN '1990-01-01' AND '2024-03-01';

CREATE VIEW qntdProjetosPorDepartamento AS
SELECT DEPARTAMENTO.codigo, DEPARTAMENTO.nome, COUNT(PROJETO.idProjeto) AS quantidadeProjetos
FROM DEPARTAMENTO
LEFT JOIN PROJETO ON DEPARTAMENTO.codigo = PROJETO.idDepartamento
GROUP BY DEPARTAMENTO.codigo, DEPARTAMENTO.nome;

SELECT *
FROM qntdProjetosPorDepartamento
WHERE codigo = 105;