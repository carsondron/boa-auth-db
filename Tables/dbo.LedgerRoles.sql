CREATE TABLE [dbo].[LedgerRoles]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[LedgerId] [int] NOT NULL,
[LedgerRoleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LedgerRoles] ADD CONSTRAINT [PK_LedgerRoles] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LedgerRoles] ADD CONSTRAINT [FK_LedgerRoles_Ledgers] FOREIGN KEY ([LedgerId]) REFERENCES [dbo].[Ledgers] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Roles within a ledger. Users can be assigned a
specific role in one or more ledgers.', 'SCHEMA', N'dbo', 'TABLE', N'LedgerRoles', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'LedgerRoles', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Ledger this role is attached to', 'SCHEMA', N'dbo', 'TABLE', N'LedgerRoles', 'COLUMN', N'LedgerId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Ledger role name', 'SCHEMA', N'dbo', 'TABLE', N'LedgerRoles', 'COLUMN', N'LedgerRoleName'
GO
