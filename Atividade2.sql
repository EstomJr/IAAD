-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Estom Paulino da Silva Junior 
begin;

-- drop schema if exists startups_estomjr2;

create schema new_schema;

create table STARTUP(
    id_startup CHAR(5) PRIMARY KEY,
    nome_startup VARCHAR(255) NOT NULL,
    cidade_sede VARCHAR(255)
);

create table PROGRAMADOR(
    id_programador char(5) PRIMARY KEY,
    id_startup char(5),
    nome_programador VARCHAR(255) NOT NULL,
    genero enum('M','F'),
    data_nascimento DATE,
    email varchar(255),
    UNIQUE(email)
);

create table PROGRAMADOR_LINGUAGEM(
	id_programador CHAR(5),
	id_linguagem CHAR(5),
	PRIMARY KEY(id_programador, id_linguagem)
);

create table LINGUAGEM_PROGRAMACAO(
	id_linguagem CHAR(5) PRIMARY KEY,
	nome_linguagem VARCHAR(255) NOT NULL,
	ano_lancamento YEAR
);

create table PROJETOS_STARTUP(
    id_projeto CHAR(5) PRIMARY KEY,
    nome_projeto varchar(255),
    id_startup CHAR(5),
    id_linguagem CHAR(5)
   );

-- populando

insert into STARTUP values
    ('10001','Tech4Toy','Porto Alegre'),
    ('10002','Smart123','Belo Horizonte'),
    ('10003','knowledgeUp','Rio de Janeiro'),
    ('10004','BSI Next Level','Recife'),
    ('10005','QualiHealth','São Paulo'),
    ('10006','ProEdu','Florianópolis');
    
insert into Programador(id_startup, nome_programador, genero, data_nascimento, email)values
    ('10001','João Pedro', 'M','1993-06-23', 'joaop@mail.com'),
    ('10002','Paula Silva', 'F','1986-01-10', 'paulas@mail.com'),
    ('10003','Renata Vieira', 'F','1991-07-05', 'renatav@mail.com'),
    ('10004','Felipe Santos', 'M','1976-11-25', 'felipes@mail.com'),
    ('10001','Ana Cristina', 'F','1968-02-19', 'anac@mail.com'),
    ('10004','Alexandre Alves', 'M','1988-07-07', 'alexandrea@mail.com'),
    ('10002','Laura Marques', 'F','1987-10-04', 'lauram@mail.com');
    
insert into PROGRAMADOR_LINGUAGEM values
    ('30001','20001'),
    ('30001','20002'),
    ('30002','20003'),
    ('30003','20004'),
    ('30003','20005'),
    ('30004','20005'),
    ('30007','20001'),
    ('30007','20002');
    
insert into LINGUAGEM_PROGRAMACAO values
    ('20001','Python','1991'),
    ('20002','PHP','1995'),
    ('20003','Java','1995'),
    ('20004','C','1972'),
    ('20005','JavaScript','1995'),
    ('20006','Dart','2011');        

insert into PROJETOS_STARTUP values 
	('50001','Apollo', '10002', '20003'),
	('50002','Big Husky', '10002', '20003'),
	('50003','Atwood', '10004','20005'),
	('50004','Project X', '10006', '20001'),
	('50005','Agile', '10004', '20005');
	
-- restrições  

alter table Programador	ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) ON DELETE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) ON DELETE RESTRICT;
alter table IDE ADD FOREIGN KEY(id_linguagem) REFERENCES Programador_Linguagem(id_linguagem) ON DELETE CASCADE;

commit;
