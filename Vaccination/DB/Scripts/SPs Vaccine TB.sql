USE vaccination;
GO

---------
--Create
---------
CREATE PROCEDURE SP_AddVaccine 
@Name varchar(50),
@Dose tinyint,
@Condition bit
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT Vaccine(Name,DosesInStorage,condition)
 VALUES(@Name, @Dose,@Condition);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdateVaccine 
@ID tinyInt,
@Name varchar(50),
@Dose tinyint
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE Vaccine
 SET NAME = @Name, DosesInStorage = @Dose
 WHERE idVaccine = @ID;
END
GO
---------
--Physical Delete
---------
CREATE PROCEDURE SP_DeleteVaccine 
@ID tinyInt
AS
BEGIN
BEGIN TRY
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE Vaccine
 WHERE idVaccine = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logic Delete
---------------
CREATE PROCEDURE SP_LogicDeleteVaccine
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE Vaccine
 SET condition = 0
 WHERE idVaccine = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

SELECT * FROM Vaccine