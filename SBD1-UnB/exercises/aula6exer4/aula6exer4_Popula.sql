--
-- -------- < aula6exer4 Popula > --------
--
--                    SCRIPT DE MANIPULACAO (DML)
--
-- Data Criacao ...........: 05/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

USE aula6exer4;

INSERT INTO LOCALIZACAO (idLocalizacao, rua, numero, bairro) VALUES
(1, 'Rua A', 100, 'Centro'),
(2, 'Rua B', 200, 'Zona Sul'),
(3, 'Rua C', 300, 'Zona Norte'),
(4, 'Rua D', 400, 'Zona Leste');

INSERT INTO DEPARTAMENTO (numeroDep, nomeDep) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informação'),
(3, 'Financeiro'),
(4, 'Marketing');

INSERT INTO EMPREGADO (matricula, nomeEmpregado, salario, sexo, dtNascimento, idLocalizacao, numeroDep, matriculaSupervisor) VALUES
(1, 'João Silva', 3000.00, 'M', '1980-01-15', 1, 1, NULL),
(2, 'Maria Oliveira', 4500.00, 'F', '1985-03-22', 2, 2, 1),
(3, 'Carlos Pereira', 5000.00, 'M', '1979-08-30', 3, 3, 2),
(4, 'Ana Costa', 3500.00, 'F', '1990-11-12', 4, 4, 3);

INSERT INTO gerencia (matricula, numeroDep, dataGerente) VALUES
(1, 1, '2020-01-01'),
(2, 2, '2021-02-15'),
(3, 3, '2019-03-20'),
(4, 4, '2022-04-10');

INSERT INTO DEPENDENTE (idDependente, nomeDepen, sexoDepen, dtNascimento, matricula) VALUES
(1, 'Pedro Silva', 'M', '2005-06-25', 1),
(2, 'Lucas Oliveira', 'M', '2010-09-15', 2),
(3, 'Beatriz Pereira', 'F', '2008-12-05', 3),
(4, 'Mariana Costa', 'F', '2015-03-18', 4);

INSERT INTO PROJETO (numeroProj, nomeProj, idLocalizacao) VALUES
(1, 'Projeto Alpha', 1),
(2, 'Projeto Beta', 2),
(3, 'Projeto Gamma', 3),
(4, 'Projeto Delta', 4);

INSERT INTO trabalha (matricula, numeroProj, horasSemanais) VALUES
(1, 1, 20),
(2, 2, 30),
(3, 3, 25),
(4, 4, 35);

INSERT INTO possui (idLocalizacao, numeroDep) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
