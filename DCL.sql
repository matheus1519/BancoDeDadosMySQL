create user 'gerencia'@'localhost' identified by 'gerencia';
grant all on *.* to 'gerencia'@'localhost';


create user 'olhada'@'localhost' identified by 'olhada';
grant select on antifome.* to 'olhada'@'localhost';

create user pessoas@'localhost' identified by pessoas;
grant all on antifome.empresa to pessoas@'localhost';
grant all on antifome.cliente to pessoas@'localhost';
grant all on antifome.funcionario to pessoas@'localhost';

create user vercliente@'localhost' identified by vercliente;
grant select(nome), select(data_nascimento) on antifome.cliente to vercliente@'localhost';
