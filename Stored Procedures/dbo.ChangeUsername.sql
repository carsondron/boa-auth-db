
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
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
GO
