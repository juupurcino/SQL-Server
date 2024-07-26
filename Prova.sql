--create database provaSQL
use provaSQL

/*CREATE TABLE Colaborador(
EDV INT NOT NULL PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Lider  VARCHAR(255) NOT NULL,
DataContratacao DATETIME NOT NULL,
Salario FLOAT NOT NULL,
Departamento INT NOT NULL FOREIGN KEY REFERENCES Departamento(Departamento));

CREATE TABLE Departamento(
Departamento INT NOT NULL PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
Local int NOT NULL)

CREATE TABLE GradeSalarial(
Grade INT NOT NULL PRIMARY KEY,
Sal_Min INT NOT NULL,
Sal_Max INT NOT NULL)*/


/*INSERT INTO Departamento VALUES	
(1, 'REMAN', 104),
(2, 'ICO', 101),
(3, 'ETS', 401),
(4, 'FCM', 303),
(5, 'INOVE', 303);


INSERT INTO Colaborador VALUES 
(92890148, 'Edna Carvalho', 'Andrea', '1990-02-24', 19000, 1),
(92790062, 'João Manfredo', 'Andrea', '2001-09-26', 12500, 1),
(91004090, 'Débora Junior', 'Andrea', '1999-03-02', 15600, 1),
(94566222, 'Carla Rodrigues', 'Andrea', '1990-10-04', 20000, 1),
(96334100, 'Maciel Oliveira', 'Andrea', '1995-12-06', 16500, 1),
(97885245, 'Guilherme Gonçalves', 'Marcos', '2010-05-13', 9000, 2),
(92894706, 'Jessica Lima', 'Marcos', '2015-08-14', 25678, 2),
(91450032, 'Isabella Machado', 'Marcos', '1993-01-22', 10900, 2),
(94661932, 'Carlo Daniel', 'Lucio', '1990-01-31', 13750, 2),
(95780634, 'Maria Santana', 'Lucio', '2015-09-05', 8000, 2),
(97881945, 'Dominic Ferreira', 'Pietra', '2020-02-09', 2000, 3),
(98490620, 'Daniela Silva', 'Pietra', '2020-02-09', 1500, 3),
(96854299, 'Felipe Augusto', 'Pietra', '2020-02-09', 1600, 3),
(97805503, 'Natalia Reis', 'Pietra', '2019-06-14', 2200, 3),
(90103456, 'Thiago Dias', 'Pietra', '2018-08-24', 2800, 3),
(98462157, 'Lorena Ray', 'Pietra', '2017-02-25', 1900, 3),
(95482340, 'Natanael Brasil', 'Pietra', '2020-06-03', 3500, 3),
(96314782, 'Ana Mass', 'Captu', '1997-02-19', 3600, 4),
(97854318, 'Otávio Luis', 'Captu', '2017-05-19', 9200, 4),
(94862122, 'Luisa Otávia', 'Captu', '2002-11-11', 10500, 4),
(97864320, 'Lucas Moura', 'Captu', '1990-08-29', 6600, 4),
(96315782, 'Fernanda Lacerda', 'Captu', '1999-12-17', 2900, 4),
(97546210, 'Caroline Adeus', 'Captu', '2018-02-19', 4555, 4),
(94621573, 'Marco Valastro', 'Captu', '2003-03-30', 7000, 4),
(96548432, 'Valdemir Cantante', 'Jonas', '2020-03-15', 1200, 5),
(97511020, 'Eduarda Souza', 'Jonas', '2011-08-14', 1100, 5),
(96410654, 'Allan Jonas', 'Felipe', '2008-06-17', 3200, 5),
(95645012, 'Diana Jones', 'Felipe', '2002-09-24', 2050, 5),
(94746054, 'Mario Bros', 'Felipe', '1990-01-18', 25600, 5),
(92085478, 'Aline Franco', 'Jonas', '1996-05-05', 3700, 5);

INSERT INTO GradeSalarial VALUES	
(1, 1500, 4000),
(2, 4001, 9000),
(3, 9001, 22000),
(4, 22001, 50000);*/

-- EXERCICÍO 4

/*select
	D.nome 'Departamento',
	MIN(C.Salario)  'Salário Minimo',
	MAX(C.Salario) 'Salário Maximo',
	Sum(C.Salario) / 5 'Media Salarial'
from Departamento D
inner join Colaborador C on C.Departamento = D.Departamento
group by D.Nome*/

-- EXERCÍCIO 5

/*create function fSalarioDepartamento (@Salario float)
returns table as 
return(select 
	D.Nome 'Nome do Setor',
	COUNT(C.Departamento) 'Quantidade de funcionários'
from 
	Departamento D
inner join Colaborador C on  C.Departamento = D.Departamento
where c.salario > @Salario
group by d.nome)

select  * from fSalarioDepartamento(20000)*/

-- EXERCÍCIO 6

select 
	C.nome,
	C.Lider,
	format(C.DataContratacao, 'DD-MM-yyyy') 'Data Contratação'

from Colaborador C 

where year(C.DataContratacao) in (select grade from GradeSalarial where Sal_Min >= C.Salario and C.Salario <= Sal_Max)

--EXERCÍCIO 7
 
/*ALTER TABLE Colaborador 
ADD Ativo BIT;

UPDATE Colaborador 
set Ativo = 1*/

/*create trigger triggersete on colaborador
instead of delete as 
begin
	
	declare @edv 
	select @edv = edv
	update colaborador set ativo = 0 where @edv = edv

select * from colaborador*/

-- EXERCÍCIO 8

/*select 
	c.nome 'Nome',
	case when c.ativo = 1 then 'Ativo'
	else 'Inativo' end as 'Atual'
from Colaborador c
where c.nome like 'd%'*/

-- EXERCÍCIO 9

delete from Colaboradores where lider = 'Jonas'

select salario
	(select 
		sum(salario) / count(lider like 'Jonas')
	from colaboradores 
from colaborador 
where lider = 'Jonas'

if @@ERROR <> 0
	ROLLBACK
else
	commit
