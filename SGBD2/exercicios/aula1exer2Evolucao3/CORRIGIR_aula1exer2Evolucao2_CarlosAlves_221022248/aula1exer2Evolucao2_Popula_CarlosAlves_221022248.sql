-- =====     <<Aula 1 - Exercício 2 Evolução 2>>     =====
--
--                    SCRIPT (DML)
--
-- Data Criacao ...........: 26/03/2025
-- Autor(es) ..............: Luiza Maluf, Carlos Alves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas--
--         => 01 View
-- 
-- ULTIMAS ATUALIZACOES
--   26/03/2025 => Criação da base de dados.
--   07/04/2025 => Novas tuplas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula1exer2evolucao2;


-- INSERCOES
INSERT INTO PESSOA (cpf, nome, senha) VALUES
('11111111111', 'Ana Silva', 'senha123'),
('22222222222', 'Carlos Souza', 'senha456'),
('33333333333', 'Mariana Lima', 'senha789'),
('44444444444', 'João Pedro', 'senha321'),
('55555555555', 'Lucas Rocha', 'senha654'),
('66666666666', 'Patrícia Melo', 'senha987'),
('77777777777', 'Fernanda Costa', 'senha000'),
('88888888888', 'Joab', 'senha000');


INSERT INTO AREA (area) VALUES
('Eletrônicos'),
('Informática'),
('Papelaria'),
('Telefonia'),
('Eletrodomésticos'),
('Móveis'),
('Brinquedos');


INSERT INTO EMPREGADO (rua, bairro, cidade, cpf) VALUES
('Rua A', 'Centro', 'Brasília', '11111111111'),
('Rua B', 'Asa Sul', 'Brasília', '22222222222'),
('Rua C', 'Asa Norte', 'Brasília', '33333333333'),
('Rua D', 'Guará', 'Brasília', '44444444444'),
('Rua E', 'Taguatinga', 'Brasília', '55555555555'),
('Rua F', 'Águas Claras', 'Brasília', '66666666666'),
('Rua G', 'Sudoeste', 'Brasília', '77777777777'),
('Rua H', 'Sudoeste', 'Brasília', '88888888888');


INSERT INTO GERENTE (formacao_escolar, email, cpf) VALUES
('Superior', 'ana@empresa.com', '11111111111'),
('Médio', 'carlos@empresa.com', '22222222222'),
('Superior', 'mariana@empresa.com', '33333333333'),
('Técnico', 'joao@empresa.com', '44444444444'),
('Superior', 'lucas@empresa.com', '55555555555'),
('Superior', 'patricia@empresa.com', '66666666666'),
('Médio', 'fernanda@empresa.com', '77777777777');


INSERT INTO telefone (matricula, telefone) VALUES
(1, '61911111111'),
(2, '61922222222'),
(3, '61933333333'),
(4, '61944444444'),
(5, '61955555555'),
(6, '61966666666'),
(7, '61977777777');


INSERT INTO PRODUTO (preco_unitario, codigoArea, descricao) VALUES
(2500.00, 1, 'Notebook Dell'),
(1500.00, 1, 'Smartphone Samsung'),
(10.00, 3, 'Caneta Azul'),
(50.00, 3, 'Caderno 200 folhas'),
(800.00, 4, 'Telefone Fixo Intelbras'),
(2300.00, 2, 'Impressora HP'),
(500.00, 6, 'Cadeira Escritório');


INSERT INTO VENDA (matricula) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);


INSERT INTO tem (codigo_venda, codigo_produto, data, quantidade) VALUES
(1, 1, '2025-04-07', 1),
(1, 2, '2025-04-07', 2),
(2, 3, '2025-04-07', 10),
(3, 4, '2025-04-07', 5),
(4, 5, '2025-04-07', 1),
(5, 6, '2025-04-07', 1),
(6, 7, '2025-04-07', 2);


INSERT INTO supervisiona (cpf, codigoArea) VALUES
('11111111111', 1),
('22222222222', 2),
('33333333333', 3),
('33333333333', 4),
('44444444444', 5),
('55555555555', 6),
('66666666666', 7);
