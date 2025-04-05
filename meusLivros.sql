create database db_MeusLivros;
show databases;
use db_MeusLivros;
SELECT database();

#Criar tabela autores
CREATE TABLE tbl_Autores (
IdAutor smallint auto_increment,
NomeAutor Varchar(50) Not Null,
SobrenomeAutor varchar(60) Not Null,
constraint pk_id_autor primary key (IdAutor)
);

describe tbl_autores;

#Criar tabelas editores
create table tbl_Editoras (
IdEditora smallint Primary key auto_increment,
NomeEditora varchar(50) Not Null
);

#Criar Tabela de Assuntos
Create table tbl_Assuntos (
IdAssunto tinyint auto_increment,
Assunto varchar(25) Not null,
constraint pk_id_assunto primary key (IdAssunto)
);

#Criar Tabela de Livros
create table if not exists tbl_Livros (
IdLivro smallint not null auto_increment,
NomeLivro varchar(70) not null,
ISBN13 varchar(13) not null,
DataPub date,
PrecoLivro decimal(10,2) not null,
NumeroPaginas smallint not null,
IdEditora smallint not null,
IdAssunto tinyint not null,
constraint pk_id_livro primary key (IdLivro),
constraint fk_id_editora foreign key (IdEditora) references tbl_editoras (IdEditora) on delete cascade,
constraint fk_id_assunto foreign key (IdAssunto) references tbl_Assuntos (IdAssunto) on delete cascade
);

#Criar Tabela LivrosAutores
create table tbl_LivrosAutores (
IdLivro smallint not null,
IdAutor smallint not null,
constraint pk_id_livro_autor primary key (IdLivro, IdAutor),
constraint fk_id_livros foreign key (IdLivro) references tbl_livros (IdLivro),
constraint fk_id_autores foreign key (IdAutor) references tbl_autores (IdAutor)
);

show tables;



# Modificar Tabelas

ALTER TABLE tbl_livros
ADD Edicao TINYINT;
DESCRIBE tbl_livros;

alter table tbl_livros
drop column Edicao;
describe tbl_livros;

show tables;

INSERT INTO tbl_autores (NomeAutor, SobrenomeAutor)
VALUES
('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
('William', 'Stanek'), ('Richard', 'Blum'), ('Christine', 'Bresnahan'),
('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),('Joel', 'Murach'), ('Paul', 'Scherz'), ('Simon', 'Monk');

alter table tbl_livros auto_increment=100;

INSERT INTO tbl_editoras (NomeEditora)
VALUES
('Prentice Hall'), ('O´Reilly'),
('Microsoft Press'), ('Wiley'),
('Mc Graw Hill'), ('Bookman'),
('Novatec'), ('Apress'),
('Sybex'), ('Mike Murach and Associates');

INSERT INTO tbl_Assuntos (Assunto)
VALUES
('Ficção'), ('Botânica'),
('Eletrônica'), ('Matemática'),
('Aventura'), ('Literatura'),
('Informática'), ('Suspense');

INSERT INTO tbl_Livros (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES
('Linux Command Line and Shell Scripting','9781118983843', '20150109', 165.55, 816, 7, 4),
('SSH, the Secure Shell','9780596008956', '20050517', 295.41, 672, 7, 2),
('Using Samba','9780596002565', '20031221', 158.76, 449, 7, 2),
('A Arte da Eletrônica', '9788582604342', '20170308', 176.71, 1160, 7, 6),
('Windows Server 2012 Inside Out','9780735666313', '20130125', 179.51, 1584, 7, 3),
('Murach´s MySQL','9781943872367', '20190501', 227.64, 650, 7, 10),
('Practical Electronics for Inventors', '9781259587542', '20160711', 119.58, 1056, 3, 5);

INSERT INTO tbl_LivrosAutores (IdLivro, IdAutor)
VALUES
(100,5), (100,6),
(101,1), (101,7), (101,8),
(102,2), (102,9), (102,10),
(103,11), (103,12),
(104,4),
(105,13),
(106,14), (106,15);

SELECT * FROM tbl_Autores;
SELECT * FROM tbl_Editoras;
SELECT * FROM tbl_Assuntos;
SELECT * FROM tbl_Livros;
SELECT * FROM tbl_LivrosAutores;

SELECT L.NomeLivro AS Livro,
CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor) AS Autor,
L.PrecoLivro As 'Preço do Livro'
FROM tbl_livrosautores LA
INNER JOIN tbl_livros L
ON L.IdLivro = LA.IdLivro
INNER JOIN tbl_Autores A
ON A.IdAutor = LA.IdAutor;

UPDATE tbl_Livros
SET NomeLivro = 'SSH, o Shell Seguro'
WHERE IdLivro = 101;

UPDATE tbl_Livros
SET PrecoLivro = PrecoLivro + 10
WHERE IdLivro = 105;

UPDATE tbl_Assuntos
SET Assunto = 'Biologia'
WHERE IdAssunto = 2;

insert into tbl_editoras (NomeEditora)
values ('Bóson Editorial');
SELECT * FROM tbl_Editoras;

DELETE FROM tbl_Editoras
WHERE IdEditora = 11;

CREATE TABLE tbl_Emprestimos (
IdEmprestimo TINYINT PRIMARY KEY,
NomeLivro VARCHAR (60) NOT NULL,
NomeEmprestador VARCHAR (50) NOT NULL
);

SELECT * FROM tbl_Emprestimos;

TRUNCATE TABLE tbl_Emprestimos;
SELECT * FROM tbl_Emprestimos;

INSERT INTO tbl_Emprestimos (IdEmprestimo, NomeLivro, NomeEmprestador)
VALUES(20,'O Cortiço','João da Silva'),(21,'A Moreninha','Marcos de Souza'),(22,'Macunaíma','Ana Abreu');
SELECT * FROM tbl_Emprestimos;

DROP TABLE tbl_Emprestimos;
SELECT * FROM tbl_Emprestimos;

SELECT * FROM tbl_Autores;

SELECT NomeAutor 
FROM tbl_Autores;

SELECT NomeLivro 
FROM tbl_livros;

SELECT Assunto 
FROM tbl_Assuntos;

SELECT NomeLivro, PrecoLivro FROM tbl_Livros;

SELECT NomeAutor, SobrenomeAutor
FROM tbl_Autores;

SELECT NomeLivro, ISBN13, DataPub
FROM tbl_Livros;

SELECT * FROM tbl_Livros ORDER BY NomeLivro ASC;

SELECT NomeLivro, IdEditora FROM tbl_Livros ORDER BY IdEditora;

SELECT NomeLivro, PrecoLivro FROM tbl_Livros ORDER BY PrecoLivro DESC;

SELECT NomeLivro, DataPub, idAssunto
FROM tbl_Livros ORDER BY idAssunto, NomeLivro;

SELECT * FROM tbl_Editoras;

SELECT * FROM tbl_Editoras ORDER BY NomeEditora ASC;

SELECT * FROM tbl_Livros;

SELECT NomeLivro, PrecoLivro, DataPub FROM tbl_Livros ORDER BY DataPub desc;

SELECT * FROM tbl_Autores;

SELECT NomeAutor, SobrenomeAutor FROM tbl_Autores ORDER BY SobrenomeAutor;

SELECT * FROM tbl_Livros;

SELECT * FROM tbl_Assuntos;

SELECT * FROM tbl_Assuntos ORDER BY Assunto ASC;

SELECT NomeLivro, PrecoLivro
FROM tbl_Livros
ORDER BY PrecoLivro
LIMIT 2;

SELECT NomeLivro, PrecoLivro
FROM tbl_Livros
ORDER BY PrecoLivro DESC
LIMIT 3;

SELECT NomeLivro, NumeroPaginas
FROM tbl_Livros
ORDER BY NumeroPaginas DESC
LIMIT 2, 3;

SELECT NomeLivro, DataPub FROM tbl_Livros WHERE
IdEditora = 2;

SELECT IdAutor, NomeAutor FROM tbl_Autores WHERE
SobrenomeAutor = 'Stanek';

SELECT IdAssunto FROM tbl_Assuntos
WHERE Assunto = 'Literatura';

SHOW INDEX FROM tbl_editoras;

EXPLAIN SELECT * from tbl_editoras
where NomeEditora = 'Springer';

CREATE INDEX idx_editora ON tbl_editoras(NomeEditora);

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 102 AND IdEditora < 4;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 102 OR IdEditora < 4;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE NOT IdEditora = 10;

SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 102 AND NOT IdEditora <= 4;

SELECT NomeLivro AS Livro
FROM tbl_Livros
WHERE IdLivro > 102;

SELECT NomeAutor AS Nome,
SobrenomeAutor Sobrenome
FROM tbl_Autores AS Autores;

SELECT NomeLivro AS Livro, PrecoLivro AS P
FROM tbl_Livros AS Livros
ORDER BY 'Preço do Livro' DESC;

SELECT COUNT(*) AS Total FROM tbl_Autores;

SELECT COUNT(DISTINCT idEditora) FROM tbl_Livros;

SELECT MAX(PrecoLivro) AS 'Mais caro' FROM tbl_Livros;

SELECT MIN(PrecoLivro) FROM tbl_Livros;

SELECT AVG(PrecoLivro) AS Média FROM tbl_Livros;

SELECT SUM(PrecoLivro) AS 'Preço Total' FROM tbl_Livros;

SELECT SUM(PrecoLivro) / COUNT(*)
AS 'Preço Médio' FROM tbl_Livros;

SELECT COUNT(*) AS 'Quant Livros', SUM(NumeroPaginas) AS 'Páginas Totais',
AVG(NumeroPaginas) 'Média de Págs.'
FROM tbl_Livros;

SELECT * FROM tbl_Livros
WHERE DataPub BETWEEN '20040517' AND '20110517';

SELECT NomeLivro AS Livro, PrecoLivro AS Preço FROM
tbl_Livros
WHERE PrecoLivro BETWEEN 150.00 AND 200.00;

SELECT NomeLivro, PrecoLivro FROM tbl_Livros
WHERE PrecoLivro BETWEEN 170.00 AND 180.00
OR PrecoLivro BETWEEN 220.00 AND 300.00
order by PrecoLivro;

SELECT * FROM tbl_Livros
WHERE NomeLivro LIKE 'A%';

SELECT * FROM tbl_Livros
WHERE NomeLivro NOT LIKE 'S%';

SELECT NomeLivro FROM tbl_Livros
WHERE NomeLivro LIKE '_i%';

SELECT NomeLivro AS Livro, PrecoLivro AS Valor
FROM tbl_Livros
WHERE NomeLivro NOT LIKE 'A%' AND PrecoLivro <= 190.00;

SELECT IdAssunto, SUM(NumeroPaginas) FROM tbl_Livros
GROUP BY IdAssunto;

SELECT IdEditora, SUM(PrecoLivro) FROM tbl_livros
GROUP BY IdEditora;

SELECT IdEditora, AVG(NumeroPaginas), IdAssunto FROM tbl_livros
GROUP BY IdEditora;

SELECT IdEditora, SUM(PrecoLivro) FROM tbl_livros
WHERE NumeroPaginas >= 1000
GROUP BY IdEditora
ORDER BY NumeroPaginas;

SELECT IdEditora, SUM(NumeroPaginas) AS
SomaPaginas
FROM tbl_livros
WHERE IdAssunto > 3
GROUP BY IdEditora WITH ROLLUP
HAVING SomaPaginas >= 900;

SELECT IdEditora, SUM(PrecoLivro) AS Soma
FROM tbl_livros
GROUP BY IdEditora
HAVING Soma > 200;

SELECT IdEditora, AVG(NumeroPaginas), IdAssunto
FROM tbl_livros
GROUP BY IdEditora
HAVING AVG(NumeroPaginas) >= 1000;

SELECT IdEditora, SUM(NumeroPaginas) AS
SomaPaginas FROM tbl_livros
WHERE IdAssunto > 3
GROUP BY IdEditora
HAVING SomaPaginas >= 900
ORDER BY IdEditora;

SELECT * FROM tbl_Livros
INNER JOIN tbl_Editoras
ON tbl_Livros.IdEditora = tbl_Editoras.IdEditora;

SELECT tbl_Livros.NomeLivro, tbl_Livros.ISBN13,
tbl_Assuntos.Assunto
FROM tbl_Livros JOIN tbl_Assuntos
ON tbl_Livros.IdAssunto = tbl_Assuntos.IdAssunto;

SELECT L.NomeLivro AS Livros, E.NomeEditora AS
Editoras
FROM tbl_Livros AS L
JOIN tbl_Editoras AS E
ON L.IdEditora = E.IdEditora
WHERE E.NomeEditora LIKE 'M%';

SELECT L.NomeLivro Livro, C.Assunto Assunto,
E.NomeEditora Editora
FROM tbl_Livros L
JOIN tbl_Assuntos C
ON L.IdAssunto = C.IdAssunto
JOIN tbl_Editoras E
ON L.IdEditora = E.IdEditora;

SELECT L.NomeLivro Livro,
CONCAT(A.NomeAutor, ' ', A.SobrenomeAutor) Autor,
L.PrecoLivro 'Preço do Livro'
FROM tbl_livrosautores LA
JOIN tbl_livros L ON L.IdLivro = LA.IdLivro
JOIN tbl_Autores A ON A.IdAutor = LA.IdAutor;

SELECT * FROM tbl_Assuntos
LEFT JOIN tbl_Livros
ON tbl_Livros.IdAssunto = tbl_Assuntos.IdAssunto;

SELECT * FROM tbl_Assuntos
LEFT JOIN tbl_Livros
ON tbl_Livros.IdAssunto = tbl_Assuntos.IdAssunto
WHERE tbl_Livros.IdAssunto IS NULL;

SELECT * FROM tbl_Livros AS Li
RIGHT JOIN tbl_Editoras AS Ed
ON Li.IdEditora = Ed.IdEditora;

SELECT * FROM tbl_Livros
RIGHT JOIN tbl_Editoras
ON tbl_Livros.IdEditora = tbl_Editoras.IdEditora
WHERE tbl_Livros.IdEditora IS NULL;

SELECT * FROM tbl_Livros
CROSS JOIN tbl_livrosautores;

SELECT NomeLivro Livro, PrecoLivro Preço, 'Livro Caro' Resultado
FROM tbl_Livros
WHERE PrecoLivro >= 150.00
UNION
SELECT NomeLivro Livro, PrecoLivro Preço, 'Preço Razoável' Resultado
FROM tbl_Livros
WHERE PrecoLivro < 150.00
ORDER BY Preço;

SELECT L.NomeLivro Livro, L.PrecoLivro 'Preço Normal', L.PrecoLivro * 0.90
'Preço Ajustado', A.Assunto
FROM tbl_Livros L INNER JOIN tbl_Assuntos A
ON L.IdAssunto = A.IdAssunto
WHERE L.PrecoLivro > 200.00
UNION
SELECT L.NomeLivro Livro, L.PrecoLivro 'Preço Normal', L.PrecoLivro * 1.15
'Preço Ajustado', A.Assunto
FROM tbl_Livros L INNER JOIN tbl_Assuntos A
ON L.IdAssunto = A.IdAssunto
WHERE A.Assunto = 'Eletrônica'
ORDER BY 'Preço Ajustado' DESC;

SELECT * FROM tbl_Assuntos
LEFT JOIN tbl_Livros
ON tbl_Livros.IdAssunto = tbl_Assuntos.IdAssunto
UNION
SELECT * FROM tbl_Assuntos
RIGHT JOIN tbl_Livros
ON tbl_Livros.IdAssunto = tbl_Assuntos.IdAssunto;

SELECT 3 * 9;

SELECT NomeLivro, PrecoLivro * 5 AS 'Preço de 5
Unidades' FROM tbl_Livros;

SELECT 2 * 9 / 3 as Calculo;

SELECT NomeLivro, PrecoLivro / 2 AS 'Preço com 50%
de desconto' FROM tbl_Livros;

SELECT 10 MOD 3;

SELECT PI();

SELECT POW(2,4);

SELECT SQRT(81);

SELECT SIN(PI());

SELECT HEX(1200);

SELECT NomeLivro, ROUND(PrecoLivro * 5, 2) AS
'Preço Arredondado' FROM tbl_Livros;