-- -------- < Aula 6 Exercicio 4 Evolução 2 > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
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

USE aula6exer4Evolucao2;

INSERT INTO EMPREGADO(idPessoa, matricula, salario, numero, bairro, rua, idSupervisor, nome, sexo, dataNascimento) VALUES
(1, '22104', 2670.75, '14', 'Águas Claras', 'Rua 20', NULL, 'Carla Santos Oliveira', 'F', '1995-08-20'),
(2, '22105', 3125.00, '22', 'Taguatinga', 'QNA 10', 1, 'Pedro Henrique Lima', 'M', '1990-11-15'),
(3, '22106', 2240.90, '31', 'Guará', 'QE 25', 2, 'Mariana Oliveira Souza', 'F', '2000-03-25'),
(4, '22107', 1859.38, '45', 'Sudoeste', 'CLSW 101', 3, 'Rodrigo Mendes Castro', 'M', '1998-07-10'),
(5, '22108', 3900.00, '17', 'Asa Norte', 'SQN 405', 4, 'Juliana Santos Costa', 'F', '1985-09-02'),
(6, '22109', 2100.50, '12', 'Lago Sul', 'SHIS QI 21', 5, 'Lucas Oliveira Melo', 'M', '1993-12-18');

INSERT INTO DEPENDENTE(idPessoa, nome, sexo, dataNascimento, grauLigacao, idEmpregado) VALUES
(9, 'Bruno Oliveira Costa', 'M', '2017-02-12', 'Filho', 1),
(10, 'Laura Santos Lima', 'F', '2019-08-30', 'Filha', 2),
(11, 'Paulo Henrique Oliveira', 'M', '2016-04-05', 'Filho', 3),
(12, 'Fernanda Costa Lima', 'F', '2014-10-20', 'Filha', 4),
(13, 'Gabriel Santos Castro', 'M', '2011-07-02', 'Filho', 5),
(14, 'Amanda Oliveira Lima', 'F', '2013-11-15', 'Filha', 6);

INSERT INTO DEPARTAMENTO(codigo, nome, idSupervisor, dataAssumiu) VALUES
(105, 'Logística', 4, '2022-02-20'),
(106, 'Vendas', 3, '2021-05-12'),
(107, 'Produção', 2, '2020-07-18'),
(108, 'Qualidade', 1, '2019-09-30'),
(109, 'Jurídico', 5, '2023-01-05'),
(110, 'Administrativo', 6, '2022-11-08');

INSERT INTO PROJETO(idProjeto, nome, rua, numero, bairro, idDepartamento) VALUES
(205, 'Expansão de Mercado', 'Av. Faria Lima', '789', 'Itaim Bibi', 105),
(206, 'Atualização de Sistemas', 'Rua Vergueiro', '234', 'Vila Mariana', 105),
(207, 'Controle de Qualidade', 'Av. Brigadeiro Luís Antônio', '567', 'Bela Vista', 105),
(208, 'Revisão de Contratos', 'Rua Augusta', '123', 'Consolação', 108),
(209, 'Treinamento de Vendas', 'Av. Paulista', '456', 'Jardins', 109),
(210, 'Melhoria de Processos', 'Rua da Consolação', '890', 'Higienópolis', 110);

INSERT INTO trabalha(idProjeto, idPessoa, horasSemanais) VALUES
(205, 5, 25),
(206, 6, 30),
(207, 4, 20),
(208, 3, 35),
(209, 2, 28),
(210, 1, 22);