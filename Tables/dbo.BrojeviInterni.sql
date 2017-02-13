CREATE TABLE [dbo].[BrojeviInterni]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDPJ] [int] NULL,
[Dokument] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Broj] [int] NULL CONSTRAINT [DF__BrojeviInt__Broj__047AA831] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BrojeviInterni] ADD CONSTRAINT [aaaaaBrojeviInterni_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceBrojeviInterni] ON [dbo].[BrojeviInterni] ([IDPJ]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BrojeviInterni] ADD CONSTRAINT [BrojeviInterni_FK00] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
