CREATE TABLE [dbo].[AuthenticationSettings]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Setting] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthenticationSettings] ADD CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Settings pertaining to authentication such as
password length and complexity requirements.', 'SCHEMA', N'dbo', 'TABLE', N'AuthenticationSettings', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'AuthenticationSettings', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Setting name', 'SCHEMA', N'dbo', 'TABLE', N'AuthenticationSettings', 'COLUMN', N'Setting'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Setting value', 'SCHEMA', N'dbo', 'TABLE', N'AuthenticationSettings', 'COLUMN', N'Value'
GO
