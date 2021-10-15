
--1
CREATE VIEW V_VaccineState AS
SELECT V.Name AS VaccineName, S.Name AS StateName FROM Vaccine V 
INNER JOIN [Citizen report] CR ON V.idVaccine= CR.idVaccine 
INNER JOIN Campus Ca ON CR.idCampus = Ca.idCampus 
INNER JOIN State S ON Ca.idState = S.idState;
--2
CREATE VIEW V_CitizenReport AS
SELECT CONCAT(C.Name ,' ', C.[Paternal surname],' ', C.[Maternal surname]) as [Citizen] , CR.[Dose number],V.Name AS [Vaccine Name] , Ca.Name AS CampusName, CR.[Vaccination date] FROM Citizen C 
INNER JOIN [Citizen report] CR ON CR.idCitizen = C.idCitizen 
INNER JOIN Vaccine V ON CR.idVaccine = V.idVaccine 
INNER JOIN Campus Ca ON CR.idCampus = Ca.idCampus;
--3
CREATE VIEW V_CitizenCampusBelong AS
SELECT c.Name as [Citizen name], Ca.Name AS [Campus name],Ca.Address AS [Campus Address],S.Name AS StateName FROM Citizen C
INNER JOIN [Citizen report] CR ON C.idCitizen = CR.idCitizen
INNER JOIN Campus Ca ON CR.idCampus = Ca.idCampus
INNER JOIN State S ON Ca.idState = S.idState;
--4
CREATE VIEW V_CitizenAge AS
SELECT CONCAT(C.Name,' ',C.[Paternal surname],' ',C.[Maternal surname])as [Citizen Name],C.Age FROM Citizen C WHERE C.Age > (SELECT AVG(Age) FROM Citizen);
--5
CREATE VIEW V_CitizenAgeLowerAVG AS
SELECT CONCAT(C.Name,' ',C.[Paternal surname],' ',C.[Maternal surname])as [Citizen Name],C.Age FROM Citizen C WHERE C.Age < (SELECT AVG(Age) FROM Citizen);
--6
CREATE VIEW V_Storage AS
SELECT SUM(DosesInStorage) AS 'Vaccines in Storage' from Vaccine;
--7
CREATE VIEW V_ReportsByCampus AS
SELECT Ca.Name, COUNT(Ci.Name) AS [Reports by Campus] FROM Citizen Ci 
INNER JOIN [Citizen report] CR ON Ci.idCitizen=CR.idCitizen
INNER JOIN Campus Ca ON CR.idCampus = Ca.idCampus group by Ca.Name

--8
CREATE VIEW Distinct_State
As 
SELECT S.Name
FROM State S
WHERE S.Name <> 'Puebla'

SELECT * FROM Distinct_State

go
--9
CREATE VIEW V_FirstVaccine
As
SELECT Ci.idCitizen, Ci.Name, Ci.[Paternal surname] AS [Paternal Surname], Ci.[Maternal surname] AS [Maternal Surname],Cr.[Vaccination date] As FirstVaccine
FROM Citizen Ci
INNER JOIN [Citizen report] Cr ON Cr.idCitizen = Ci.idCitizen
INNER JOIN Vaccine V ON Cr.idVaccine = V.idVaccine
WHERE Cr.[Dose number] = 1
SELECT * FROM V_FirstVaccine

go
--10
CREATE VIEW V_Personnel_Vaccine
As
SELECT CONCAT(P.Name,'  ' , P.[Paternal surname], '  ', P.[Maternal surname]) AS PersonnelVaccine,  V.Name AS [Vaccine Name]
FROM Personnel P 
INNER JOIN Campus Ca ON Ca.idCampus = P.idCampus
INNER JOIN [Citizen report] Cr ON Cr.idCampus = Ca.idCampus
INNER JOIN Vaccine V ON Cr.idVaccine = V.idVaccine

--11
CREATE VIEW V_Personnel_Deleted
As
SELECT CONCAT(P.Name,'  ' , P.[Paternal surname], '  ', P.[Maternal surname]) AS [Personnel Deleted] FROM Personnel P WHERE condition = 0;

--12
CREATE VIEW V_Personnel_Active
As
SELECT CONCAT(P.Name,'  ' , P.[Paternal surname], '  ', P.[Maternal surname]) AS [Personnel On Duty] FROM Personnel P WHERE condition = 1;

--13
CREATE VIEW V_Citizen_Deleted
As
SELECT CONCAT(C.Name,'  ' , C.[Paternal surname], '  ', C.[Maternal surname]) AS [Citizen Deleted] FROM Citizen C WHERE condition = 0;

--14
CREATE VIEW V_Citizen_Active
As
SELECT CONCAT(C.Name,'  ' , C.[Paternal surname], '  ', C.[Maternal surname]) AS [Citizen Active] FROM Citizen C WHERE condition = 1;

--15
CREATE VIEW V_Campus_Deleted
As
SELECT CONCAT(C.Name,'  ' , C.Address) AS [Campus Deleted] FROM Campus C WHERE condition = 0;

--16
CREATE VIEW V_Campus_Active
As
SELECT CONCAT(C.Name,'  ' , C.Address) AS [Campus Deleted] FROM Campus C WHERE condition = 1;

