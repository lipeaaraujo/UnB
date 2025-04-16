-- 
-- -------- < TF1 Popula > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 03/06/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos e Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF1
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas

-- ---------------------------------------------------------

USE TF1;

INSERT INTO MARCA (nomeMarca, porcentagemLucro) VALUES
    ('Marca Natura', 10.00),
    ('Marca Avon', 15.00),
    ('Marca L\'Oréal', 12.50),
    ('Marca O Boticário', 8.75),
    ('Marca Maybelline', 20.00);

INSERT INTO PRODUTO (codigoProduto, nomeProduto, precoProduto, ciclo, dtValidade, idMarca) VALUES
    (101, 'Batom Matte', 100, 1.50, '2024-12-31', 1),
    (102, 'Perfume Eau de Parfum', 150, 2.00, '2025-06-30', 2),
    (103, 'Creme Hidratante', 200, 1.75, '2024-11-30', 3),
    (104, 'Shampoo Revitalizante', 250, 2.50, '2025-01-31', 4),
    (105, 'Máscara de Cílios', 300, 1.25, '2024-09-30', 5);

INSERT INTO ESTOQUE (quantidade, codigoProduto) VALUES
    (50, 101),
    (30, 102),
    (40, 103),
    (20, 104),
    (10, 105);

INSERT INTO CLIENTE (cpf, nomeCliente) VALUES
    ('12345678901', 'Ana Maria Silva'),
    ('23456789012', 'Bruno Costa'),
    ('34567890123', 'Carla Ferreira'),
    ('45678901234', 'Daniel Souza'),
    ('56789012345', 'Eliana Santos');

INSERT INTO VENDA (dtVenda, descontoAplicado, cpfCliente) VALUES
    ('2024-06-01', 5.00, '12345678901'),
    ('2024-06-02', 10.00, '23456789012'),
    ('2024-06-03', 0.00, '34567890123'),
    ('2024-06-04', 15.00, '45678901234'),
    ('2024-06-05', 20.00, '56789012345');

INSERT INTO PARCELA (valorParcela, dtVencimento, dtPagamento, metodoPag, jurosAplicados, descontoAplicado, idVenda) VALUES
    (95.00, '2024-07-01', NULL, 'Cartão de Crédito', 1.50, 5.00, 1),
    (135.00, '2024-07-02', '2024-07-02', 'Boleto', 1.00, 10.00, 2),
    (200.00, '2024-07-03', NULL, 'Pix', 0.00, 0.00, 3),
    (212.50, '2024-07-04', '2024-07-04', 'Cartão de Débito', 1.25, 15.00, 4),
    (240.00, '2024-07-05', NULL, 'Transferência Bancária', 2.00, 20.00, 5);

INSERT INTO PEDIDO (numeroPedido, ciclo, dtPedido, statusPedido) VALUES
    (1001, 30, '2024-06-01', 'Pendente'),
    (1002, 60, '2024-06-02', 'Pago'),
    (1003, 45, '2024-06-03', 'Pendente'),
    (1004, 30, '2024-06-04', 'Cancelado'),
    (1005, 90, '2024-06-05', 'Pendente');

INSERT INTO localRetirada (cep, numero, logradouro, uf, cidade, bairro, numeroPedido) VALUES
    ('12345678', 100, 'Rua A', 'SP', 'São Paulo', 'Jardins', 1001),
    ('23456789', 200, 'Rua B', 'RJ', 'Rio de Janeiro', 'Copacabana', 1002),
    ('34567890', 300, 'Rua C', 'MG', 'Belo Horizonte', 'Savassi', 1003),
    ('45678901', 400, 'Rua D', 'RS', 'Porto Alegre', 'Moinhos de Vento', 1004),
    ('56789012', 500, 'Rua E', 'BA', 'Salvador', 'Barra', 1005);

INSERT INTO endereco (logradouro, numero, bairro, cidade, uf, cep, cpf) VALUES
    ('Rua F', 101, 'Vila Mariana', 'São Paulo', 'SP', '87654321', '12345678901'),
    ('Rua G', 102, 'Botafogo', 'Rio de Janeiro', 'RJ', '76543210', '23456789012'),
    ('Rua H', 103, 'Lourdes', 'Belo Horizonte', 'MG', '65432109', '34567890123'),
    ('Rua I', 104, 'Tristeza', 'Porto Alegre', 'RS', '54321098', '45678901234'),
    ('Rua J', 105, 'Ondina', 'Salvador', 'BA', '43210987', '56789012345');

INSERT INTO telefone (telefone, cpf) VALUES
    ('11987654321', '12345678901'),
    ('21987654321', '23456789012'),
    ('31987654321', '34567890123'),
    ('41987654321', '45678901234'),
    ('51987654321', '56789012345');

INSERT INTO itemVenda (codigoProduto, idVenda, quantidade) VALUES
    (101, 1, 2),
    (102, 2, 1),
    (103, 3, 3),
    (104, 4, 1),
    (105, 5, 2);

INSERT INTO itemPedido (codigoProduto, numeroPedido, quantidade) VALUES
    (101, 1001, 2),
    (102, 1002, 1),
    (103, 1003, 3),
    (104, 1004, 1),
    (105, 1005, 2);

INSERT INTO BOLETO (numeroPedido, valorBoleto, dtVencimento, statusBoleto, dtPagamento) VALUES
    (1001, 190.00, '2024-07-01', 'Pendente', NULL),
    (1002, 135.00, '2024-07-02', 'Pago', '2024-07-02'),
    (1003, 200.00, '2024-07-03', 'Pendente', NULL),
    (1004, 212.50, '2024-07-04', 'Cancelado', NULL),
    (1005, 240.00, '2024-07-05', 'Pendente', NULL);



