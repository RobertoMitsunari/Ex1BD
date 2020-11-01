CREATE DATABASE UsuarioProjetos
GO
USE UsuarioProjetos

CREATE TABLE Project(
idProject INT NOT NULL IDENTITY(10001,1),
nome varchar(45) NOT NULL,
descricao varchar(45),
dataProject varchar(45) NOT NULL 
PRIMARY KEY(idProject)
)

CREATE TABLE Users(
idUser INT NOT NULL IDENTITY,
nome varchar(45) NOT NULL,
username varchar(45) NOT NULL,
senha varchar(45) NOT NULL DEFAULT('123mudar'),
email varchar(45) NOT NULL,
PRIMARY KEY(IdUser)
)

CREATE TABLE User_has_projects(
Id_User INT NOT NULL,
Id_Projects INT NOT NULL
PRIMARY KEY(Id_User,Id_Projects)
FOREIGN KEY (Id_User) REFERENCES Users(idUser),
FOREIGN KEY (Id_Projects) REFERENCES Project(idProject)
)

ALTER TABLE Users
ALTER COLUMN senha varchar(10) NOT NULL

ALTER TABLE Users
ALTER COLUMN senha varchar(8) NOT NULL

INSERT INTO Users VALUES('Maria','Rh_maria','123mudar','maria@empresa.com'),
('Paulo','Ti_paulo','123@456','paulo@empresa.com'),
('Ana','Rh_ana','123mudar','ana@empresa.com'),
('Clara','Ti_clara','123mudar','clara@empresa.com'),
('Aparecido','Rh_apareci','55@!cido','aparecido@empresa.com')

INSERT INTO Project values('Re-folha','Refatoracao das folhas','05/09/2014'),
('Manutencao PCs',' Manutenção PC´s', '06/09/2014'),
('Auditoria',  NULL , '07/09/2014')


insert into User_has_projects values(1 , 10001),
(5,10001), 
(3,10003), 
(4,10002), 
(2,10002) 

update Project set dataProject = '12/09/2014'
WHERE idProject = 10002

update Users set username = 'Rh_cido'
WHERE idUser = 5

update Users set senha = '888@*'
WHERE username = 'Rh_maria' AND senha = '123mudar'


DELETE from User_has_projects
WHERE Id_User = 2 and Id_Projects = 10002

alter table Project
ADD budget decimal(7,2) NULL

update Project set budget = 5750.00
WHERE idProject = 10001

update Project set budget = 7850.00
WHERE idProject = 10002

update Project set budget = 9530.00
WHERE idProject = 10003

select username, senha from Users where username = 'Rh_ana'

select nome, budget, (budget * 1.25) AS budget_hipotetico from Project

select idUser, nome, email from Users WHERE senha = '123mudar'

select idProject, nome from Project WHERE budget BETWEEN 2000.00 and 8000.00

