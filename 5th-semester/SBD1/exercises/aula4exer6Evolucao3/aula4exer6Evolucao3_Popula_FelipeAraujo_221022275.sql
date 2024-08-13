-- -------- < aula4exer6Evolucao3 Popula > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 08/05/2024
-- Autor(es) ..............: Felipe Amorim de Araújo
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------
-- BASE DE DADOS
USE aula4exer6Evolucao3;

INSERT INTO
  PROPRIETARIO
VALUES
  (50558627005, 'Maria da Silva', '1980-03-15', 'F'),
  (94153185035, 'José Santos', '1975-08-21', 'M'),
  (60539096024, 'Ana Oliveira', '1990-05-10', 'F'),
  (12345678901, 'João da Silva', '1980-03-15', 'M'),
  (23456789012, 'Maria Oliveira', '1975-08-22', 'F'),
  (34567890123, 'Carlos Santos', '1990-12-05', 'M');

INSERT INTO
  telefone
VALUES
  (50558627005, '(11) 91234-5678'),
  (94153185035, '(21) 98765-4321'),
  (60539096024, '(81) 99876-5432'),
  (12345678901, '(99) 99999-9999'),
  (23456789012, '(88) 98888-8888'),
  (34567890123, '(77) 97777-7777');

INSERT INTO
  endereco
VALUES
  (
    60539096024,
    'Boa Viagem',
    'Recife',
    'PE',
    51020000
  ),
  (
    50558627005,
    'Centro',
    'São Paulo',
    'SP',
    01010000
  ),
  (
    94153185035,
    'Copacabana',
    'Rio de Janeiro',
    'RJ',
    22070010
  ),
  (
    12345678901,
    'Centro',
    'São Paulo',
    'SP',
    12345678
  ),
  (
    23456789012,
    'Copacabana',
    'Rio de Janeiro',
    'RJ',
    23456789
  ),
  (
    34567890123,
    'Boa Viagem',
    'Recife',
    'PE',
    34567890
  );

INSERT INTO
  MODELO
VALUES
  (100001, 'Corolla'),
  (100002, 'HR-V'),
  (100003, 'Gol'),
  (100100, 'Gol'),
  (100200, 'Onix'),
  (100300, 'Corolla');

INSERT INTO
  CATEGORIA
VALUES
  (1, 'Sedan'),
  (2, 'SUV'),
  (3, 'Hatchback'),
  (4, 'Caminhonete'),
  (5, 'Coupé'),
  (6, 'Minivan');

INSERT INTO
  VEICULO
VALUES
  (
    'IQP7940',
    '4LS a90TS2 FN kTty',
    'Prata',
    2019,
    100001,
    1,
    50558627005
  ),
  (
    'KCS0834',
    '4F4 PA0lpT 9T dter',
    'Vermelho',
    2020,
    100002,
    2,
    94153185035
  ),
  (
    'LVJ8406',
    '84A CTSLvx XW 65ty',
    'Azul',
    2018,
    100003,
    3,
    60539096024
  ),
  (
    'ABC1234',
    '12345678901234567',
    'Prata',
    2018,
    100100,
    4,
    12345678901
  ),
  (
    'XYZ5678',
    '98765432109876543',
    'Preto',
    2020,
    100200,
    5,
    23456789012
  ),
  (
    'DEF9012',
    '45678901234567890',
    'Branco',
    2019,
    100300,
    6,
    34567890123
  );

INSERT INTO
  LOCAL
VALUES
  (56548, 60),
  (19819, 50),
  (87984, 70),
  (2001, 60),
  (2002, 50),
  (2003, 70);

INSERT INTO
  posicao
VALUES
  (56548, -23, -46),
  (19819, -22, -43),
  (87984, -25, -47),
  (2001, -23.5505, -46.6333),
  (2002, -22.9068, -43.1729),
  (2003, -8.0476, -34.8770);

INSERT INTO
  AGENTE
VALUES
  (300001, 'Lucas Silva', '2018-05-20'),
  (300056, 'Fernanda Oliveira', '2019-09-10'),
  (300043, 'Rafael Souza', '2020-03-15'),
  (123456789012345, 'Ana Silva', '2020-01-15'),
  (234567890123456, 'Pedro Santos', '2018-05-20'),
  (345678901234567, 'Mariana Oliveira', '2019-11-10');

INSERT INTO
  TIPOINFRACAO
VALUES
  (1001, 'Excesso de velocidade', 150.00),
  (1002, 'Estacionamento proibido', 200.00),
  (1003, 'Avanço de sinal vermelho', 250.00),
  (1004, 'Ultrapassagem em local proibido', 250.00),
  (1005, 'Dirigir usando celular', 180.00),
  (
    1006,
    'Estacionamento em local de carga e descarga',
    120.00
  );

INSERT INTO
  INFRACAO
VALUES
  (
    '2024-05-01 10:15:00',
    80,
    1001,
    56548,
    300001,
    'IQP7940'
  ),
  (
    '2024-05-02 12:30:00',
    55,
    1001,
    19819,
    300056,
    'KCS0834'
  ),
  (
    '2024-05-03 15:45:00',
    90,
    1003,
    87984,
    300043,
    'LVJ8406'
  ),
  (
    '2024-05-08 08:30:00',
    70,
    1001,
    2001,
    123456789012345,
    'ABC1234'
  ),
  (
    '2024-05-08 10:45:00',
    55,
    1001,
    2002,
    234567890123456,
    'XYZ5678'
  ),
  (
    '2024-05-08 12:15:00',
    80,
    1001,
    2003,
    345678901234567,
    'DEF9012'
  );