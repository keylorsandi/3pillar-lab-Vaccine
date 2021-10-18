USE vaccination;
GO
---------
--Create
---------
CREATE PROCEDURE SP_AddState 
@Name varchar(50),
@Condition bit
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT State(Name,condition)
 VALUES(@Name,@Condition);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdateState 
@ID tinyInt,
@Name varchar(50)
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE State
 SET NAME = @Name
 WHERE idState = @ID;
END
GO
---------
--Delete
---------
CREATE PROCEDURE SP_DeleteState 
@ID tinyInt
AS
BEGIN
BEGIN TRY
 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE State
 WHERE idState = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logic Delete
---------------
CREATE PROCEDURE SP_LogicDeleteState
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE State
 SET condition = 0
 WHERE idState = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO

SELECT * FROM State