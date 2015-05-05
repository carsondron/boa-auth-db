CREATE TABLE [dbo].[UserStatuses]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserStatuses] ADD CONSTRAINT [PK_UserStatuses] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'List of possible statuses for a user e.g.
Active, inactive.', 'SCHEMA', N'dbo', 'TABLE', N'UserStatuses', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Status code', 'SCHEMA', N'dbo', 'TABLE', N'UserStatuses', 'COLUMN', N'Code'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'UserStatuses', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Status name', 'SCHEMA', N'dbo', 'TABLE', N'UserStatuses', 'COLUMN', N'Status'
GO
