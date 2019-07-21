use antifome;
/* Endereço */ 
insert into endereco(rua,numero,cidade,bairro,estado,cep)
values ('Avenida nao te interessa', '500', 'Campos dos Goytacazes', 'Parque Aurora', 'RJ', '28083200');
insert into endereco(rua,numero,cidade,bairro,estado,cep)
values ('Rua Barão da Lagoa Dourada', '340', 'Campos dos Goytacazes', 'Parque Leopoldina', 'RJ', '28083700');
insert into endereco(rua,numero,cidade,bairro,estado,cep)
values ('Rua Liceu', '340', 'Campos dos Goytacazes', 'Parque Presidente', 'RJ', '28083800');
insert into endereco(rua,numero,cidade,bairro,estado,cep)
values ('Rua Caramba', '340', 'Campos dos Goytacazes', 'Parque Porta', 'RJ', '28083110');
insert into endereco(rua,numero,cidade,bairro,estado,cep)
values ('Rua Sala', '340', 'Campos dos Goytacazes', 'Parque Armario', 'RJ', '28083200');

/* Login */
insert into login(usuario,senha)
values ('robertinho21','senha');
insert into login(usuario,senha)
values ('carolina','senha');
insert into login(usuario,senha)
values ('roteador','senha');
insert into login(usuario,senha)
values ('eu','senha');
insert into login(usuario,senha)
values ('marcao','senha');
insert into login(usuario,senha)
values ('funcionario1','senha');
insert into login(usuario,senha)
values ('funcionario2','senha');
insert into login(usuario,senha)
values ('empresa1','senha');
insert into login(usuario,senha)
values ('empresa2','senha');

/* Cliente */
insert into cliente(nome,data_nascimento,cpf,email,celular,id_endereco,id_login) 
values ('Roberto Almeida', '1998-01-25', '15721558798', 'robertinhodavila@gmail.com', '22997852505', 1,1);
insert into cliente(nome,data_nascimento,cpf,email,celular,id_endereco,id_login) 
values ('Maria Doida', '2000-01-25', '25636525633', 'mariadatia@gmail.com', '22955455415', 4,2);
insert into cliente(nome,data_nascimento,cpf,email,celular,id_endereco,id_login) 
values ('Roberta', '2001-01-25', '12515889322', 'robertapop@gmail.com', '22955455415', 2,3);
insert into cliente(nome,data_nascimento,cpf,email,celular,id_endereco,id_login) 
values ('Carla', '1996-01-25', '20354892015', 'carla@gmail.com', '22955455415', 3,4);
insert into cliente(nome,data_nascimento,cpf,email,celular,id_endereco,id_login) 
values ('Lucas', '2002-01-25', '02158763152', 'luquinha@gmail.com', '22955455415', 1,5);

/* Funcionario */

insert into funcionario(nome,funcao,salario,data_nascimento,cpf,email,celular,id_endereco,id_login)
values ('Carlos', 'Atendente', 1300, '1972-10-18', '15725152154', 'carlos@gmail.com', '22987725422', 4,6);
insert into funcionario(nome,funcao,salario,data_nascimento,cpf,email,celular,id_endereco,id_login)
values ('Mara', 'Atendente', 3500.5, '1972-10-18', '15725155554', 'mara@gmail.com', '22987725422', 5,7);

/* Empresa */
insert into empresa(razao_social,nome_fantasia,cnpj,email,telefone,id_endereco,id_login)
values ('Doces', 'Adoçando a Vida', '15333372515215', 'adocando@gmail.com', '2227314547
', 3,8);
insert into empresa(razao_social,nome_fantasia,cnpj,email,telefone,id_endereco,id_login)
values ('Salgados para todos', 'Salgado do Povo', '25469805423152', 'salgadando@gmail.com', '2227282116
', 5,9);

/* Compra */
insert into compra(data,hora,status,entrega,valor_total,id_cliente)
values ('2019-6-15', '21:21:01', 'finalizada','nao', 56.2,1);
insert into compra(data,hora,status,entrega,valor_total,id_cliente)
values ('2019-6-01', '10:54:01', 'andamento','nao', 76.8,2);


/* Produto */
insert into produto(nome,descricao,valor,categoria,id_empresa) 
values ('Chocolate', 'Barra de Chocolate 500g', 8.5, 'Doce', 1);
insert into produto(nome,descricao,valor,categoria,id_empresa) 
values ('Caramelo', 'Bisnaga de Caramelo 50g', 1.5, 'Doce', 1);
insert into produto(nome,descricao,valor,categoria,id_empresa) 
values ('Enroladinho', 'Presunto e Queijo', 3.5, 'Salgado', 2);
insert into produto(nome,descricao,valor,categoria,id_empresa) 
values ('Enroladinho', 'Frengo', 3.5, 'Salgado', 2);

/* Mapeando compra e produtos */
insert into compra_produto(id_compra,id_produto)
values (1,1);
insert into compra_produto(id_compra,id_produto)
values (1,2);
insert into compra_produto(id_compra,id_produto)
values (2,3);
insert into compra_produto(id_compra,id_produto)
values (2,4);

/* Mensalidade */
insert into mensalidade(valor,data_paga,data_referente,hora_paga,id_empresa)
values (50.5, '2019-7-2', '2019-6-15', '21:21:01',1);
insert into mensalidade(valor,data_paga,data_referente,hora_paga,id_empresa)
values (50.5, '2019-7-2', '2019-6-15', '21:21:01',2);


/* Problema */
insert into problema(assunto, descricao, situacao, id_funcionario, id_compra)
values ('Compra Invalida', 'Minha compra foi nagada e invalida', 'Resolvido',1, 1);
insert into problema(assunto, descricao, situacao, id_funcionario, id_compra)
values ('Compra Invalida', 'Minha compra foi nagada e invalida', 'Não esolvido',2, 2);
