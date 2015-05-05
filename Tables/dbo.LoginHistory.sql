CREATE TABLE [dbo].[LoginHistory]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [datetime] NOT NULL,
[EventCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Username] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LoginHistory] ADD CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'History of login events.', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description of the event', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Event code', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', 'COLUMN', N'EventCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Timestamp of the event', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', 'COLUMN', N'TimeStamp'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Username of user generating login event', 'SCHEMA', N'dbo', 'TABLE', N'LoginHistory', 'COLUMN', N'Username'
GO
