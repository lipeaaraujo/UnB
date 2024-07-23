-- 
-- -------- < aula4exer5Evolucao4 Consultas > --------
--
--                    SCRIPT DE CONSULTAS (DML)
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

use aula4exer5Evolucao4;

# A) Apresentar todos os dados dos médicos de uma determinada especialidade fornecida pelo usuário
create view medicos_especialidade as
select codigo, nomeCompleto, m.idEspecialidade, nomeEspecialidade, estado
from MEDICO as m
inner join ESPECIALIDADE as e
on m.idEspecialidade = e.idEspecialidade;

select * from medicos_especialidade
where nomeEspecialidade = '';

# B) Consultar paciente(s) por qualquer parte do nome fornecido pelo usuário
set @nomePesquisa = 'Mar';
select * from PACIENTE
where nomeCompleto like concat('%', @nomePesquisa, '%');

# C) Mostrar o médico e o nome do paciente que tiveram consultas em uma data ou período de data no padrão DE... ATÉ...;
select m.codigo, m.nomeCompleto, p.nomeCompleto
from CONSULTA as c
inner join MEDICO as m
on m.codigo = c.codigo
inner join PACIENTE as p
on p.idPaciente = c.idConsulta
where c.dataConsulta between '2023-04-01' and '2023-07-31';

# D) Pesquisar quantos médicos existem por especialidade em todas as especialidades cadastradas no sistema, inclusive naquelas especialidades que estiverem faltando médicos
select nomeEspecialidade, COUNT(codigo)
from ESPECIALIDADE
left join MEDICO on ESPECIALIDADE.idEspecialidade = MEDICO.idEspecialidade
group by nomeEspecialidade;
