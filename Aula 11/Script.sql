



/*  create table autor (	/* croa a tabela */
	id INT not null generated always as identity,  /* cria um numero inteiro automaticamente e n�o repete */
	nome varchar(15) not null, /*cria a coluna com at� 15 caracteres, n�o pode ser nulo */
	sobrenome varchar(20) not null, /*cria sobrenome */
	primary key (id) /* faz o ID virar a chave primaria */
)*/

--create table livro(
--	id INT not null generated always as identity,
--	nome varchar(40) not null,
--	id_autor int,
--	id_editora int,
--	genero varchar(25),
--	num_paginas int,
--	primary key (id),
--	foreign key (id_autor) references autor(id) /* Traz a informa��o da tabela 'autor' */
--)--
-------------------------------------------------
--create table editora (
--	id int not null generated always as identity,
--	nome varchar(25) not null,
--	primary key (id) 
--)--
----------------------------------------------
--alter table livro 
--add constraint fk_id_autor
--foreign key (id_editora) references editora(id)
--
--select * from livro
	-----------------------------	
insert into autor (id, nome, sobrenome)
values ('Max','sobrenome')
-----------------------------
select *from autor
-------------------------------------
select * from editora
----------------------------------
insert into livro (id, nome, id_autor, id_editora, genero, num_paginas)
values ('PostgreSQL', 1, 1, 'Masc', 300)
--
----update livro set nome = 'MongoDB' where id = 2
--
select * from livro
--------------------------------------------
select * from livro 
inner join editora
on livro.id_editoria = editora.id 
inner join autor
on livro.id_autor = autor.id

-------------------------------------------
select livro.nome, livro.num_paginas, editora.nome, autor.nome from livro 
inner join editora
on livro.id_editoria = editora.id 
inner join autor
on livro.id_autor = autor.id

--------------------------------------------------------


