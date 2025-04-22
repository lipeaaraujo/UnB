--
-- -------- < TF_Tema1 Popula > --------
--
--                    SCRIPT DE POPULAÇÃO (DML)
--
-- Data Criacao ...........: 16/06/2024
-- Autor(es) ..............: Bruno Oliveira, Eduardo Silva, Carlos Alves, Lucas Gabriel, Guilherme Dutra, Flávio Melo, Carlos Rodrigues,
--                           Bruno Araújo, Gabriel Santos, Eduardo Sandes, Arthur Silva, Caio Braga, Ian Mesquita, Artur Fontinele, Artur Bartz,
--                           André Silva, Harryson Martins, Hugo Melo, Gabryel Sousa, Danilo Melo, Caio Rodrigues, Cássio Reis, Diego Leite,
--                           Cauã Corrêa, Felipe Araújo, Ana Santos, Isaque Santos, Gabriel Alencar, Breno Gomes
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_tema1
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--         => 02 Perfis (roles)
--         => 06 Usuarios 
--
-- Ultimas Alteracoes
--   16/06/2024 => inserção de tuplas para as entidades PEDIDOCLIENTE, VENDA e FORMAPAGAMENTO
--              => remoção das tuplas das tabelas inclui e compra
--              => atualização das inserções de PEDIDO para PEDIDOMARCA
--              => atualização do endereço de cliente
--   21/06/2024 => inserção de tuplas para as entidades PARCELA
--
-- ----------------------------------------------------

USE TF_tema1;

INSERT INTO MARCA (idMarca, nome, email) VALUES
(1, 'Natura', 'contato@natura.com'),
(2, 'Avon', 'contato@avon.com'),
(3, 'Boticário', 'contato@boticario.com'),
(4, 'Eudora', 'contato@eudora.com'),
(5, 'Hinode', 'contato@hinode.com'),
(6, 'Jequiti', 'contato@jequiti.com'),
(7, 'Mary Kay', 'contato@marykay.com'),
(8, 'Loccitane', 'contato@loccitane.com'),
(9, 'Sephora', 'contato@sephora.com'),
(10, 'Dove', 'contato@dove.com');

INSERT INTO telefoneMarca (idMarca, telefone) VALUES
(1, '61999134351'),
(2, '61998234567'),
(3, '61997345678'),
(4, '61996456789'),
(5, '61995567890'),
(6, '61982653291'),
(7, '61988442211'),
(8, '61984319130'),
(9, '61992412903'),
(10, '61994678903');

INSERT INTO PRODUTO (codigoProduto, nomeProduto, idMarca) VALUES
(871992873, 'Kaiak', 1),
(82190312, 'Far Away', 2),
(98717938, 'Malbec', 3),
(91823712, 'Luna', 1),
(18723812, 'Luminata', 2),
(56841683, 'Essencial', 2),
(98766215, 'Uomini', 4),
(54654138, 'Celso Portiolli', 6),
(29784165, 'Portinari', 3),
(09827163, 'Eudora Soul', 4);

INSERT INTO CLIENTE (idCliente, nome, rua, complemento, numero, bairro, cidade, uf) VALUES
(1, 'Carlos Silva', 'Rua A', 'Apto 12', 102, 'Asa Norte', 'Brasília', 'DF'),
(2, 'Mariana Alves', 'Rua B', 'Casa 7', 305, 'Asa Sul', 'Brasília', 'DF'),
(3, 'João Pereira','Rua C', 'Bloco 3', 408, 'Sudoeste', 'Brasília', 'DF'),
(4, 'Ana Souza','Rua D', 'Casa 18', 501, 'Lago Sul', 'Brasília', 'DF'),
(5, 'Rafael Oliveira','Rua E', 'Apto 23', 202, 'Lago Norte', 'Brasília', 'DF'),
(6, 'Luciana Ferreira', 'Rua G', 'Casa 9', 610, 'Águas Claras', 'Brasília', 'DF'),
(7, 'Pedro Costa', 'Rua H', 'Apto 5', 710, 'Taguatinga', 'Brasília', 'DF'),
(8, 'Julia Santos', 'Rua I', 'Casa 3', 808, 'Ceilândia', 'Brasília', 'DF'),
(9, 'Roberto Lima', 'Rua J', 'Bloco 2', 902, 'Guará', 'Brasília', 'DF'),
(10, 'Fernanda Ribeiro', 'Rua K', 'Casa 11', 1001, 'Sobradinho', 'Brasília', 'DF');

INSERT INTO telefoneCliente (idCliente, telefone) VALUES
(1, '61999134351'),
(2, '61998234567'),
(3, '61997345678'),
(4, '61996456789'),
(5, '61995567890'),
(6, '61982653291'),
(6, '61988442211'),
(7, '61984319130'),
(7, '61992412903'),
(8, '61994678903'),
(10, '61994678901');

INSERT INTO FORMAPAGAMENTO (idPagamento, nome, taxa) VALUES
(1, 'Cartão de Crédito', 20.00),
(2, 'Cartão de Débito', 10.00),
(3, 'Boleto Bancário', 10.00),
(5, 'Dinheiro', 0),
(6, 'Pix', 0),
(7, 'Voucher', 10.00),
(8, 'Cheque', 0),
(9, 'NFT', 0),
(10, 'BITCOIN', 0);

INSERT INTO PEDIDOMARCA (idPedidoMarca, dataHora) VALUES
(1, '2024-12-31 14:30:00'),
(2, '2024-07-15 09:45:00'),
(3, '2024-11-20 17:00:00'),
(4, '2024-09-10 12:15:00'),
(5, '2024-03-05 08:00:00'),
(6, '2024-01-30 19:45:00'),
(7, '2024-02-15 14:30:00'),
(8, '2024-03-10 09:15:00'),
(9, '2024-04-05 18:00:00'),
(10, '2024-05-20 12:45:00');

INSERT INTO ITEM (idItem, codigoProduto, valorCompra, validade, idPedidoMarca) VALUES
(1, 98717938, 157.99, '2025-12-28', 1),
(2, 18723812, 89.99, '2026-05-25', 1),
(3, 09827163, 69.99, '2026-08-12', 2),
(4, 82190312, 187.00, '2025-11-30', 3),
(5, 91823712, 250.00, '2027-04-01', 6),
(6, 98717938, 160.00, '2025-09-10', 5),
(7, 871992873, 199.90, '2025-01-05', 10),
(8, 29784165, 130.00, '2025-12-23', 9),
(9, 56841683, 99.90, '2026-11-12', 8),
(10, 98766215, 129.90, '2026-09-12', 7),
(11, 29784165, 140.90, '2026-02-21', 4),
(12, 98717938, 189.90, '2025-08-29', 7),
(13, 98766215, 135.90, '2025-12-10', 5),
(14, 91823712, 280.90, '2024-12-25', 7),
(15, 98766215, 150.00, '2025-01-01', 6),
(16, 54654138, 200.00, '2026-02-21', 7);

INSERT INTO PEDIDOCLIENTE (idPedidoCliente, desconto, dataHora, idCliente) VALUES
(1, 0, '2023-11-10 12:27:51', 1),
(2, 5.00, '2024-04-15 11:45:22', 1),
(3, 0, '2023-04-20 15:45:19', 3),
(4, 10.00, '2023-12-10 12:15:01', 4),
(5, 0, '2023-10-05 16:00:30', 7),
(6, 0, '2023-12-05 10:00:30', 6),
(7, 0, '2022-10-05 20:19:30', 9),
(8, 0, '2023-10-05 13:13:30', 8),
(9, 0, '2024-05-18 18:30:30', 10),
(10, 0, '2024-01-01 17:28:12', 2);

INSERT INTO VENDA (idVenda, valorVenda, idItem, idPedidoCliente) VALUES 
(1, 200.00, 1, 3),
(2, 231.90, 4, 1),
(3, 200.00, 8, 4),
(4, 230.00, 7, 2),
(5, 125.00, 2, 5),
(6, 150.00, 9, 6),
(7, 179.99, 10, 7),
(8, 250.00, 12, 8),
(9, 180.00, 13, 10),
(10, 180.00, 11, 9),
(11, 350.00, 14, 4),
(12, 260.00, 6, 4);

INSERT INTO PARCELA (numParcela, idPedidoCliente, dataPagamento, dataVencimento, valorParcela, idPagamento) VALUES
(1, 1, '2024-06-30', '2024-07-30', 100.00, 1),
(2, 1, '2024-07-30', '2024-08-30', 100.00, 1),
(1, 2, '2024-05-30', '2024-06-30', 115.95, 1),
(2, 2, '2024-06-30', '2024-07-30', 115.95, 1),
(1, 3, '2024-05-01', '2024-06-01', 200.00, 2),
(1, 4, '2024-07-01', '2024-08-01', 230.00, 3),
(1, 5, '2024-06-15', '2024-07-15', 125.00, 5),
(1, 6, '2024-04-20', '2024-05-20', 150.00, 6),
(1, 7, '2024-03-30', '2024-04-30', 179.99, 7),
(1, 8, '2024-04-11', '2024-05-11', 250.00, 8),
(1, 9, '2024-01-01', '2024-02-01', 180.00, 9),
(1, 10, '2024-05-10', '2024-06-10', 180.00, 10);



