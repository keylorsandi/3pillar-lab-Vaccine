--Campus SPs
--Create
EXECUTE SP_AddCampus  'Virginia','streed2','2018-03-20 00:00:00', 1, 5;
--Update
EXECUTE SP_UpdateCampus 5, 'Virginia','streed2','2018-03-20 00:00:00', 5 ;
--Physical Delete
EXECUTE SP_DeleteCampus 6;
--Logical Delete
EXECUTE SP_LogicDeleteCampus 4;

--Citizen SPs
--Create
EXECUTE SP_AddCitizen 'Jose','Perez','Acu�a','main streed',87993578,25,1;
--Update
EXECUTE SP_UpdateCitizen 5,'Julio','Perez','Acu�a','main streed',87993578,25;
--Physical Delete 
EXECUTE SP_DeleteCitizen 6
--Logical Delete 
EXECUTE SP_LogicDeleteCitizen 4;

--Citizen Report SPs
--Create
EXECUTE SP_AddCitizenReport 6,9,1,2,'2020-04-20 00:00:00',1;
--Update
EXECUTE SP_UpdateCitizenReport 5,4,8,1,2,'2020-03-20 00:00:00';
--Physical Delete 
EXECUTE SP_DeleteCitizenReport 5
--Logical Delete 
EXECUTE SP_LogicDeleteCitizenReport 4;

--Personnel SPs
--Create
EXECUTE SP_AddPersonnel 'Mauricio','Araya','Juarez','street 59',215469878, 1, 1, 8;
--Update
EXECUTE SP_UpdatePersonnel 6 ,'Mauritcio','Araya','Juarez','street 60',215469878, 2, 5;
--Physical Delete
EXECUTE SP_DeletePersonnel 5;
--Logical Delete
EXECUTE SP_LogicDeletePersonnel 4;

--Personnel Key SPs
--Create
EXECUTE SP_AddPersonnelkey 'Enfermero',1;
--Update
EXECUTE SP_UpdatePersonnelkey 5 ,'aguacate';
--Physical Delete
EXECUTE SP_DeletePersonnelkey 5;
--Logical Delete
EXECUTE SP_LogicDeletePersonnelKey 4;

--State SPs
--Create
EXECUTE SP_AddState 'Durango',1;
--Update
EXECUTE SP_UpdateState 5 ,'Durango';
--Physical Delete
EXECUTE SP_DeleteState 5;
--Logical Delete
EXECUTE SP_LogicDeleteState 4;

--Vaccine SPs
--Create
EXECUTE SP_AddVaccine 'Culebrilla',55,1;
--Update
EXECUTE SP_UpdateVaccine 4,'MMR combinada', 45;
--Physical Delete
EXECUTE SP_DeleteVaccine 4;
--Logical Delete
EXECUTE SP_LogicDeleteVaccine 3;

--Views
--1
SELECT * FROM V_VaccineState;
--2
SELECT * FROM V_CitizenReport;
--3
SELECT FROM V_CitizenCampusBelong;
--4 
SELECT * FROM V_CitizenAge
--5 
SELECT * FROM V_CitizenAge
--6
SELECT * FROM V_CitizenAgeLowerAVG;
--7
SELECT * FROM V_ReportsByCampus;
--8
SELECT FROM V_FirstVaccine;
--9
SELECT * FROM V_Personnel_Vaccine;
--10 
SELECT * FROM V_Personnel_Deleted;
--11
SELECT * FROM V_Personnel_Active;
--12
SELECT * FROM V_Citizen_Deleted;
--13
SELECT FROM V_Citizen_Active;
--14 
SELECT * FROM V_Campus_Deleted
--15 
SELECT * FROM V_Campus_Active