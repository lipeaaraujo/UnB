-- 
-- -------- < TF1H Popula > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 03/06/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos, Felipe Amorim de Araújo e Isaque Santos
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_1H_felipearaujo
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--         => 03 Perfis (role)
--         => 06 Usuarios
--
-- Ultimas Alteracoes
--   19/06/2024 => Adiciona mais 5 tuplas para cada tabela
-- ---------------------------------------------------------

USE TF_1H_felipearaujo;

INSERT INTO MARCA (nomeMarca, porcentagemLucro) VALUES
    ('Marca Natura', 10.00),
    ('Marca Avon', 15.00),
    ('Marca L\'Oréal', 12.50),
    ('Marca O Boticário', 8.75),
    ('Marca Maybelline', 20.00),
    ('Marca Mary Kay', 11.00),
    ('Marca Eudora', 14.00),
    ('Marca Jequiti', 13.50),
    ('Marca Ruby Rose', 10.75),
    ('Marca MAC', 18.00);

INSERT INTO PRODUTO (codigoProduto, nomeProduto, precoProduto, ciclo, dtValidade, idMarca) VALUES
    (101, 'Batom Matte', 100, 1.50, '2024-12-31', 1),
    (102, 'Perfume Eau de Parfum', 150, 2.00, '2025-06-30', 2),
    (103, 'Creme Hidratante', 200, 1.75, '2024-11-30', 3),
    (104, 'Shampoo Revitalizante', 250, 2.50, '2025-01-31', 4),
    (105, 'Máscara de Cílios', 300, 1.25, '2024-09-30', 5),
    (106, 'Base Líquida', 350, 2.25, '2025-02-28', 6),
    (107, 'Delineador Líquido', 80, 1.60, '2024-10-31', 7),
    (108, 'Loção Corporal', 180, 1.85, '2024-12-31', 8),
    (109, 'Pó Compacto', 220, 2.10, '2025-03-31', 9),
    (110, 'Esmalte', 60, 1.30, '2024-11-30', 10);


INSERT INTO ESTOQUE (quantidade, codigoProduto) VALUES
    (50, 101),
    (30, 102),
    (40, 103),
    (20, 104),
    (10, 105),
    (45, 106),
    (35, 107),
    (50, 108),
    (25, 109),
    (15, 110);


INSERT INTO CLIENTE (cpf, nomeCliente) VALUES
    ('12345678901', 'Ana Maria Silva'),
    ('23456789012', 'Bruno Costa'),
    ('34567890123', 'Carla Ferreira'),
    ('45678901234', 'Daniel Souza'),
    ('56789012345', 'Eliana Santos'),
    ('67890123456', 'Fabio Alves'),
    ('78901234567', 'Gabriela Martins'),
    ('89012345678', 'Hugo Pereira'),
    ('90123456789', 'Isabela Oliveira'),
    ('01234567890', 'Julio Mendes');

INSERT INTO VENDA (dtVenda, descontoAplicado, cpfCliente) VALUES
    ('2024-06-01', 5.00, '12345678901'),
    ('2024-06-02', 10.00, '23456789012'),
    ('2024-06-03', 0.00, '34567890123'),
    ('2024-06-04', 15.00, '45678901234'),
    ('2024-06-05', 20.00, '56789012345'),
    ('2024-06-06', 5.00, '67890123456'),
    ('2024-06-07', 10.00, '78901234567'),
    ('2024-06-08', 0.00, '89012345678'),
    ('2024-06-09', 15.00, '90123456789'),
    ('2024-06-10', 20.00, '01234567890');

INSERT INTO PARCELA (valorParcela, dtVencimento, dtPagamento, metodoPag, jurosAplicados, descontoAplicado, idVenda) VALUES
    (95.00, '2024-07-01', NULL, 'Cartão de Crédito', 1.50, 5.00, 1),
    (135.00, '2024-07-02', '2024-07-02', 'Boleto', 1.00, 10.00, 2),
    (200.00, '2024-07-03', NULL, 'Pix', 0.00, 0.00, 3),
    (212.50, '2024-07-04', '2024-07-04', 'Cartão de Débito', 1.25, 15.00, 4),
    (240.00, '2024-07-05', NULL, 'Transferência Bancária', 2.00, 20.00, 5),
    (70.00, '2024-07-06', NULL, 'Cartão de Crédito', 1.25, 5.00, 6),
    (108.00, '2024-07-07', '2024-07-07', 'Boleto', 1.50, 10.00, 7),
    (185.00, '2024-07-08', NULL, 'Pix', 0.00, 0.00, 8),
    (195.00, '2024-07-09', '2024-07-09', 'Cartão de Débito', 1.75, 15.00, 9),
    (210.00, '2024-07-10', NULL, 'Transferência Bancária', 2.25, 20.00, 10);


INSERT INTO PEDIDO (numeroPedido, ciclo, dtPedido, statusPedido) VALUES
    (1001, 30, '2024-06-01', 'Pendente'),
    (1002, 60, '2024-06-02', 'Pago'),
    (1003, 45, '2024-06-03', 'Pendente'),
    (1004, 30, '2024-06-04', 'Cancelado'),
    (1005, 90, '2024-06-05', 'Pendente'),
    (1006, 30, '2024-06-06', 'Pendente'),
    (1007, 60, '2024-06-07', 'Pago'),
    (1008, 45, '2024-06-08', 'Pendente'),
    (1009, 30, '2024-06-09', 'Cancelado'),
    (1010, 90, '2024-06-10', 'Pendente');


INSERT INTO localRetirada (cep, numero, logradouro, uf, cidade, bairro, numeroPedido) VALUES
    ('12345678', 100, 'Rua A', 'SP', 'São Paulo', 'Jardins', 1001),
    ('23456789', 200, 'Rua B', 'RJ', 'Rio de Janeiro', 'Copacabana', 1002),
    ('34567890', 300, 'Rua C', 'MG', 'Belo Horizonte', 'Savassi', 1003),
    ('45678901', 400, 'Rua D', 'RS', 'Porto Alegre', 'Moinhos de Vento', 1004),
    ('56789012', 500, 'Rua E', 'BA', 'Salvador', 'Barra', 1005),
    ('67890123', 600, 'Rua K', 'SP', 'São Paulo', 'Moema', 1006),
    ('78901234', 700, 'Rua L', 'RJ', 'Rio de Janeiro', 'Ipanema', 1007),
    ('89012345', 800, 'Rua M', 'MG', 'Belo Horizonte', 'Centro', 1008),
    ('90123456', 900, 'Rua N', 'RS', 'Porto Alegre', 'Centro Histórico', 1009),
    ('01234567', 1000, 'Rua O', 'BA', 'Salvador', 'Rio Vermelho', 1010);

INSERT INTO endereco (logradouro, numero, bairro, cidade, uf, cep, cpf) VALUES
    ('Rua F', 101, 'Vila Mariana', 'São Paulo', 'SP', '87654321', '12345678901'),
    ('Rua G', 102, 'Botafogo', 'Rio de Janeiro', 'RJ', '76543210', '23456789012'),
    ('Rua H', 103, 'Lourdes', 'Belo Horizonte', 'MG', '65432109', '34567890123'),
    ('Rua I', 104, 'Tristeza', 'Porto Alegre', 'RS', '54321098', '45678901234'),
    ('Rua J', 105, 'Ondina', 'Salvador', 'BA', '43210987', '56789012345'),
    ('Rua P', 106, 'Pinheiros', 'São Paulo', 'SP', '87654322', '67890123456'),
    ('Rua Q', 107, 'Leblon', 'Rio de Janeiro', 'RJ', '76543211', '78901234567'),
    ('Rua R', 108, 'Santa Efigênia', 'Belo Horizonte', 'MG', '65432108', '89012345678'),
    ('Rua S', 109, 'Menino Deus', 'Porto Alegre', 'RS', '54321097', '90123456789'),
    ('Rua T', 110, 'Amaralina', 'Salvador', 'BA', '43210986', '01234567890');

INSERT INTO telefone (telefone, cpf) VALUES
    ('11987654321', '12345678901'),
    ('21987654321', '23456789012'),
    ('31987654321', '34567890123'),
    ('41987654321', '45678901234'),
    ('51987654321', '56789012345'),
    ('61987654321', '67890123456'),
    ('71987654321', '78901234567'),
    ('81987654321', '89012345678'),
    ('91987654321', '90123456789'),
    ('11987654322', '01234567890');

INSERT INTO itemVenda (codigoProduto, idVenda, quantidade) VALUES
    (101, 1, 2),
    (102, 2, 1),
    (103, 3, 3),
    (104, 4, 1),
    (105, 5, 2),
    (106, 6, 1),
    (107, 7, 2),
    (108, 8, 1),
    (109, 9, 1),
    (110, 10, 3);

INSERT INTO itemPedido (codigoProduto, numeroPedido, quantidade) VALUES
    (101, 1001, 2),
    (102, 1002, 1),
    (103, 1003, 3),
    (104, 1004, 1),
    (105, 1005, 2),
    (106, 1006, 1),
    (107, 1007, 2),
    (108, 1008, 1),
    (109, 1009, 1),
    (110, 1010, 3);

INSERT INTO BOLETO (numeroPedido, valorBoleto, dtVencimento, statusBoleto, dtPagamento) VALUES
    (1001, 190.00, '2024-07-01', 'Pendente', NULL),
    (1002, 135.00, '2024-07-02', 'Pago', '2024-07-02'),
    (1003, 200.00, '2024-07-03', 'Pendente', NULL),
    (1004, 212.50, '2024-07-04', 'Cancelado', NULL),
    (1005, 240.00, '2024-07-05', 'Pendente', NULL),
    (1006, 175.00, '2024-07-06', 'Pendente', NULL),
    (1007, 216.00, '2024-07-07', 'Pago', '2024-07-07'),
    (1008, 185.00, '2024-07-08', 'Pendente', NULL),
    (1009, 195.00, '2024-07-09', 'Cancelado', NULL),
    (1010, 210.00, '2024-07-10', 'Pendente', NULL);