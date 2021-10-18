USE vaccination;
GO
---------
--Create
---------

CREATE PROCEDURE SP_AddCampus 
@Name varchar(50),
@Address varchar(50),
@Date smalldatetime,
@Condition bit,
@idState tinyint

AS
BEGIN

EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";

 INSERT Campus(Name,Address,Date,condition,idState)
 VALUES(@Name,@Address,@Date,@Condition,@idState);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdateCampus 
@ID int,
@Name varchar(50),
@Address varchar(50),
@Date smalldatetime,
@idState tinyint
AS
BEGIN
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE Campus
 SET Name = @Name, Address = @Address, Date = @Date, idState = @idState
 WHERE idCampus = @ID;
END
GO
---------
--Delete
---------
CREATE PROCEDURE SP_DeleteCampus 
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 
 DELETE Campus
 WHERE idCampus = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logic Delete
---------------
CREATE PROCEDURE SP_LogicDeleteCampus 
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE Campus
 SET condition = 0
 WHERE idCampus = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
SELECT * FROM Campus