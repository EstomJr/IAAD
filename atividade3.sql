begin;
drop schema if exists clinicas_medicas_estomjr; 
create schema clinicas_medicas_estomjr; 
use clinicas_medicas_estomjr;

create table Clinicas(
    CodCli INT PRIMARY KEY AUTO_INCREMENT, 
    NomeCli VARCHAR(255), 
    Endereco VARCHAR(255), 
    Telefone VARCHAR(255), 
    Email VARCHAR(255),

    UNIQUE(Email)
);

create table Medicos(
    CodMed INT PRIMARY KEY AUTO_INCREMENT, 
    NomeMed VARCHAR(255) NOT NULL, 
    genero enum('M','F'), 
    Telefone VARCHAR(255), 
    Email VARCHAR(255),
    CodEspec INT,

    UNIQUE(Email)
);

create table Especialidade (
    CodEspec INT PRIMARY KEY AUTO_INCREMENT, 
    NomeEspec VARCHAR(255), 
    Descricao VARCHAR(255)
);

create table Paciente(
    CpfPaciente CHAR(11) PRIMARY KEY, 
    NomePac VARCHAR(255) NOT NULL, 
    DataNascimento DATE, 
    genero enum('M','F'), 
    Telefone VARCHAR(255), 
    Email VARCHAR(255),

    UNIQUE(Email)
);

create table ClinicaMedico(
    CodCli INT NOT NULL, 
    CodMed INT NOT NULL, 
    DataIngresso DATE, 
    CargaHorariaSemanal DECIMAL(3,1)
);

create table AgendaConsulta(
    CodCli INT, 
    CodMed INT, 
    CpfPaciente CHAR(11), 
    Data_Hora DATETIME
);


insert into Clinicas values
    (10001,'Esperanca','Encruzilhada da agamenon', '8198395431', 'atendimento@esperanca.com'),
    (Default,'HSCP','Volta da rua da lua no fantástico', '8729128312', 'atendimento@hscp.com'),
    (Default,'HAPVITA', 'Avenida Marechal Capitão', '8185493212', 'atendimento@hapvita.com'),
    (Default, 'Hospital das Clínicas','BR 101', '8912397124', 'atendimento@hspclinicas.gov'),
    (Default, 'HOPE', 'Avenida Naufrago Ribeiro', '8157864778', 'atendimento@hope.com');

insert into Medicos values
	(20001, 'Dr. Roberto Claudio', 'M', '81997802526', 'RobertoClaudio@mail.com',30001),
    (Default, 'Dra. Suelen Indigo', 'F', '81995481697', 'SuelenIndigo@mail.com',30002),
    (Default, 'Dr. Enzo de Souza', 'M', '81988745995', 'EnzodeSouza@mail.com',30001),
    (Default, 'Dr. Alfred Bane', 'M', '81992548790', 'AlfredBane@mail.com',30003),
    (Default, 'Dr. Carlos Magno', 'M', '81987415212', 'CarlosMagno@mail.com',30004),
    (Default, 'Dr. Leonidas Campelo', 'M', '81988745962', 'LeonidasCampelo@mail.com',30005),
    (Default, 'Dra. Vania Lucinda', 'F', '81950214569', 'VaniaLucinda@mail.com',30006);

insert into Especialidade values
	(30001,'Ortopedia e traumatologia', 'atua no tratamento de problemas nos músculos, ossos e traumas'),
    (Default,'Cardiologia', 'trata de doenças e problemas relacionados ao coração e à circulação sanguínea'),
    (Default,'Oncologia', 'estuda e trata os diversos tipos de câncer'),
    (Default,'Oftalmologia', 'Previne e trata doenças nas estruturas oculares'),
    (Default,'Otorrinolaringologia', 'trata as doenças do ouvido, do nariz e da garganta'),
    (Default,'Neurologia', 'trata dos aspectos clínicos dos problemas no sistema nervoso');

insert into Paciente values
	('08726654024', 'José', '2000-09-18', 'M', '2682878513', 'jose_21@mail.com'),
    ('70875870058', 'Robson', '1997-05-2', 'M', '2292878513', 'Robson_89@mail.com'),
    ('56916890029', 'Cassio', '1990-08-11', 'M', '8182878513', 'cassio_14@mail.com'),
    ('80250103095', 'Pedro', '2004-01-16', 'M', '8115878513', 'peu_02@mail.com'),
    ('99535751000', 'Tony', '2011-11-08', 'M', '1234784513', 'tony_12@mail.com'),
    ('68253995008', 'Amalia', '2005-12-25', 'F', '8111978513', 'amalia_92@mail.com'),
    ('54981742096', 'Eduarda', '1998-03-04', 'F', '2182878513', 'edu_arda@mail.com'),
    ('15905244030', 'Penywise', '1980-02-25', 'M', '9856878513', 'acoisa@mail.com'),
    ('78694926040', 'Joana', '2015-07-19', 'F', '2292898513', 'joan_a@mail.com'),
    ('91527728021', 'Arthur', '1983-06-05', 'M', '9856878986', 'arthur_135@mail.com');

insert into ClinicaMedico values
	(10001, 20001, '2015-02-07', 20.0),
    (10005, 20004, '2018-09-20', 36.0),
    (10004, 20001, '2014-06-12', 20.6),
    (10003, 20002, '1998-04-01', 40.0),
    (10002, 20007, '2016-06-27', 32.0),
    (10003, 20003, '2005-08-12', 28.0),
    (10002, 20006, '2010-03-10', 36.5),
    (10004, 20005, '2010-03-10', 40.0),
    (10004, 20004, '2000-01-16', 38.5);

insert into AgendaConsulta values
	(10001, 20001, '08726654024', '2021-06-14 14:30:00'),
    (10005, 20004, '56916890029', '2020-06-15 15:00:00'),
    (10003, 20003, '15905244030', '2020-06-18 16:00:00'),
    (10004, 20004, '91527728021', '2021-07-20 17:30:00'),
    (10004, 20001, '80250103095', '2022-08-24 14:30:00'),
    (10002, 20006, '99535751000', '2021-09-26 16:30:00'),
    (10005, 20004, '78694926040', '2022-10-02 17:00:00');

alter table Medicos ADD FOREIGN KEY(CodEspec) REFERENCES Especialidade(CodEspec) ON DELETE CASCADE ON UPDATE CASCADE;

alter table AgendaConsulta ADD FOREIGN KEY (CpfPaciente) REFERENCES Paciente(CpfPaciente) ON DELETE RESTRICT;
alter table AgendaConsulta ADD FOREIGN KEY (CodMed) REFERENCES Medicos(CodMed);
alter table AgendaConsulta ADD FOREIGN KEY (CodCli) REFERENCES Clinicas(CodCli);

alter table ClinicaMedico ADD FOREIGN KEY (CodCli) REFERENCES Clinicas(CodCli);
alter table ClinicaMedico ADD FOREIGN KEY (CodMed) REFERENCES Medicos(CodMed);

alter table Especialidade ADD FOREIGN KEY (CodEspec) REFERENCES Medicos(CodEspec) ON DELETE CASCADE ON UPDATE CASCADE;

SET LOCAL lc_time_names = 'pt_BR'; 
 
commit;
