 CREATE DATABASE vaccination
 GO
USE vaccination
GO
CREATE TABLE State
(
    idState tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(30)NOT NULL,
	condition bit	
);

CREATE TABLE [Personnel key] 
(
    [idPersonnel key] tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(30) NOT NULL,
	condition bit
);

CREATE TABLE Vaccine
(
    idVaccine tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name varchar(50) NOT NULL,
	DosesInStorage int NOT NULL,
	condition bit

);

CREATE TABLE Campus
(
    idCampus tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL,
    Address varchar(100) NOT NULL,
	Date smalldatetime NOT NULL,
	condition bit,
	idState tinyint,
	CONSTRAINT FK_Campus_State FOREIGN KEY (idState) references State(idState),
);



CREATE TABLE Personnel 
(
    idPersonnel int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    Address  varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
	condition bit,
    [idPersonnel key] tinyint,
	CONSTRAINT FK_Personel_PersonelKey FOREIGN KEY ([idPersonnel key]) references [Personnel key]([idPersonnel key]),
	idCampus tinyint,
	CONSTRAINT FK_Personnel_Campus FOREIGN KEY(idCampus) references Campus(idCampus),
	
);
    
CREATE TABLE Citizen
(
    idCitizen int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    Address varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
	Age tinyint NOT NULL,
	condition bit,
);
CREATE TABLE [Citizen report] 
(
    idReport int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idCitizen int
	CONSTRAINT FK_CitizenReport_Citizen FOREIGN KEY(idCitizen) references Citizen(idCitizen),
	idCampus tinyint
	CONSTRAINT FK_CitizenReport_Campus FOREIGN KEY(idCampus) references Campus(idCampus),
	idVaccine tinyint
	CONSTRAINT FK_CitizenReport_Vaccine FOREIGN KEY(idVaccine) references Vaccine(idVaccine),
	[Dose number] tinyint,
	[Vaccination date] smalldatetime NOT NULL,
	condition bit,
); 