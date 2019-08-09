/* 
	Os relatórios foram escolhidos considerando sua necessidade e agregação para o negócio.
	------------------
	1. Busca o nome dos funcionários que não resolveram nenhum problema:
*/
select nome from funcionario f left join problema p on f.id_funcionario = p.id_funcionario where f.id_funcionario not in (select id_funcionario from problema);
/*
	2. Lista dos clientes que mais compraram, mostrando apenas nomes e a quantidade de vezes que compraram:
*/
select c.nome, count(*) quantidade from cliente c join compra cp on c.id_cliente = cp.id_cliente group by c.id_cliente order by quantidade desc;
/*
	3. A soma do valor de todas as compras realizadas no mês de junho:
*/
select sum(valor_total) valor_todas_as_compras from compra where data between '2019-06-01' and '2019-06-30';
/*
	4. Lista com nome dos clientes e a respectiva quantidade de produtos que já comprou em ordem decrescente:
*/
select cli.nome, count(*) produtos from compra c join compra_produto cp on c.id_compra = cp.id_compra join produto p on cp.id_produto = p.id_produto join cliente cli on cli.id_cliente = c.id_cliente group by cli.id_cliente order by produtos desc;
/*
	5. A soma do valor de todas as mensalidades pagas no ano de 2019
*/
select sum(valor) receita_2019 from mensalidade where data_paga like '2019%';
