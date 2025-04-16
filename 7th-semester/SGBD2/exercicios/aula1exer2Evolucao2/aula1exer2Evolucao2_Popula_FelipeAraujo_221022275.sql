-- =====     << aula1exer2 >>     =====
--
--                    SCRIPT DE MANIPULACAO (DML)
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
--   07/04/2025 => Adicao dos comandos de insert e as tuplas
--
-- ---------------------------------------------------------

use aula1exer2Evolucao2;

INSERT INTO PESSOA (cpf, nome, senha) VALUES
    ('08685123224', 'Felipe Amorim', 'l#w2903p'),
    ('12345678901', 'Mariana Souza', 'mari@2024'),
    ('98765432100', 'Carlos Pereira', 'carl1234'),
    ('11122233344', 'Ana Lima', 'ana*123'),
    ('55566677788', 'João Silva', 'joao_456'),
    ('99988877766', 'Laura Mendes', 'laura789'),
    ('33344455566', 'Bruno Costa', 'brunoPass'),
    ('32165498700', 'Ana Beatriz Lima', 'ana@123'),
    ('74185296311', 'Rafael Torres', 'rafat2024'),
    ('25836914722', 'Juliana Castro', 'jcastro!'),
    ('15935748633', 'Thiago Fernandes', 'thiagofr#'),
    ('75315984244', 'Camila Mendes', 'cm_5678'),
    ('98732165455', 'Bruno Oliveira', 'bruno@789'),
    ('45678912366', 'Larissa Martins', 'larim@pass'),
    ('36925814777', 'Gabriel Santos', 'gbs!2024'),
    ('14785236988', 'Isabela Rocha', 'is4bela'),
    ('95175385299', 'Lucas Almeida', 'lucasal#2025');
    

INSERT INTO GERENTE (cpfPessoa, formacao, email) VALUES
    ('08685123224', 'Administração', 'felipe@empresa.com'),
    ('12345678901', 'Marketing', 'mariana@empresa.com'),
    ('98765432100', 'Engenharia', 'carlos@empresa.com'),
    ('11122233344', 'RH', 'ana@empresa.com'),
    ('55566677788', 'Tecnologia', 'joao@empresa.com'),
    ('99988877766', 'Finanças', 'laura@empresa.com'),
    ('33344455566', 'Gestão', 'bruno@empresa.com');

INSERT INTO EMPREGADO (cpfPessoa, matricula) VALUES
    ('08685123224', 'EMP001'),
    ('12345678901', 'EMP002'),
    ('98765432100', 'EMP003'),
    ('11122233344', 'EMP004'),
    ('55566677788', 'EMP005'),
    ('99988877766', 'EMP006'),
    ('33344455566', 'EMP007'),
    ('32165498700', 'EMP008'),
    ('74185296311', 'EMP009');

INSERT INTO AREA (idArea, nomeArea, cpfGerente) VALUES
    (1, 'Eletrônicos', '12345678901'),
    (2, 'Roupas', '12345678901'), -- Mariana gere 2 áreas
    (3, 'Alimentos', '98765432100'),
    (4, 'Limpeza', '55566677788'),
    (5, 'Móveis', '08685123224'), -- Felipe também é gerente
    (6, 'Brinquedos', '99988877766'),
    (7, 'Papelaria', '11122233344');

INSERT INTO PRODUTO (codigo, nome, idArea) VALUES
    ('PROD001', 'Notebook', 1),
    ('PROD002', 'Camiseta', 2),
    ('PROD003', 'Arroz 5kg', 3),
    ('PROD004', 'Sabão em pó', 4),
    ('PROD005', 'Sofá 3 lugares', 5),
    ('PROD006', 'Boneca', 6),
    ('PROD007', 'Caderno 100 folhas', 7);

INSERT INTO NOTAFISCAL (numeroNota, dataEmissao, cpfEmpregado) VALUES
    (101, '2025-04-01', '08685123224'), -- venda com 2 itens
    (102, '2025-04-02', '12345678901'),
    (103, '2025-04-03', '98765432100'),
    (104, '2025-04-04', '11122233344'),
    (105, '2025-04-05', '55566677788'),
    (106, '2025-04-06', '99988877766'),
    (107, '2025-04-07', '33344455566');

INSERT INTO ITEMVENDA (numeroNota, codigoProduto, qntd) VALUES
    (101, 'PROD001', 1),
    (101, 'PROD002', 2), -- 2 itens na mesma venda
    (102, 'PROD003', 3),
    (103, 'PROD004', 4),
    (104, 'PROD005', 1),
    (105, 'PROD006', 2),
    (106, 'PROD007', 5);

INSERT INTO HISTORICO (idHistorico, data, preco, codigoProduto) VALUES
    (1, '2025-03-01', 3500.00, 'PROD001'),
    (2, '2025-03-02', 39.90, 'PROD002'),
    (3, '2025-03-03', 25.00, 'PROD003'),
    (4, '2025-03-04', 18.50, 'PROD004'),
    (5, '2025-03-05', 1999.00, 'PROD005'),
    (6, '2025-03-06', 59.90, 'PROD006'),
    (7, '2025-03-07', 12.00, 'PROD007');

INSERT INTO telefone (cpfEmpregado, telefone) VALUES
    ('08685123224', '61999990001'),
    ('12345678901', '61999990002'),
    ('98765432100', '61999990003'),
    ('11122233344', '61999990004'),
    ('55566677788', '61999990005'),
    ('99988877766', '61999990006'),
    ('33344455566', '61999990007');

INSERT INTO endereco (logradouro, numero, cep, cidade, estado, complemento, cpfEmpregado) VALUES
    ('Rua A', 10, '70000-000', 'Brasília', 'DF', 'Apto 101', '08685123224'),
    ('Rua B', 20, '70000-001', 'Brasília', 'DF', 'Casa', '12345678901'),
    ('Rua C', 30, '70000-002', 'Brasília', 'DF', NULL, '98765432100'),
    ('Rua D', 40, '70000-003', 'Brasília', 'DF', NULL, '11122233344'),
    ('Rua E', 50, '70000-004', 'Brasília', 'DF', NULL, '55566677788'),
    ('Rua F', 60, '70000-005', 'Brasília', 'DF', NULL, '99988877766'),
    ('Rua G', 70, '70000-006', 'Brasília', 'DF', NULL, '33344455566');
