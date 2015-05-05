CREATE TABLE [dbo].[Users]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[UserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PasswordHash] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [int] NOT NULL CONSTRAINT [DF__Users__Status__145C0A3F] DEFAULT ((1)),
[CurrentLedger] [int] NULL,
[Email] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailValidated] [bit] NOT NULL CONSTRAINT [DF__Users__EmailVali__15502E78] DEFAULT ((0)),
[Mobile] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobileValidated] [bit] NOT NULL CONSTRAINT [DF__Users__MobileVal__164452B1] DEFAULT ((0)),
[FailedLoginAttempts] [int] NOT NULL CONSTRAINT [DF__Users__FailedLog__173876EA] DEFAULT ((0)),
[PasswordChanged] [datetime] NULL,
[NewField] [nvarchar] (256) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_Ledgers] FOREIGN KEY ([CurrentLedger]) REFERENCES [dbo].[Ledgers] ([Id])
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [FK_Users_UserStatuses] FOREIGN KEY ([Status]) REFERENCES [dbo].[UserStatuses] ([Id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contains information about a user login.', 'SCHEMA', N'dbo', 'TABLE', N'Users', NULL, NULL
GO

EXEC sp_addextendedproperty N'MS_Description', N'Id of user''s current active ledger (may not be required)', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'CurrentLedger'
GO

EXEC sp_addextendedproperty N'MS_Description', N'User''s email address', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'Email'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether user''s email address has been verified', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'EmailValidated'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Number of consecutive unsuccessful login
attempts user has made', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'FailedLoginAttempts'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary Key', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'Id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User''s mobile phone number', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'Mobile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether user''s mobile number has been verified', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'MobileValidated'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date user last changed their password', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'PasswordChanged'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Hash of user''s password combined with a salt', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'PasswordHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Status of user''s account e.g. locked, inactive', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User''s login name', 'SCHEMA', N'dbo', 'TABLE', N'Users', 'COLUMN', N'UserName'
GO
