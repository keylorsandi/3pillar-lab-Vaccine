USE vaccination;

--------------------------------------------------------------------------------------------------
--CITIZEN
--------------------------------------------------------------------------------------------------
INSERT INTO Citizen
VALUES ('Rodrigo','Peraza','Sanchez','streed2',85516225,40,1);
INSERT INTO Citizen
VALUES ('Migel','Castro','Pereira','streed 3',85254825,45,1);
INSERT INTO Citizen
VALUES ('Melisa','Rosales','Ulloa','streed 8',64517821,35,1);
INSERT INTO Citizen
VALUES ('Rafael','Peraza','Zamora','main streed',87593578,30,1);
INSERT INTO Citizen
VALUES ('Raul','Rodriguez','Solorsano','streed 16',89523578,35,1);
INSERT INTO Citizen
VALUES ('Rafael','Rodriguez','Solorsano','streed 16',89583578,36,1);
GO

--------------------------------------------------------------------------------------------------
--STATE
--------------------------------------------------------------------------------------------------

INSERT INTO State
VALUES ('Aguascalientes',1);
INSERT INTO State
VALUES ('Baja California',1);
INSERT INTO State
VALUES ('Baja California Sur',1);
INSERT INTO State
VALUES ('Campeche',1);
INSERT INTO State
VALUES ('Coahuila',1);
INSERT INTO State
VALUES ('Colima',1);
INSERT INTO State
VALUES ('Chiapas',1);
INSERT INTO State
VALUES ('Chihuahua',1);
INSERT INTO State
VALUES ('Durango',1);
INSERT INTO State
VALUES ('Distrito Federal',1);
GO

--------------------------------------------------------------------------------------------------
--CAMPUS
--------------------------------------------------------------------------------------------------

INSERT INTO Campus
VALUES ('Clodomiro Picado','streed2','2018-03-20 00:00:00', 1, 5);
INSERT INTO Campus
VALUES ('Monseñor Sanabria','streed 3','2018-03-20 00:00:00', 1, 8);
INSERT INTO Campus
VALUES ('Cubujuqui','main streed','2018-03-20 00:00:00', 1,9);
INSERT INTO Campus
VALUES ('Lostalo','streed 5','2018-03-20 00:00:00', 1,4);
INSERT INTO Campus
VALUES ('Hospital del trauma','streed 6','2018-03-20 00:00:00', 1,3);
INSERT INTO Campus 
VALUES ('Clinica Biblica','streed 15','2018-03-20 00:00:00', 1,6);
GO

--------------------------------------------------------------------------------------------------
--PERSONNEL KEY
--------------------------------------------------------------------------------------------------

INSERT INTO [Personnel key]
VALUES ('Medic',1);
INSERT INTO [Personnel key]
VALUES ('Doctor',1);
INSERT INTO [Personnel key]
VALUES ('Militar',1);
INSERT INTO [Personnel key]
VALUES ('Intern',1);
INSERT INTO [Personnel key]
VALUES ('Paramedic',1);
GO
 
--------------------------------------------------------------------------------------------------
--PERSONNEL
--------------------------------------------------------------------------------------------------

INSERT INTO Personnel
VALUES ('Mauricio','Araya','Juarez','street 59',215469878,1, 1, 6);
INSERT INTO Personnel
VALUES ('Marcos','Araya','Sanchez','street 49',256469878,1, 2, 5);
INSERT INTO Personnel
VALUES ('Aurelio','Sandi','Novoa','street 59',58747978, 1, 3, 4);
INSERT INTO Personnel
VALUES ('Pedro','Villalobos','Gutierres','street 59',88559966, 1, 0, 1);
INSERT INTO Personnel
VALUES ('Nanci','Cruz','Agüero','street 59',62440878, 1, 4, 3);
INSERT INTO Personnel
VALUES ('Maribel','Carvaja','Bonilla','street 59',215983878,1, 2, 3);
INSERT INTO Personnel
VALUES ('Roberto','Badilla','Rodriguez','street 59',212543878, 1, 4, 5);
INSERT INTO Personnel
VALUES ('Edubijio','Arroyo','Saenz','street 59',29699878, 1, 3, 2);
GO

--------------------------------------------------------------------------------------------------
--VACCINE
--------------------------------------------------------------------------------------------------
INSERT INTO Vaccine
VALUES ('Pfizer',50, 1);
INSERT INTO Vaccine
VALUES ('Hepatitis B1',50, 1);
INSERT INTO Vaccine
VALUES ('Poliomielitis2',50, 1);
INSERT INTO Vaccine
VALUES ('MMR combinada',50, 1);
INSERT INTO Vaccine
VALUES ('Rotavirus',50, 1);
INSERT INTO Vaccine
VALUES ('Hib',50, 1);
INSERT INTO Vaccine
VALUES ('DTP',50, 1);
INSERT INTO Vaccine
VALUES ('Neumocócica',50, 1);
INSERT INTO Vaccine
VALUES ('VPH',50, 1);
INSERT INTO Vaccine
VALUES ('BCG',50, 1);
GO

--------------------------------------------------------------------------------------------------
--CITIZEN REPORT
--------------------------------------------------------------------------------------------------

INSERT INTO [Citizen report]
VALUES (4,6,1,2,'2020-03-20 00:00:00', 1);
INSERT INTO [Citizen report]
VALUES (3,5,1,2,'2020-03-20 00:00:00', 1);
INSERT INTO [Citizen report]
VALUES (1,1,5,1,'2019-03-29 00:00:00', 1);
INSERT INTO [Citizen report]
VALUES (1,2,9,1,'2016-03-20 00:00:00', 1);
INSERT INTO [Citizen report]
VALUES (2,4,'3',1,'2018-02-03 00:00:00', 1);
INSERT INTO [Citizen report]
VALUES (5,3,5,2,'2019-03-20 00:00:00', 1);
