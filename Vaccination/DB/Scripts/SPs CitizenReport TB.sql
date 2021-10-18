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

AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT [Citizen report](idCitizen, idCampus, idVaccine, [Dose number], [Vaccination date],condition)
 VALUES(@idCitizen , @idCampus , @idVaccine , @DoseNumber , @VaccinationDate, @Condition);
END
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
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE [Citizen report]
 SET idCitizen = @idCitizen ,idCampus = @idCampus ,idVaccine = @idVaccine ,[Dose number] = @DoseNumber ,[Vaccination date] = @VaccinationDate
 WHERE idReport = @ID;
END
GO
---------
--Delete
---------
CREATE PROCEDURE SP_DeleteCitizenReport 
@ID tinyInt
AS
BEGIN
BEGIN TRY
 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE [Citizen report]
 WHERE idReport = @ID;

END TRY
BEGIN CATCH
print '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

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


SELECT * FROM [Citizen report]