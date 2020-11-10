create database Exercicio2
go
use Exercicio2

create table Cliente(
Nome varchar(50) not null,
Logradouro varchar(100) not null,
Num int not null,
Bairro varchar(50) not null,
Telefone varchar(9) not null,
Carro varchar(7) not null
primary key(Carro),
foreign key(Carro) REFERENCES Carro(Placa)
)

drop table Cliente

create table Carro(
Placa varchar(7) not null unique,
Marca varchar(50) not null,
Modelo varchar(50) not null,
Cor varchar(20) not null,
Ano int not null,
primary key(Placa)
)


create table Peças(
Codigo int not null identity,
Nome varchar(50) not null,
Valor int not null,
primary key(Codigo)
)

create table Serviço(
Carro varchar(7) not null,
Peça int not null,
Quantidade int not null,
Valor int not null,
Datas date not null,
primary key(Carro,Peça,Datas),
foreign key(Carro) REFERENCES Carro(Placa),
foreign key(Peça) REFERENCES Peças(Codigo)
) 

DROP TABLE Serviço

insert into Cliente VALUES
('João Alves',	'R. Pereira Barreto',	1258,	'Jd. Oliveiras',	'2154-9658',	'DXO9876'),
('Ana Maria',	'R. 7 de Setembro',	259,	'Centro',	'9658-8541',	'LKM7380'),
('Clara Oliveira',	'Av. Nações Unidas',	10254,	'Pinheiros',	'2458-9658',	'EGT4631'),
('José Simões',	'R. XV de Novembro',	36,	'Água Branca',	'7895-2459',	'BCD7521')



insert into Carro values
('AFT9087',	'VW',	'Gol',	'Preto',	2007),
('DXO9876',	'Ford',	'Ka',	'Azul',	2000),
('EGT4631',	'Renault',	'Clio',	'Verde',	2004),
('LKM7380',	'Fiat',	'Palio',	'Prata',	1997),
('BCD7521',	'Ford',	'Fiesta',	'Preto',	1999)

insert into Peças values
('Vela',	70),
('Correia Dentada',	125),
('Trambulador',	90),
('Filtro de Ar',	30)

insert into Serviço values
('DXO9876',	1,	4,	280,	'01/08/2020'),
('DXO9876',	4,	1,	30,	'01/08/2020'),
('EGT4631',	3,	1,	90,	'02/08/2020'),
('DXO9876',	2,	1,	125,	'07/08/2020')

SELECT Telefone FROM Cliente WHERE Carro IN
(
 SELECT Placa From Carro WHERE Modelo = 'Ka' and Cor = 'Azul'
)

select Logradouro + ' ' + CAST(Num AS varchar) + ' ' + Bairro from Cliente where Carro in (
	select Carro from Serviço where Datas = '02/08/2009'
)

Select Placa from Carro Where Ano < 2001

Select Marca,Modelo,Cor from Carro Where Ano > 2005

Select Codigo,Nome From Peças where Valor < 80





