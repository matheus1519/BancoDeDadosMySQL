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

/* Função */
/*
	Retornar a quantidade de empresas cadastradas em um determinado mês (Intervalo restrito em 1 ano)
*/
create function empresas_cadastradas(mes varchar(2)) returns integer 
begin
    declare quantidade integer;
    declare ano varchar(4);
    
    if(mes > date_format(now(),'%m')) then
		set ano = date_format(date_sub(now(), interval 1 year),'%Y');
	else
		set ano = date_format(now(),'%Y');
	end if;
    
    select count(*) into quantidade from empresa where data_cadastrado like (concat(ano,'-',mes,'%'));
    
    return quantidade;
end;

/* Procedimento */
/*
	Quando a aplicação é fechada, o status de todos as compras tem que ser definido para finalizado
	e mostrar na tela quantas compras ficaram com status diferente de finalizado.
*/
create procedure finalizar_todos()
begin
    declare tamanho integer;
    declare i integer;
    declare quantidade integer;
    declare statu varchar(20);
	set quantidade = 0;
    set i = 0;
   
    select max(id_compra) into tamanho from compra;
    while i <= tamanho do
		select status into statu from compra where id_compra = i;
		if(statu <> 'Finalizada' ) then
			set quantidade = quantidade + 1;
        end if;
        set i = i + 1;
    end while;
    select concat('A quantidade de compras diferente de Finalizada: ', quantidade);
	update compra set status = 'Finalizada';
end; 

/* Trigger */
/*
	Toda vez que o funcionario resolve um problema é adicionado 20 reais ao seu salario.
*/
create trigger adiciona_funcionario after insert
on problema
for each row
begin
	update funcionario set salario = salario + 20 where id_funcionario = new.id_funcionario;
end
