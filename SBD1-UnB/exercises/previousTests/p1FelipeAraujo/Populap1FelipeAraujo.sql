USE felipeAraujo;

INSERT INTO PESSOA VALUES
('Felipe Amorim de Araújo', 07485613925, '2005-11-25'),
('José Alberto Alves', 06576896124, '2003-01-03');

INSERT INTO telefone VALUES
('(61) 99536-4359', 07485613925),
('(61) 99878-6754', 06576896124);

INSERT INTO UNIVERSIDADE VALUES
(91726385619275, 'Universidade de Brasília'),
(83498124812010, 'Universidade de Minas Gerais');

INSERT INTO enderecoPrincipal VALUES
('QNJ 208 Rua Central', 'Plano Piloto', 'Brasília', 'DF', 91726385619275),
('Quadra 987 Rua Patagá', 'Central', 'Belo Horizonte', 'MG', 83498124812010);

INSERT INTO CURSO (nomeCurso) VALUES
('Engenharia de Software'),
('Ciência da Computação');

INSERT INTO DOCENTE VALUES
('8912b89123ac2', '1985-10-25', 'Daniel Talles Silva', 75852642325),
('891273kjh8892', '1970-08-09', 'Alberto do Vale Amorim', 94762367834);

INSERT INTO ALUNO VALUES
('2022-06-06', 0, 75852642325, 07485613925, 91726385619275),
('2021-09-12', 1, 94762367834, 06576896124, 83498124812010);

