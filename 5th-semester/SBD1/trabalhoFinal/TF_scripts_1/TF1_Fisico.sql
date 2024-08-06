-- 
-- -------- < TF1 Físico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 03/06/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos e Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF1
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas

-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF1;
USE TF1;

CREATE TABLE MARCA (
    idMarca INT PRIMARY KEY AUTO_INCREMENT,
    nomeMarca VARCHAR(60) NOT NULL,
    porcentagemLucro DECIMAL(5,2) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE PRODUTO (
    codigoProduto INT PRIMARY KEY,
    nomeProduto VARCHAR(60) NOT NULL,
    precoProduto INT NOT NULL,
    ciclo DECIMAL(6,2) NOT NULL,
    dtValidade DATE NOT NULL,
    idMarca INT NOT NULL,
    FOREIGN KEY (idMarca) REFERENCES MARCA(idMarca)
) ENGINE = InnoDB;

CREATE TABLE ESTOQUE (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    codigoProduto INT NOT NULL,
    FOREIGN KEY (codigoProduto) REFERENCES PRODUTO(codigoProduto)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE CLIENTE (
    cpf VARCHAR(11) PRIMARY KEY,
    nomeCliente VARCHAR(60) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    dtVenda DATE NOT NULL,
    descontoAplicado DECIMAL(6,2) NOT NULL,
    cpfCliente VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpfCliente) REFERENCES CLIENTE(cpf)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE PARCELA (
    idParcela INT PRIMARY KEY AUTO_INCREMENT,
    valorParcela DECIMAL(6,2) NOT NULL,
    dtVencimento DATE NOT NULL,
    dtPagamento DATE,
    metodoPag VARCHAR(50) NOT NULL,
    jurosAplicados DECIMAL(5,2) NOT NULL,
    descontoAplicado DECIMAL(6,2) NOT NULL,
    idVenda INT NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES VENDA(idVenda)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

CREATE TABLE PEDIDO (
    numeroPedido INT PRIMARY KEY,
    ciclo INT NOT NULL,
    dtPedido DATE NOT NULL,
    statusPedido VARCHAR(20) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE localRetirada (
    cep VARCHAR(8) NOT NULL,
    numero INT NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    numeroPedido INT NOT NULL,
    FOREIGN KEY (numeroPedido) REFERENCES PEDIDO(numeroPedido)
) ENGINE = InnoDB;

CREATE TABLE endereco (
    logradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES CLIENTE(cpf)
) ENGINE = InnoDB;

CREATE TABLE telefone (
    telefone VARCHAR(15) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES CLIENTE(cpf)
) ENGINE = InnoDB;

CREATE TABLE itemVenda (
    codigoProduto INT NOT NULL,
    idVenda INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES VENDA(idVenda),
    FOREIGN KEY (codigoProduto) REFERENCES PRODUTO(codigoProduto)
) ENGINE = InnoDB;

CREATE TABLE itemPedido (
    codigoProduto INT NOT NULL,
    numeroPedido INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (numeroPedido) REFERENCES PEDIDO(numeroPedido),
    FOREIGN KEY (codigoProduto) REFERENCES PRODUTO(codigoProduto)
) ENGINE = InnoDB;

CREATE TABLE BOLETO (
    idBoleto INT PRIMARY KEY AUTO_INCREMENT,
    numeroPedido INT NOT NULL,
    valorBoleto DECIMAL(6,2) NOT NULL,
    dtVencimento DATE NOT NULL,
    statusBoleto VARCHAR(20) NOT NULL,
    dtPagamento DATE,
    FOREIGN KEY (numeroPedido) REFERENCES PEDIDO(numeroPedido)
) ENGINE = InnoDB AUTO_INCREMENT = 0;

