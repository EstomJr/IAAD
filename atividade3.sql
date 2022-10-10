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
    Descricao VARCHAR(255) NOT NULL
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
    CargaHorariaSemanal DECIMAL(3,1),
    primary key (CodCli, CodMed)

);

create table AgendaConsulta(
    CodCli INT, 
    CodMed INT, 
    CpfPaciente CHAR(11), 
    Data_Hora DATETIME
);


insert into Clinicas values
    (10001,'Unimed','Ilha do leite', '8198395431', 'Unimed@Unimed.com'),
    (Default,'Hapvida','Olinda', '8729128312', 'Hapvida@Hapvida.com'),
    (Default,'Esperanca', 'Avenida janga', '8185493212', 'Esperanca@Esperanca.com'),
    (Default, 'HR','Agamenom magalhaes', '8912397124', 'HR@HR.gov'),
    (Default, 'Real Portugues', 'Boa viagem', '8157864778', 'Portugues@Portugues.com');

insert into Medicos values
	(20001, 'Dr. Estom Junior', 'M', '81997802526', 'Estom@mail.com',80001),
    (Default, 'Dra. Karolayne Michele', 'F', '81995481697', 'Karolayne@mail.com',80002),
    (Default, 'Dr. David Ramos', 'M', '81988745995', 'David@mail.com',80001),
    (Default, 'Dr. Breno Gomes', 'M', '81992548790', 'Breno@mail.com',80003),
    (Default, 'Dr. carlos souza', 'M', '81987415212', 'carlos@mail.com',80004),
    (Default, 'Dr. EduarDo Lopes', 'M', '81988745962', 'EduarDo@mail.com',80005),
    (Default, 'Dra. Daniela Lucinda', 'F', '81950214569', 'Daniela@mail.com',80006);

insert into Especialidade values
	(30001,'Cardiologia ', 'especialista nas doenças do coração e seu sistema circulatório'),
    (Default,'Dermatologia', ' cuida da prevenção e tratamento das doenças do maior órgão do corpo: a pele e seus apêndices'),
    (Default,'Ginecologia ', 'cuida da saúde da mulher, desde sua adolescência até a idade madura, atuando na prevenção, no diagnóstico e no tratamento de diversas patologias.'),
    (Default,'Anestesiologia', 'especialista responsável pela condução dos procedimentos anestésicos e pelo acompanhamento do paciente durante o período perioperatório'),
    (Default,'Ortopedia', 'especialista no diagnóstico e tratamento das disfunções e lesões do sistema locomotor (músculos, ossos, ligamentos, nervos, articulações, tendões etc.).'),
    (Default,'Neurologia', 'trata dos aspectos clínicos dos problemas no sistema nervoso');

insert into Paciente values
	('08726654024', 'Dinaildo', '2000-09-18', 'M', '2682878513', 'Dinaildo@mail.com'),
    ('70875870058', 'Breno', '1997-05-2', 'M', '2292878513', 'Breno@mail.com'),
    ('56916890029', 'Dylan', '1990-08-11', 'M', '8182878513', 'Dylan@mail.com'),
    ('80250103095', 'Anthony', '2004-01-16', 'M', '8115878513', 'Anthony@mail.com'),
    ('99535751000', 'Bruk', '2011-11-08', 'M', '1234784513', 'Bruk@mail.com'),
    ('68253995008', 'Josue', '2005-12-25', 'M', '8111978513', 'Josue@mail.com'),
    ('54981742096', 'Elder', '1998-03-04', 'M', '2182878513', 'Elder@mail.com'),
    ('15905244030', 'Ruth', '1980-02-25', 'F', '9856878513', 'Ruth@mail.com'),
    ('78694926040', 'Libna', '2015-07-19', 'F', '2292898513', 'Libna@mail.com'),
    ('91527728021', 'Lais', '1983-06-05', 'F', '9856878986', 'Lais@mail.com');

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
alter table AgendaConsulta ADD FOREIGN KEY(CodCli) REFERENCES ClinicaMedico(CodCli);
alter table AgendaConsulta ADD FOREIGN KEY(CodMed) REFERENCES ClinicaMedico(CodMed);
alter table ClinicaMedico ADD FOREIGN KEY (CodCli) REFERENCES Clinicas(CodCli);
alter table ClinicaMedico ADD FOREIGN KEY (CodMed) REFERENCES Medicos(CodMed);


SET LOCAL lc_time_names = 'pt_BR'; 
 
commit;
