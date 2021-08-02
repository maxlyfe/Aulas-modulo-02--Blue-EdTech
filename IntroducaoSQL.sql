/* https://www.elephantsql.com/ */
/* https://dbeaver.io/download/ */


/*Criar essas duas: */

CREATE TABLE autor ( /* Cria uma nova tabela */
 id int NOT NULL generated always as identity, /* Cria uma coluna id que não pode ser nula e será incrementada automaticamente sempre como uma identidade da linha */
 nome varchar(30), /* Cria uma coluna nome com o tipo varchar de no máximo 30 caracteres */
 sobrenome varchar(40),
 PRIMARY KEY (id) /* Diz que a coluna id será a chave primaria dessa tabela */
)

CREATE TABLE livro (
 id int NOT NULL generated always as identity,
 nome varchar(40),
 id_autor int NOT NULL,
 id_editora int NOT NULL,
 genero varchar(25),
 num_paginas int,
 PRIMARY KEY (id),
 FOREIGN KEY (id_autor) REFERENCES autor (id),
 FOREIGN KEY (id_editora) REFERENCES editora (id)
)

/*Depois criar essa:*/

CREATE TABLE editora (  
 id int NOT NULL generated always as identity, 
 nome varchar(25),
 PRIMARY KEY (id)
)

/*Adicionando a chave estrangeira para relacionar as tabelas: */

ALTER TABLE livro
ADD CONSTRAINT fk_id_editora FOREIGN KEY (id_editora) REFERENCES editora(id)


/* Do CRUD esse é o CREATE */
/* Insert */
INSERT INTO autor (nome, sobrenome) 
values ('Thiago', 'Lima')

INSERT INTO editora (nome) 
values ('Blue')


insert into livro (nome, id_autor, id_editora, genero, num_paginas)
values
('PostgreSQL', 1, 1, 'Tecnologia', 500), 
('MySQL', 1, 2, 'Tecnologia', 500),
('Oracle', 2, 1, 'Tecnologia', 500),
('SQLServer', 1, 2, 'Tecnologia', 500),
('MongoDB', 2, 2, 'Tecnologia', 500)

/* Select */

/* Do CRUD esse é o READ */

SELECT * FROM livro

SELECT nome from livro

/* Do CRUD esse é o UPDATE */
 /* Update */

UPDATE livro SET nome = 'MongoDB' WHERE id = 5

/* Do CRUD esse é o DELETE */
/* Delete */

DELETE FROM livro WHERE id = 2

/* Apagar uma coluna */

ALTER TABLE livro DROP column num_paginas

/* ORDER BY no select */

select * from livro order by id /* Ordena pelo id em order crescente */

select * from livro order by id desc /* Ordena pelo id em order decrescente */

/* INNER JOIN de todos os campos da tabela livro e editora */

select * from livro 
inner join editora
on livro.id_editora = editora.id

/* INNER JOIN do nome do livro e do nome da editora */

select livro.nome, editora.nome
from livro
inner join editora
on livro.id_editora = editora.id

/* INNER JOIN do nome do livro e do nome da editora e do nome do autor */

select livro.nome, editora.nome, autor.nome
from livro
inner join editora
on livro.id_editora = editora.id
inner join autor
on livro.id_autor = autor.id

/* INNER JOIN com todas as colunas de uma tabela e apenas uma coluna de outra relacionada */

select livro.*, editora.nome
from livro
inner join editora
on livro.id_editora = editora.id


/* EXERCICIO */

/* 
PARTE 1:
Crie um banco de dados novo no ElephantSQL
Conecte esse banco novo no dbeaver
Crie as tabelas Cliente, Produto e Vendedo
Crie as colunas que você achar pertinente, é necessário que todas as tabelas tenham id.
Adicione 10 dados para cada tabela.
Relacione as tabelas, sabendo que cada cliente pode comprar varios produtos e cada vendedor pode vender varios produtos.

PARTE 2

Editar 2 dados dentro de 4 linhas de 2 colunas da tabela de produtos
Apagar 3 linhas da tabela de produtos
Mostrar um tabela com os segintes dados: 
 - Nome do produto, Preço do Produto, Nome do cliente, Nome do vendedor.
Mostrar a tabela de produtos em ordem alfabética.
Mostrar a tabela de Clientes em ordem alfabética.
Mostrar a tabela de Vendedor em ordem alfabética.

 */

