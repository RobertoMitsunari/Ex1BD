Create database Exercicio3
go
use Exercicio3

create table Paciente(
CPF varchar(11) not null unique,
Nome varchar(50) not null,
Rua varchar(50) not null,
Num int not null,
Bairro varchar(50) not null,
Idade int,
Telefone varchar(18),
primary key(CPF)

)




create table Medico(
Codigo int not null identity unique,
Nome varchar(50) not null,
Especialidade varchar(50) not null
primary key(Codigo)
)

create table Prontuario(
Datas date not null,
CPF_Paciente varchar(11) not null, 
Codigo_Medico int not null,
Diagnóstico varchar(150),
Medicamento varchar(50)
primary key(Datas, CPF_Paciente, Codigo_medico),
foreign key(CPF_Paciente) references Paciente(CPF),
foreign key(Codigo_Medico) references Medico(Codigo)

)


Insert into Paciente values
('35454562890',	'José Rubens',	'Campos Salles',	2750,	'Centro', 80,	'21450998'),
('29865439810',	'Ana Claudia',	'Sete de Setembro',	178,	'Centro', 27,	'97382764'),
('82176534800',	'Marcos Aurélio',	'Timóteo Penteado',	236,	'Vila Galvão', 55,	'68172651'),
('12386758770',	'Maria Rita',	'Castello Branco',	7765,	'Vila Rosália', 30, null),	
('92173458910',	'Joana de Souza',	'XV de Novembro',	298,	'Centro', 81,'21276578')


Select Nome, Rua + ' ' + cast(Num as varchar) + ' ' + Bairro As Endereço From Paciente where Idade > 50

select * from Paciente

insert into Medico values
('Wilson Cesar',	'Pediatra'),
('Marcia Matos','Geriatra'),
('Carolina Oliveira',	'Ortopedista'),
('Vinicius Araujo',	'Clínico Geral')

select Especialidade from Medico Where Nome = 'Carolina Oliveira'


insert into Prontuario values
('10/09/2020',	'92173458910',	2,	'Renite Alérgica',	'Allegra'),
('12/09/2020',	'29865439810',	1,	'Inflamação de garganta',	'Nimesulida'),
('12/09/2020',	'35454562890',	2,	'H1N1',	'Tamiflu'),
('09/18/2020',	'82176534800',	4,	'Gripe',	'Resprin'),
('09/15/2020',	'12386758770',	3,	'Braço Quebrado',	'Dorflex + Gesso')

select Diagnóstico, Medicamento from Prontuario where CPF_Paciente = '35454562890'

select * from Prontuario

select Nome,SUBSTRING(Especialidade, 1, 3)+'.' from Medico where Codigo IN (
	select Codigo_Medico from Prontuario where CPF_Paciente = '35454562890'
)

select SUBSTRING(CPF, 1, 3)+'.'+ SUBSTRING(CPF, 3, 3)+'.'+SUBSTRING(CPF, 6, 3)+'-'+SUBSTRING(CPF, 6, 2) as CPF,
Rua + ' ' + cast(Num As varchar)+'º -' + Bairro as Endereço,
CASE WHEN Telefone = null Then
	'-'
ELSE
	Telefone
END As Tel
from Paciente where CPF IN (
	select CPF_Paciente from Prontuario where Codigo_Medico = 4
)

Select DATEDIFF(DD, Datas, GETDATE()) as Dias_Consulta from Prontuario where CPF_Paciente = '12386758770'

update Paciente  set Telefone = '98345621' where CPF = '12386758770'


update Paciente  set Rua= 'Voluntários da Pátria', Bairro = 'Jd. Aeroporto', Num = 1980 where CPF = '92173458910'

Alterar o Endereço de Joana de Souza para Voluntários da Pátria, 1980, Jd. Aeroporto