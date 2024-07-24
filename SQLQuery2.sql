use Clientes
go

select * from ITENS_NOTAS_FISCAIS
select * from TABELA_DE_CLIENTES
select * from TABELA_DE_PRODUTOS
select * from TABELA_DE_VENDEDORES
select * from NOTAS_FISCAIS

/*alter function fVendaData (@DataVenda DATETIME)
returns table as
return(

select 
		tc.cpf,
		tc.nome,
		tc.volume_de_compra,
		format(nf.DATA_VENDA, 'yyyy-MM') 'MÊS_ANO',
		sum(itensnf.QUANTIDADE) 'Quantidade Total',
		CASE WHEN sum(itensnf.quantidade) > tc.VOLUME_DE_COMPRA THEN 'Vendas Inválidas'
			ELSE 'Vendas válidas' END AS 'Resultado'
from 
	TABELA_DE_CLIENTES tc
	inner join NOTAS_FISCAIS nf on tc.CPF = nf.CPF
	inner join ITENS_NOTAS_FISCAIS itensnf on itensnf.NUMERO = nf.NUMERO

where
	format(nf.DATA_VENDA, 'yyyy-MM') = format(@DataVenda, 'yyyy-MM')  

group by 
	tc.CPF, tc.NOME, nf.DATA_VENDA, tc.VOLUME_DE_COMPRA
)
declare @DataVenda DateTime = '2015-01-11'

select * from fVendaData(@DataVenda)*/

--------------------------------------------------

select 
	tp.sabor,
	sum(itensnf.quantidade) as venda_ano,
	year(nf.DATA_VENDA) 'Ano'

(select 
		sum(itensnf.quantidade)
	from 
		ITENS_NOTAS_FISCAIS itensnf
	where 
		DATEPART(year, nf.DATA_VENDA) = 2015) as Porcentagem
	
from 
	TABELA_DE_PRODUTOS tp
	inner join ITENS_NOTAS_FISCAIS itensnf on itensnf.CODIGO_DO_PRODUTO = tp.CODIGO_DO_PRODUTO
	inner join NOTAS_FISCAIS nf on nf.NUMERO = itensnf.NUMERO

where DATEPART(year, nf.DATA_VENDA) = 2015

group by 
	tp.SABOR, year(nf.DATA_VENDA)
order by  'venda_ano' desc
