USE vaccination;
GO
---------
--Create
---------
CREATE PROCEDURE SP_AddPersonnelkey 

@Name varchar(50),
@Condition bit
AS
BEGIN
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT [Personnel key](Name, condition)
 VALUES(@Name,@Condition);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdatePersonnelkey 
@ID tinyInt,
@Name varchar(50)
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE [Personnel key]
 SET NAME = @Name
 WHERE [idPersonnel key] = @ID;
END
GO
---------
--Physical Delete
---------
CREATE PROCEDURE SP_DeletePersonnelkey 
@ID tinyInt
AS
BEGIN
BEGIN TRY
 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE [Personnel key]
 WHERE [idPersonnel key] = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logical Delete
---------------
CREATE PROCEDURE SP_LogicDeletePersonnelKey
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE [Personnel key]
 SET condition = 0
 WHERE [idPersonnel key] = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

SELECT * FROM [Personnel key]