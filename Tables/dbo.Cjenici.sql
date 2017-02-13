CREATE TABLE [dbo].[Cjenici]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Valuta] [nvarchar] (4) COLLATE Croatian_CI_AS NULL,
[DatumOd] [datetime] NULL,
[DatumDo] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDPJ] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cjenici] ADD CONSTRAINT [aaaaaCjenici_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Cjenici] ([Naziv]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ValuteCjenici] ON [dbo].[Cjenici] ([Valuta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cjenici] ADD CONSTRAINT [FK_Cjenici_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[Cjenici] WITH NOCHECK ADD CONSTRAINT [Cjenici_FK00] FOREIGN KEY ([Valuta]) REFERENCES [dbo].[Valute] ([Skracenica]) ON UPDATE CASCADE
GO
