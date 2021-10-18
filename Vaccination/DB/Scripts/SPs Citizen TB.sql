USE vaccination;
GO

---------
--Create
---------
CREATE PROCEDURE SP_AddCitizen
@Name varchar(50),
@Maternalsurname varchar(50),
@Paternalsurname varchar(50),
@Address varchar(50),
@Telephonenumber varchar(50),
@Age tinyint,
@Condition bit
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT Citizen(Name,[Maternal surname],[Paternal surname],Address,[Telephone number],Age,condition)
 VALUES(@Name,@Maternalsurname,@Paternalsurname,@Address,@Telephonenumber,@Age,@Condition);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdateCitizen 
@ID tinyInt,
@Name varchar(50),
@Maternalsurname varchar(50),
@Paternalsurname varchar(50),
@Address varchar(50),
@Telephonenumber varchar(50),
@Age tinyint
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE Citizen
 SET NAME = @Name,[Maternal surname] = @Maternalsurname,[Paternal surname] = @Paternalsurname,Address = @Address,[Telephone number] = @Telephonenumber,Age = @Age
 WHERE idCitizen = @ID;
END
GO
---------
--Physical Delete
---------
CREATE PROCEDURE SP_DeleteCitizen 
@ID tinyInt
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE Citizen
 WHERE idCitizen = @ID;

END TRY
BEGIN CATCH
print '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logic Delete
---------------
CREATE PROCEDURE SP_LogicDeleteCitizen
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE Citizen
 SET condition = 0
 WHERE idCitizen = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

SELECT * FROM Citizen