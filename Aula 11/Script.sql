/*  create table autor (	/* croa a tabela */
	id INT not null generated always as identity,  /* cria um numero inteiro automaticamente e não repete */
	nome varchar(15) not null, /*cria a coluna com até 15 caracteres, não pode ser nulo */
	sobrenome varchar(20) not null, /*cria sobrenome */
	primary key (id) /* faz o ID virar a chave primaria */
)*/

create table livro(
	id INT not null generated always as identity,
	nome varchar(40) not null,
	id_autor int not null,
	id_editora int not null,
	genero varchar(25),
	num_paginas int,
	primary key (id),
	foreign key (id_autor) references autor(id) /* Traz a informação da tabela 'autor' */
)