use aula
go
--------------------------------- Juntando dados ------------------------------

-- EVENTO|SALA
/*select * from evento E -- Apelido
	left join sala S -- Junta evento com sala 
	on E.IDSala = S.IDSala -- idsala da tabela evento e id sala da tabela sala*/

--------------------------------- Selecionando colunas especificas  ------------------------------
/*select 
	E.Descricao 'Nome do Evento',
	S.Nome 'Nome da sala',
	S.Capacidade
from 
	evento E 
	left join sala S 
	on E.IDSala = S.IDSala*/

--------------------------------- Formatando datas  -------------------------------- 
/*select  getdate()

select
	CONVERT (NVARCHAR (10), GETDATE(), 103) AS DATA,
	CONVERT (NVARCHAR (5), GETDATE(), 108) AS HORA*/


/*select 
	Evento.IDEvento,
	Evento.Descricao 'Descrição do Evento',
	CONVERT (NVARCHAR (10), Evento.DtHrInicio, 103) AS 'Data Inicio',
	CONVERT (NVARCHAR (5), Evento.DtHrInicio, 108) AS 'Hora Inicio',
	CONVERT (NVARCHAR (10), Evento.DtHrFim, 103) AS 'Data Fim',
	CONVERT (NVARCHAR (5), Evento.DtHrFim, 108) AS 'Hora Fim',
	Sala.Nome 'Nome da Sala'

from
	Evento
	left join Sala
	on Evento.IDSala = Sala.IDSala

where GETDATE() between DtHrInicio and DtHrFim -- Ver o que está acontecendo agora

--------------------------------- Alterando dados ---------------------------------

UPDATE Evento
SET DtHrInicio = '16/07/2024 08:00',
    DtHrFim = '16/07/2024 12:30'
WHERE IDEvento = '414BDC9NB11N' -- Usar o WHERE para definir que é só o evento selecionado*/



-- ----------------------------- Selecionando as 3 sala com a maior capacidade ---------------------------

/*select top(3) 
	Capacidade 
from 
	Sala 
order by 
	Capacidade DESC*/

----------------------------------------
	
/*select 
	Pessoa.Nome 'Responsaveis',
	Evento.Descricao 'Descrição do Evento',
	CONVERT (NVARCHAR (10), Evento.DtHrInicio, 103) AS 'Data do Evento',
	Sala.Nome 'Nome da Sala'

from
	Evento

inner join EventoPessoa on EventoPessoa.IDEvento = Evento.IDEvento -- Juntando a tabela EVENTOPESSOA com a EVENTO, pegando oq as duas tem em comum que é ID
inner join Sala on Sala.IDSala = Evento.IDSala
inner join Pessoa on EventoPessoa.IDPessoa = Pessoa.IDPessoa
where EventoPessoa.PapelEvento = 'Responsavel' 


-------------------------------- controlar qual dia e por quanto tempo cada sala foi utilizada por cada reunião -------------------------

/*select 
	
	Evento.Descricao 'Descrição Evento',
	Sala.Nome 'Nome da Sala',
	CONVERT (NVARCHAR (10), Evento.DtHrInicio, 103) AS 'Data Inicio',
	CONVERT (NVARCHAR (5), Evento.DtHrInicio, 108) AS 'Hora Inicio',
	CONVERT (NVARCHAR (5), Evento.DtHrFim, 108) AS 'Hora Fim',
	CONVERT(varchar(5), DATEADD(MINUTE, DATEDIFF(MINUTE, Evento.DtHrInicio, Evento.DtHrFim), 0),  114)  as 'Duração da Reunião'
from 
	Evento
inner join Sala on Sala.IDSala = Evento.IDSala

---------------------

SELECT
    S.Nome      AS "Nome da Sala",
    E.Descricao AS "Descrição do Evento" ,
    DateDiff(MINUTE, E.DtHrInicio, E.DtHrFim)   AS "Utilização (minutos)", 
    Convert(Varchar(10), E.DtHrInicio, 103)     AS "Data de Início",
    Convert(Varchar(10), E.DtHrFim, 103)        AS "Data de Fim"
 
FROM Sala S
 
INNER JOIN Evento E
    ON S.IDSala = E.IDSala*/


------------------------ Mensagem erro ----------------------------------------------

/*BEGIN TRANSACTION -- Começar transaction
 
INSERT INTO Sala Values ('abcdf1234567', 'Sala de Programação', 20)
 
select * from Sala where IDSala = 'abcdf1234567'

ROLLBACK -- Desfazer alteração
COMMIT -- Efetivar inserção permanente*/

-------------

/*BEGIN TRANSACTION

DELETE FROM Sala WHERE IDSala = 'abcdf1234567'

IF @@ERROR <> 0
    ROLLBACK -- Voltar na situação anterior
ELSE
    COMMIT -- Efetivar comando*/*/

---------------------- Quanto tempo cada sala foi utilizada ------------------

/*select Sala.Nome 'Nome da sala',
       SUM(DateDiff(MINUTE, Evento.DtHrInicio, Evento.DtHrFim))  AS "Utilização (minutos)"
from Evento
	inner join Sala on Sala.IDSala = Evento.IDSala
group by Sala.Nome

select * from Sala*/

--------------------- Quantidade de eventos que cada pessoa participou ----------------------

/*select Pessoa.Nome 'Nome',
	   count(EventoPessoa.IDPessoa) 'Quantidade Eventos'
from Pessoa
left join EventoPessoa on Pessoa.IDPessoa = EventoPessoa.IDPessoa
left join Evento on Evento.IDEvento = EventoPessoa.IDEvento
group by Pessoa.Nome order by 'Quantidade Eventos' DESC


SELECT
    P.Nome,
    COUNT(EP.IDEvento) AS Quantidade
FROM Pessoa P
LEFT JOIN EventoPessoa EP
    ON P.IDPessoa = EP.IDPessoa
GROUP BY P.Nome
ORDER BY Quantidade DESC*/

----------------- Verificar se as reunioes estao sendo utilizadas nas slas com a capacidade correta --------------------------------

/*select Sala.Nome 'Nome da Sala',
	   Sala.Capacidade 'Capacidade da sala',
	   Evento.Descricao 'Nome do Evento',
	   COUNT(EventoPessoa.IDEvento) 'Quantidade de participantes',
	   CASE WHEN COUNT(EventoPessoa.IDEvento) > Sala.Capacidade THEN 'Ultrapassou o limite'
			ELSE 'Limite ok' END AS 'Avaliação da capacidade'

from Sala
left join Evento on Sala.IDSala = Evento.IDSala
left join EventoPessoa on EventoPessoa.IDEvento = Evento.IDEvento
group by Evento.IDEvento, Evento.Descricao, Sala.Nome, Sala.Capacidade

----------------- Utilizando view -----------------------

select
	Evento.Descricao 'Nome do Evento',
	Sala.Capacidade 'Capacidade da sala',
	COUNT(EventoPessoa.IDPessoa) 'Participou'
from Evento 
	left join EventoPessoa 
on Evento.IDEvento = EventoPessoa.IDEvento
	left join Sala 
on Sala.IDSala = Evento.IDSala

group by Evento.IDEvento, Sala.Capacidade, EventoPessoa.Presenca, Evento.Descricao
having 
	COUNT(EventoPessoa.IDPessoa) <= Sala.Capacidade and 
	EventoPessoa.Presenca = 1 and
	Evento.IDEvento in
(
	SELECT
E.IDEvento
FROM Evento E
INNER JOIN EventoPessoa EP
ON E.IDEvento = EP.IDEvento
INNER JOIN Sala S
ON S.IDSala = E.IDSala
GROUP BY E.IDEvento, S.Capacidade
HAVING COUNT(EP.IDPessoa) > S.Capacidade
)
SELECT * FROM vwCapacidadeEventos*/


---------------------- FUNÇÕES ----------------------------
create function fEventoAntigo (@valor varchar(50))
returns table as
return (select top 1
	
	S.Nome 'Nome da Sala',
	E.Descricao 'Nome do Evento',
	count(EP.Presenca) 'Quantidade de pessoas',
	CONVERT (NVARCHAR (10), E.DtHrInicio, 103) AS 'Data Inicio',
	CONVERT (NVARCHAR (5), E.DtHrInicio, 108) AS 'Hora Inicio'

from Evento E

	inner join Sala S on E.IDSala = S.IDSala
	inner join EventoPessoa EP on E.IDEvento = EP.IDEvento
WHERE E.Descricao LIKE @valor+'%' 
group by E.IDEvento, E.Descricao, S.Nome, E.DtHrInicio
order by E.DtHrInicio ASC)

select * from fEventoAntigo('Aula')


