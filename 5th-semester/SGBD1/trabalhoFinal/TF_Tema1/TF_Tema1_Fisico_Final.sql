--
-- -------- < TF_Tema1 Fisico > --------
--
--                    SCRIPT DE CRIAÇÃO (DML)
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
--   16/06/2024 => criação das entidades PEDIDOCLIENTE, VENDA e FORMAPAGAMENTO
--              => remoção das tabelas inclui e compra
--              => atualização da entidade PEDIDO para PEDIDOMARCA
--              => atualização do endereço de cliente
--   21/06/2024 => criação das entidade PARCELA
--              => remoção do relacionamento de FORMAPAGAMENTO com PEDIDOCLIENTE e adiciona com PARCELA
--              => adição de CONSTRAINTS UNIQUE em telefone, PEDIDOMARCA e PEDIDOCLIENTE
--   04/07/2024 => criação da tabela telefoneMarca
--              => adição do campo UF em CLIENTE
--              => remoção do NOT NULL em dataPagamento em PARCELA
--
-- ----------------------------------------------------
CREATE DATABASE IF NOT EXISTS TF_tema1;

USE TF_tema1;

CREATE TABLE MARCA (
    idMarca INT (2) NOT NULL auto_increment,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT MARCA_PK PRIMARY KEY (idMarca)
) engine = InnoDB auto_increment = 1;

CREATE TABLE telefoneMarca (
    idMarca INT (2) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    CONSTRAINT telefoneMarca_CLIENTE_FK FOREIGN KEY (idMarca) REFERENCES MARCA (idMarca),
    CONSTRAINT telefoneMarca_UK UNIQUE (idMarca, telefone)
)engine = InnoDB;

CREATE TABLE PRODUTO (
    codigoProduto INT (9) NOT NULL,
    nomeProduto VARCHAR (100) NOT NULL,
    idMarca INT (2) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigoProduto),
    CONSTRAINT PRODUTO_MARCA_FK FOREIGN KEY (idMarca) REFERENCES MARCA (idMarca) ON UPDATE CASCADE ON DELETE RESTRICT
)engine = InnoDB;

CREATE TABLE CLIENTE (
    idCliente INT (6) NOT NULL auto_increment,
    nome VARCHAR (100) NOT NULL,
    rua VARCHAR (100),
    complemento VARCHAR (100),
    numero INT (6),
    bairro VARCHAR (100),
    cidade VARCHAR (100),
    uf VARCHAR (2),
    CONSTRAINT CLIENTE_PK PRIMARY KEY (idCliente)
)engine = InnoDB auto_increment = 1;

CREATE TABLE FORMAPAGAMENTO (
    idPagamento INT (6) NOT NULL auto_increment,
    nome VARCHAR (100) NOT NULL,
    taxa DECIMAL (4,2) NOT NULL DEFAULT 0.0,
    CONSTRAINT FORMAPAGAMENTO_PK PRIMARY KEY (idPagamento)
)engine = InnoDB auto_increment = 1;

CREATE TABLE PEDIDOMARCA (
    idPedidoMarca INT (10) NOT NULL auto_increment,
    dataHora DATETIME NOT NULL,
    CONSTRAINT PEDIDOMARCA_PK PRIMARY KEY (idPedidoMarca),
    CONSTRAINT PEDIDOMARCA_UK UNIQUE (dataHora)
)engine = InnoDB auto_increment = 1;

CREATE TABLE PEDIDOCLIENTE (
    idPedidoCliente INT (10) NOT NULL auto_increment,
    dataHora DATETIME NOT NULL,
    idCliente INT (6) NOT NULL,
    desconto  DECIMAL (4,2) NOT NULL DEFAULT 0.0,
    CONSTRAINT PEDIDCLIENTE_PK PRIMARY KEY (idPedidoCliente),
    CONSTRAINT PEDIDOCLIENTE_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente)  ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT PEDIDOCLIENTE_UK UNIQUE (dataHora)
)engine = InnoDB auto_increment = 1;

CREATE TABLE ITEM (
    idItem INT (6) NOT NULL auto_increment,
    valorCompra DECIMAL (6,2) NOT NULL,
    validade DATE NOT NULL,
    codigoProduto INT (9) NOT NULL,
    idPedidoMarca INT (10) NOT NULL,
    CONSTRAINT ITEM_PK PRIMARY KEY (idItem),
    CONSTRAINT ITEM_PRODUTO_FK FOREIGN KEY (codigoProduto) REFERENCES PRODUTO (codigoProduto) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ITEM_PEDIDOMARCA_FK FOREIGN KEY (idPedidoMarca) REFERENCES  PEDIDOMARCA (idPedidoMarca) ON UPDATE CASCADE ON DELETE RESTRICT
)engine = InnoDB auto_increment = 1;

CREATE TABLE telefoneCliente (
    idCliente INT (6) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    CONSTRAINT telefoneCliente_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente),
    CONSTRAINT telefoneCliente_UK UNIQUE (idCliente, telefone)
)engine = InnoDB;

CREATE TABLE VENDA (
    idVenda INT (6) NOT NULL auto_increment,
    valorVenda DECIMAL (6,2) NOT NULL,
    idItem INT (6) NOT NULL,
    idPedidoCliente INT (6) NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_PEDIDOCLIENTE_FK FOREIGN KEY (idPedidoCliente) REFERENCES  PEDIDOCLIENTE (idPedidoCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT VENDA_ITEM_FK FOREIGN KEY (idItem) REFERENCES ITEM (idItem) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT VENDA_UK UNIQUE (idItem)
)engine = InnoDB auto_increment = 1;

CREATE TABLE PARCELA (
	numParcela INT (2) NOT NULL,
    idPedidoCliente INT (10) NOT NULL, 
	dataPagamento DATE,
    dataVencimento DATE NOT NULL,
    valorParcela DECIMAL(6,2) NOT NULL,
    idPagamento INT (6) NOT NULL,
    CONSTRAINT PARCELA_PK PRIMARY KEY (numParcela, idPedidoCliente),
    CONSTRAINT PARCELA_PEDIDOCLIENTE_FK FOREIGN KEY (idPedidoCliente) REFERENCES PEDIDOCLIENTE (idPedidoCliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT PEDIDOCLIENTE_FORMAGAMENTO_FK FOREIGN KEY (idPagamento) REFERENCES  FORMAPAGAMENTO (idPagamento)  ON UPDATE CASCADE ON DELETE RESTRICT
) engine=InnoDB;