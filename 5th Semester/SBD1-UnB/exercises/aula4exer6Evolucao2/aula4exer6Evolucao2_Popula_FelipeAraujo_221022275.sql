USE aula4exer6Evolucao2;

INSERT INTO
  PROPRIETARIO
VALUES
  (
    50558627005,
    'Maria da Silva',
    'Centro',
    'São Paulo',
    'SP',
    01010000,
    'F',
    '1980-03-15'
  ),
  (
    94153185035,
    'José Santos',
    'Copacabana',
    'Rio de Janeiro',
    'RJ',
    22070010,
    'M',
    '1975-08-21'
  ),
  (
    60539096024,
    'Ana Oliveira',
    'Boa Viagem',
    'Recife',
    'PE',
    51020000,
    'F',
    '1990-05-10'
  );

INSERT INTO
  telefone
VALUES
  (50558627005, '(11) 91234-5678'),
  (94153185035, '(21) 98765-4321'),
  (60539096024, '(81) 99876-5432');

INSERT INTO
  CATEGORIA
VALUES
  (1, 'Sedan'),
  (2, 'SUV'),
  (3, 'Hatchback');

INSERT INTO
  MODELO
VALUES
  (100001, 'Corolla'),
  (100002, 'HR-V'),
  (100003, 'Gol');

INSERT INTO
  VEICULO
VALUES
  (
    'IQP7940',
    '4LS a90TS2 FN kT32',
    'Prata',
    2019,
    100001,
    1,
    50558627005
  ),
  (
    'KCS0834',
    '4F4 PA0lpT 9T dt74',
    2020,
    100002,
    2,
    94153185035
  ),
  (
    'LVJ8406',
    '84A CTSLvx XW 6540',
    'Azul',
    2018,
    100003,
    3,
    60539096024
  );

INSERT INTO
  TIPOINFRACAO
VALUES
  (1001, 'Excesso de velocidade', 150.00),
  (1002, 'Estacionamento proibido', 200.00),
  (1003, 'Avanço de sinal vermelho', 250.00);

INSERT INTO
  LOCAL
VALUES
  (56548, -23, -46, 60),
  (19819, -22, -43, 50),
  (87984, -25, -47, 70);

INSERT INTO
  AGENTE
VALUES
  (300001, 'Lucas Silva', '2018-05-20'),
  (300056, 'Fernanda Oliveira', '2019-09-10'),
  (300043, 'Rafael Souza', '2020-03-15');

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