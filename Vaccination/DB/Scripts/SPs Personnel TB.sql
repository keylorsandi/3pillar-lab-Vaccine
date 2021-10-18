USE vaccination;
GO
---------
--Create
---------
CREATE PROCEDURE SP_AddPersonnel 
@Name varchar(50),
@MaternalSurname varchar(50),
@PaternalSurname varchar(50),
@Address varchar(50),
@TelephoneNumber varchar(50),
@Condition bit,
@idPersonnelKey tinyint,
@idCampus tinyint
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 INSERT Personnel(Name,[Maternal surname],[Paternal surname],Address,[Telephone number],condition,[idPersonnel key],idCampus)
 VALUES(@Name, @MaternalSurname, @PaternalSurname, @Address, @TelephoneNumber,@Condition, @idPersonnelKey, @idCampus);
END
GO
---------
--Update
---------
CREATE PROCEDURE SP_UpdatePersonnel 
@ID int,
@Name varchar(50),
@MaternalSurname varchar(50),
@PaternalSurname varchar(50),
@Address varchar(50),
@TelephoneNumber varchar(50),
@idPersonnelKey tinyint,
@idCampus tinyint
AS
BEGIN
 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 UPDATE Personnel
 SET NAME = @Name, [Maternal surname] = @MaternalSurname,[Paternal surname] = @PaternalSurname,Address = @Address,[Telephone number] = @TelephoneNumber,[idPersonnel key] = @idPersonnelKey,idCampus = @idCampus
 WHERE idPersonnel = @ID;
END
GO

---------
--Physical Delete
---------
CREATE PROCEDURE SP_DeletePersonnel 
@ID int
AS
BEGIN
BEGIN TRY
 EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
 DELETE Personnel
 WHERE idPersonnel = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO
---------------
--Logical Delete
---------------
CREATE PROCEDURE SP_LogicDeletePersonnel
@ID int
AS
BEGIN
BEGIN TRY

 EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
 
 UPDATE Personnel
 SET condition = 0
 WHERE idPersonnel = @ID;

END TRY
BEGIN CATCH
PRINT '[!]ERROR IN THE PROCESS';
END CATCH;
END
GO




SELECT * FROM Personnel