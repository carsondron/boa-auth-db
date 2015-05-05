CREATE TABLE [dbo].[Ledgers]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[LedgerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ledgers] ADD CONSTRAINT [PK_Ledgers] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'The available ledgers in the BOA system. Each
ledger corresponds to a ledger database.', 'SCHEMA', N'dbo', 'TABLE', N'Ledgers', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'Ledgers', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Ledger name', 'SCHEMA', N'dbo', 'TABLE', N'Ledgers', 'COLUMN', N'LedgerName'
GO
