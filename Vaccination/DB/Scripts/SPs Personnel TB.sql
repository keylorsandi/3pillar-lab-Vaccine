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
--EXECUTE SP_AddPersonnel 'Mauricio','Araya','Juarez','street 59',215469878, 1, 0, 8;


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
--EXECUTE SP_UpdatePersonnel 5 ,'Mauricio','Araya','Juarez','street 59',215469878, 0, 8;

GO

---------
--Delete
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
--EXECUTE SP_DeletePersonnel 12

---------------
--Logic Delete
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

--EXECUTE SP_LogicDeletePersonnel 12;


SELECT * FROM Personnel