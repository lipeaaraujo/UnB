-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE MANIPULACAO (DML)
--
-- Data Criacao ...........: 29/03/2025
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- 
-- ULTIMAS ATUALIZACOES
--   29/03/2025 => Adicao dos comandos de insert e as tuplas
--
-- ---------------------------------------------------------

use aula1exer2;

INSERT INTO PESSOA (nome, cpf, senha) VALUES
    ('Felipe Amorim', '08685123224', 'l#w2903p'),
    ('Mariana Souza', '12345678901', 'mari@2024'),
    ('Carlos Pereira', '98765432100', 'carl1234');

INSERT INTO GERENTE (formacao, email, cpfPessoa) VALUES
    ('Superior', 'felipe.gerente@email.com', '08685123224'),
    ('Pós-graduação', 'mariana.rh@email.com', '12345678901'),
    ('Superior', 'carlos.eng@email.com', '98765432100');

INSERT INTO EMPREGADO (matricula, cpfPessoa) VALUES
    ('EMP001', '12345678901'),
    ('EMP002', '98765432100'),
    ('EMP003', '08685123224');

INSERT INTO PRODUTO (codigo, nomeProduto, precoUnitario) VALUES
    ('1234567890123', 'Notebook Dell', 3500.00),
    ('9876543210987', 'Smartphone Samsung', 2000.00),
    ('4567891234567', 'Teclado Mecânico', 300.00);

INSERT INTO NOTAFISCAL (numero, dataEmissao) VALUES
    (1001, '2025-03-01'),
    (1002, '2025-03-02'),
    (1003, '2025-03-03');

INSERT INTO PROCESSO (dataVenda, qntd, cpfEmpregado, codigoProd, numeroNota) VALUES
    ('2025-03-01', 2, '12345678901', '1234567890123', 1001),
    ('2025-03-02', 1, '98765432100', '9876543210987', 1002),
    ('2025-03-03', 3, '08685123224', '4567891234567', 1003);

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, cpfEmpregado) VALUES
    ('Rua das Flores', 123, 'Centro', 'Brasília', 'DF', '12345678901'),
    ('Av. Paulista', 456, 'Bela Vista', 'São Paulo', 'SP', '98765432100'),
    ('Rua XV de Novembro', 789, 'Centro', 'Curitiba', 'PR', '08685123224');

INSERT INTO telefone (telefone, cpfEmpregado) VALUES
    ('61998765432', '12345678901'),
    ('11987654321', '98765432100'),
    ('41912345678', '08685123224');

INSERT INTO supervisiona (cpfGerente, cpfEmpregado) VALUES
    ('08685123224', '12345678901'),
    ('12345678901', '98765432100'),
    ('98765432100', '08685123224');