CREATE TABLE [dbo].[UsersInLedgerRoles]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[UserId] [int] NOT NULL,
[LedgerRoleId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersInLedgerRoles] ADD CONSTRAINT [PK_UsersInLedgerRoles] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersInLedgerRoles] ADD CONSTRAINT [FK_UsersInLedgerRoles_LedgerRoles] FOREIGN KEY ([LedgerRoleId]) REFERENCES [dbo].[LedgerRoles] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersInLedgerRoles] ADD CONSTRAINT [FK_UsersInLedgerRoles_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
GO
EXEC sp_addextendedproperty N'MS_Description', N'List of which users are assigned to which roles.', 'SCHEMA', N'dbo', 'TABLE', N'UsersInLedgerRoles', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'UsersInLedgerRoles', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Ledger role user is assigned to', 'SCHEMA', N'dbo', 'TABLE', N'UsersInLedgerRoles', 'COLUMN', N'LedgerRoleId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User assigned to the role', 'SCHEMA', N'dbo', 'TABLE', N'UsersInLedgerRoles', 'COLUMN', N'UserId'
GO
