-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Estom Paulino da Silva Junior 
begin;
drop schema if exists Startups_EstomJr;

create schema Startups_EstomJr;

create table Startup(
	id_startup INT NOT NULL AUTO_INCREMENT,
	nome_startup VARCHAR (45),
	cidade_sede VARCHAR (20),
	PRIMARY KEY(id_startup));
    
create table Programador(
	id_programador INT NOT NULL AUTO_INCREMENT,
	id_startup INT,
    nome_programador VARCHAR(45),
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    email VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_programador),
    UNIQUE(email));
    
create table Programador_Linguagem(
	id_programador INT NOT NULL AUTO_INCREMENT,
	id_linguagem INT NOT NULL AUTO_INCREMENT
);  

create table Linguagem_Programacao(
	id_linguagem VARCHAR(2),
	nome_linguagem VARCHAR(15),
	ano_lancamento VARCHAR(4),
	PRIMARY KEY (id_linguagem)); 

create table IDE(
	id_ide INT NOT NULL AUTO_INCREMENT,
    id_linguagem INT NOT NULL AUTO_INCREMENT
);


insert into STARTUP values
	(10001,'Tech4Toy','Porto Alegre'),
    (10002,'Smart123','Belo Horizonte'),
    (10003,'knowledgeUp','Rio de Janeiro'),
    (10004,'BSI Next Level','Recife'),
    (10005,'QualiHealth','São Paulo'),
    (10006,'ProEdu','Florianópolis');
    
insert into Programador(id_startup, nome_programador, genero, data_nascimento, email)values
	(10001,'João Pedro', 'M','1993-06-23', 'joaop@mail.com'),
    (10002,'Paula Silva', 'F','1986-01-10', 'paulas@mail.com'),
    (10003,'Renata Vieira', 'F','1991-07-05', 'renatav@mail.com'),
    (10004,'Felipe Santos', 'M','1976-11-25', 'felipes@mail.com'),
    (10001,'Ana Cristina', 'F','1968-02-19', 'anac@mail.com'),
    (10004,'Alexandre Alves', 'M','1988-07-07', 'alexandrea@mail.com'),
    (10002,'Laura Marques', 'F','1987-10-04', 'lauram@mail.com');
    
insert into PROGRAMADOR_LINGUAGEM values
	(30001,20001),
    (30001,20002),
    (30002,20003),
    (30003,20004),
    (30003,20005),
    (30004,20005),
    (30007,20001),
    (30007,20002);
    
insert into LINGUAGEM_PROGRAMACAO values
	(20001,'Python','1991'),
    (20002,'PHP','1995'),
    (20003,'Java','1995'),
    (20004,'C','1972'),
    (20005,'JavaScript','1995'),
    (20006,'Dart','2011');        

insert into ID values 
	(1,20003),
	(2,20001),
	(3,20004),
	(4,20005),
	(5,20006),
	(6,20002);

alter table Programador	ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) ON DELETE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) ON DELETE RESTRICT;
alter table IDE ADD FOREIGN KEY(id_linguagem) REFERENCES Programador_Linguagem(id_linguagem) ON DELETE CASCADE;

commit;