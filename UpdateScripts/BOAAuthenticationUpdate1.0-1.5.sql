/*
Run this script on:

        AQTESTDB02.BOAAuthenticationBase    -  This database will be modified

to synchronize it with:

        AQTESTDB02.BOAAuthentication

You are recommended to back up your database before running this script

Script created by SQL Compare version 11.1.3 from Red Gate Software Ltd at 6/05/2015 5:07:55 AM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Users]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
IF COL_LENGTH(N'[dbo].[Users]', N'NewField') IS NULL
ALTER TABLE [dbo].[Users] ADD[NewField] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ChangeUsername]'
GO
IF OBJECT_ID(N'[dbo].[ChangeUsername]', 'P') IS NULL
EXEC sp_executesql N'-- =============================================
-- Author:		Carson Dron
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ChangeUsername] 
	-- Add the parameters for the stored procedure here
	@oldname NVARCHAR(256),
	@newname nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF NOT EXISTS (SELECT UserName FROM dbo.Users WHERE UserName = @newname)
    BEGIN
		UPDATE Users SET UserName = @newname
		WHERE UserName = @oldname
	END
END
'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering extended properties'
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Settings pertaining to authentication such as
password length and complexity requirements.', 'SCHEMA', N'dbo', 'TABLE', N'AuthenticationSettings', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Roles within a ledger. Users can be assigned a
specific role in one or more ledgers.', 'SCHEMA', N'dbo', 'TABLE', N'LedgerRoles', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_updateextendedproperty N'MS_Description', N'The available ledgers in the BOA system. Each
ledger corresponds to a ledger database.', 'SCHEMA', N'dbo', 'TABLE', N'Ledgers', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_updateextendedproperty N'MS_Description', N'List of possible statuses for a user e.g.
Active, inactive.', 'SCHEMA', N'dbo', 'TABLE', N'UserStatuses', NULL, NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Id of user''s current active ledger (may not be required)', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'CurrentLedger'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Number of consecutive unsuccessful login
attempts user has made', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'FailedLoginAttempts'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
