USE vaccination;
GO
---------
--Create
---------
CREATE PROCEDURE SP_AddCitizenReport
@idCitizen tinyint,
@idCampus tinyint,
@idVaccine tinyint,
@DoseNumber tinyint,
@VaccinationDate smalldatetime,
@Condition bit

as
begin
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT [Citizen report](idCitizen, idCampus, idVaccine, [Dose number], [Vaccination date],condition)
 VALUES(@idCitizen , @idCampus , @idVaccine , @DoseNumber , @VaccinationDate, @Condition);
end
GO
EXECUTE SP_AddCitizenReport 6,9,1,2,'2020-04-20 00:00:00',1;
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdateCitizenReport
@ID tinyint,
@idCitizen tinyint,
@idCampus tinyint,
@idVaccine tinyint,
@DoseNumber tinyint,
@VaccinationDate smalldatetime

as
begin
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE [Citizen report]
 SET idCitizen = @idCitizen ,idCampus = @idCampus ,idVaccine = @idVaccine ,[Dose number] = @DoseNumber ,[Vaccination date] = @VaccinationDate
 WHERE idReport = @ID;
end
GO
EXECUTE SP_UpdateCitizenReport 5,4,8,1,2,'2020-03-20 00:00:00';

GO
---------
--Delete
---------
CREATE PROCEDURE SP_DeleteCitizenReport 
@ID tinyInt
as
begin
BEGIN TRY
 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE [Citizen report]
 WHERE idReport = @ID;

END TRY
BEGIN CATCH
print '[!]ERROR IN THE PROCESS';
END CATCH;
end
GO
EXECUTE SP_DeleteCitizenReport 12

---------------
--Logic Delete
---------------
CREATE PROCEDURE SP_LogicDeleteCitizenReport
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE [Citizen report]
 SET condition = 0
 WHERE idCitizen = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

EXECUTE SP_LogicDeleteCitizenReport 12;




SELECT * FROM [Citizen report]