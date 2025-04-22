-- 
-- -------- < aula4exer5Evolucao4 Popula > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 03/07/2024
-- Autor(es) ..............: Ana Beatriz Ferreira dos Santos, Felipe Amorim de Araújo e Isaque Santos
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--
-- ---------------------------------------------------------

USE aula4exer5Evolucao4;

INSERT INTO ESPECIALIDADE (nomeEspecialidade) VALUES
('Cardiologia'),
('Dermatologia'),
('Neurologia'),
('Ortopedia'),
('Pediatria'),
('Psiquiatria'),
('Radiologia'),
('Ginecologia'),
('Oncologia'),
('Endocrinologia');

INSERT INTO MEDICO (estado, nomeCompleto, idEspecialidade) VALUES
('SP', 'Dra. Ana Santos', 1),
('RJ', 'Dr. Felipe Araujo', 2),
('MG', 'Dr. Isaque Santos', 3),
('BA', 'Dr. João Silva', 4),
('PE', 'Dr. Pedro Almeida', 5),
('RS', 'Dra. Paula Costa', 6),
('PR', 'Dr. Ricardo Pereira', 7),
('SC', 'Dra. Fernanda Gomes', 8),
('ES', 'Dr. Marcelo Oliveira', 9),
('GO', 'Dra. Juliana Ribeiro', 10);

INSERT INTO PACIENTE (nomeCompleto, dt_nascimento, sexo, estado, cidade, cep, complemento) VALUES
('Carlos Silva', '1980-05-15', 'M', 'SP', 'São Paulo', '01001000', 'Apto 101'),
('Mariana Lima', '1992-07-20', 'F', 'RJ', 'Rio de Janeiro', '20020030', 'Casa 12'),
('João Pedro', '1985-10-10', 'M', 'MG', 'Belo Horizonte', '30130140', 'Apto 202'),
('Ana Clara', '1990-03-25', 'F', 'BA', 'Salvador', '40040050', 'Casa 34'),
('Pedro Henrique', '1975-12-01', 'M', 'PE', 'Recife', '50050060', 'Apto 303'),
('Paula Martins', '1988-09-30', 'F', 'RS', 'Porto Alegre', '90090070', 'Casa 56'),
('Ricardo Alves', '1983-06-18', 'M', 'PR', 'Curitiba', '80080080', 'Apto 404'),
('Fernanda Souza', '1995-11-05', 'F', 'SC', 'Florianópolis', '70070090', 'Casa 78'),
('Marcelo Rocha', '1978-08-08', 'M', 'ES', 'Vitória', '60060010', 'Apto 505'),
('Juliana Araújo', '1986-02-22', 'F', 'GO', 'Goiânia', '75075020', 'Casa 90');

INSERT INTO TELEFONE (idPaciente, telefone) VALUES
(1, '11999999991'),
(2, '21999999992'),
(3, '31999999993'),
(4, '71999999994'),
(5, '81999999995'),
(6, '51999999996'),
(7, '41999999997'),
(8, '11999999998'),
(9, '21999999999'),
(10, '31999999900');

INSERT INTO MEDICAMENTO (nomeMedicamento) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Aspirina'),
('Amoxicilina'),
('Omeprazol'),
('Loratadina'),
('Ranitidina'),
('Azitromicina'),
('Metformina'),
('Simvastatina');

INSERT INTO CONSULTA (dataConsulta, idPaciente, codigo, estado) VALUES
('2023-01-01', 1, 1, 'SP'),
('2023-02-15', 2, 2, 'RJ'),
('2023-03-10', 3, 3, 'MG'),
('2023-04-25', 4, 4, 'BA'),
('2023-05-30', 5, 5, 'PE'),
('2023-06-18', 6, 6, 'RS'),
('2023-07-22', 7, 7, 'PR'),
('2023-08-15', 8, 8, 'SC'),
('2023-09-10', 9, 9, 'ES'),
('2023-10-05', 10, 10, 'GO');

INSERT INTO RECEITA (descricao, idConsulta) VALUES
('Tomar 1 comprimido de Paracetamol a cada 8 horas por 5 dias', 1),
('Tomar 1 comprimido de Ibuprofeno a cada 6 horas por 7 dias', 2),
('Tomar 1 comprimido de Aspirina a cada 12 horas por 10 dias', 3),
('Tomar 1 comprimido de Amoxicilina a cada 8 horas por 7 dias', 4),
('Tomar 1 comprimido de Omeprazol a cada 24 horas por 14 dias', 5),
('Tomar 1 comprimido de Loratadina a cada 24 horas por 5 dias', 6),
('Tomar 1 comprimido de Ranitidina a cada 12 horas por 10 dias', 7),
('Tomar 1 comprimido de Azitromicina a cada 24 horas por 3 dias', 8),
('Tomar 1 comprimido de Metformina a cada 12 horas por 30 dias', 9),
('Tomar 1 comprimido de Simvastatina a cada 24 horas por 90 dias', 10);

INSERT INTO PRESCREVE (idMedicamento, idReceita) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);