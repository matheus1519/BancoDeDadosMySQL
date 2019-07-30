/* View */
create view v_cliente_produto as
	select cli.nome, count(*) produtos 
	from compra c 
	join compra_produto cp on c.id_compra = cp.id_compra 
	join produto p on cp.id_produto = p.id_produto 
	join cliente cli on cli.id_cliente = c.id_cliente 
	group by cli.id_cliente
	order by produtos desc
;

/* Update com Case When */
/*
	Aumentar o salário dos funcionários que ganham abaixo de mil e quinhentos reais em 10%.
	Aumentar o salário dos funcionários que ganham a partir de mil e quinhentos reais em 20%.
*/
update funcionario 
	set salario = 
	case when salario < 1500 
		then salario + salario * 0.1 
		else salario * 1.1 
	end
;
