drop database antifome;
create database if not exists antifome;
use antifome;

CREATE TABLE endereco (
    id_endereco int not null auto_increment PRIMARY KEY,
    rua varchar(100) not null,
    numero varchar(10) not null,
    cidade varchar(50) not null,
    bairro varchar(40) not null,
    estado varchar(2) not null,
    cep varchar(8),
    complemento varchar(100)
);

CREATE TABLE login (
    id_login int not null auto_increment PRIMARY KEY,
    usuario varchar(50) not null,
    senha varchar(50),
    index dx_usuario(usuario)
);

CREATE TABLE empresa (
    id_empresa int not null auto_increment PRIMARY KEY,
    razao_social varchar(100) not null,
    nome_fantasia varchar(50),
    cnpj varchar(14) not null,
    data_cadastrado datetime default current_timestamp,
    email varchar(70),
    telefone varchar(11),
    id_endereco int,
    id_login int,
    index dx_cnpj(cnpj),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco) on delete cascade on update cascade,
    FOREIGN KEY (id_login) REFERENCES login(id_login) on delete cascade on update cascade
);

CREATE TABLE funcionario (
    id_funcionario int not null auto_increment PRIMARY KEY,
    nome varchar(70) not null,
    funcao varchar(30),
    salario float(6,2) not null,
    data_nascimento date not null,
    cpf varchar(11) not null,
    data_cadastrado datetime default current_timestamp,
    email varchar(70) not null,
    celular varchar(11),
    id_endereco int,
    id_login int,
    index dx_cpf(cpf),
    FOREIGN KEY (id_endereco)REFERENCES endereco (id_endereco) on delete cascade on update cascade,
    FOREIGN KEY (id_login)REFERENCES login (id_login) on delete cascade on update cascade
);

CREATE TABLE cliente (
    id_cliente int not null auto_increment PRIMARY KEY,
    nome varchar(70) not null,
    data_nascimento date,
    cpf varchar(11) not null,
    data_cadastrado datetime default current_timestamp,
    email varchar(70) not null,
    celular varchar(11) not null,
    id_endereco int,
    id_login int,
    index dx_cpf(cpf),
    FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco) on delete cascade on update cascade,
    FOREIGN KEY (id_login) REFERENCES login (id_login) on delete cascade on update cascade
);

CREATE TABLE produto (
    id_produto int not null auto_increment PRIMARY KEY,
    nome varchar(30) not null,
    descricao varchar(150) not null,
    valor float(5,2) not null,
    categoria varchar(30) not null,
    id_empresa int,
    index dx_nome(nome),
    FOREIGN KEY (id_empresa)REFERENCES empresa (id_empresa) on delete cascade on update cascade
);

CREATE TABLE mensalidade (
    id_mensalidade int not null auto_increment PRIMARY KEY,
    valor float(6,2) not null,
    data_paga date not null,
    data_referente date not null,
    hora_paga time not null,
    id_empresa int,
    index dx_data_paga(data_paga),
    FOREIGN KEY (id_empresa)REFERENCES empresa (id_empresa) on delete set null on update cascade
);

CREATE TABLE compra (
    id_compra int not null auto_increment PRIMARY KEY,
    data date not null,
    hora time not null,
    status varchar(20),
    entrega varchar(3) not null,
    valor_total float(6,2) not null,
    id_cliente int,
    id_produto int,
    FOREIGN KEY (id_cliente)REFERENCES cliente (id_cliente) on delete set null on update cascade,
    FOREIGN KEY (id_produto)REFERENCES produto (id_produto) on delete set null on update cascade
);

create table compra_produto(
	id_compra_produto int not null auto_increment primary key,
	id_compra int,
	id_produto int,
	FOREIGN KEY (id_compra) REFERENCES compra(id_compra) on delete cascade on update cascade,
	FOREIGN KEY (id_produto) REFERENCES produto(id_produto) on delete cascade on update cascade
);

CREATE TABLE problema (
    id_problema int not null auto_increment PRIMARY KEY,
    assunto varchar(50) not null,
    descricao varchar(255) not null,
    situacao varchar(30) not null,
    data_hora datetime default current_timestamp,
    id_funcionario int,
    id_compra int,
    index dx_data_hora(data_hora),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario) on delete set null on update cascade,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra) on delete cascade on update cascade
);

CREATE TABLE acesso (
    id_acesso int not null auto_increment PRIMARY KEY,
    data_hora datetime default current_timestamp,
    id_login int,
    index dx_data(data_hora),
    FOREIGN KEY (id_login) REFERENCES login (id_login) on delete set null on update cascade
);

CREATE TABLE avaliacao (
    id_avaliacao int not null auto_increment PRIMARY KEY,
    classificacao int(2) not null,
    comentario varchar(255),
    id_cliente int,
    id_compra int,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) on delete cascade on update cascade,
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra) on delete cascade on update cascade
);