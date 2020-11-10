CREATE DATABASE Livraria
GO

USE Livraria

CREATE TABLE Livro(
Codigo_Livro INT NOT NULL IDENTITY(1001,1),
Nome varchar(100) NOT NULL UNIQUE,
Lingua varchar(50) NOT NULL DEFAULT 'PT-BR',
Ano INT not null,
PRIMARY KEY(Codigo_Livro),
CONSTRAINT check_Ano CHECK(Ano >= 1990)
)
GO


CREATE TABLE Autor(
Codigo_Autor INT NOT NULL IDENTITY(10001,1),
Nome varchar(100) NOT NULL,
Nascimento date NOT NULL,
Pais varchar(50) not null,
Biografia varchar(max) not null,
PRIMARY KEY(Codigo_Autor),
CONSTRAINT check_Pais CHECK((Pais='Brasil') OR (Pais='Alemanha'))
)
GO

CREATE TABLE Livro_Autor(
LivroCodigo_Livro INT NOT NULL,
AutorCodigo_Autor INT NOT NULL,
PRIMARY KEY(LivroCodigo_Livro,AutorCodigo_Autor),
FOREIGN KEY (LivroCodigo_Livro) REFERENCES Livro(Codigo_Livro),
FOREIGN KEY (AutorCodigo_Autor) REFERENCES Autor(Codigo_Autor))


CREATE TABLE Edicoes(
ISBN INT NOT NULL,
Preco decimal(7,2) NOT NULL,
Ano INT NOT NULL,
Num_Paginas INT NOT NULL,
Qtn_Estoque INT NOT NULL,
LivroCodigo_Livro INT NOT NULL,
PRIMARY KEY(ISBN),
FOREIGN KEY(LivroCodigo_Livro) REFERENCES Livro(Codigo_Livro),
CONSTRAINT check_AnoPreco_NumPag CHECK((Ano >= 1993) AND (Preco > 0) AND (Num_Paginas > 0))
)

GO

CREATE TABLE Editora(
Codigo_Editora INT NOT NULL IDENTITY,
Nome varchar(50) NOT NULL UNIQUE,
Logradouro varchar(255) NOT NULL,
Numero_End INT NOT NULL,
CEP CHAR(8) NOT NULL,
Telefone CHAR(11) NOT NULL,
Primary KEY(Codigo_Editora),
CONSTRAINT check_Numero CHECK(Numero_End > 0)
)
GO

CREATE TABLE Livros_Edicoes_Editora(
EdicoesISBN INT NOT NULL,
LivroCodigo_Livro INT NOT NULL,
EditoraCodigo_Editora INT NOT NULL,
PRIMARY KEY(EdicoesISBN,LivroCodigo_Livro,EditoraCodigo_Editora),
FOREIGN KEY (EdicoesISBN) REFERENCES Edicoes(ISBN),
FOREIGN KEY (LivroCodigo_Livro) REFERENCES Livro(Codigo_Livro),
FOREIGN KEY (EditoraCodigo_Editora) REFERENCES Editora(Codigo_Editora))



INSERT INTO Autor VALUES('Louis The Child','01/09/1995','Brasil','Melhor não')
SELECT * FROM Autor
INSERT INTO Autor VALUES('NOT Louis The Child','01/09/1995','USA','Melhor não')
INSERT INTO Autor VALUES('Johann Wolfgang','01/09/1990','Alemanha','Melhor não')

INSERT INTO Livro VALUES('Better Not',DEFAULT,'2017')
INSERT INTO Livro VALUES('Fausto',DEFAULT,'1808')
INSERT INTO Livro VALUES('Faustao',DEFAULT,'1999')
SELECT * FROM Livro

INSERT INTO Edicoes VALUES(123456,20.5,'1995',100,20,1002)
INSERT INTO Edicoes VALUES(123456,20.5,'1800',100,20,1003)
INSERT INTO Edicoes VALUES(123456,20.5,'1800',100,-15,1003)

SELECT * FROM Edicoes

INSERT INTO Editora VALUES('Editora1','Rua tal',01,'20005','165486')

SELECT * FROM Editora

