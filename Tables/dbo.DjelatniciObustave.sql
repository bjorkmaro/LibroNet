CREATE TABLE [dbo].[DjelatniciObustave]
(
[NazivObustave] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Iznos] [float] NULL,
[Postotak] [real] NULL,
[PremijuPlaca] [smallint] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDjelatnika] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciObustave] ADD CONSTRAINT [aaaaaDjelatniciObustave_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciDjelatniciObustave] ON [dbo].[DjelatniciObustave] ([IDDjelatnika]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ObustaveDjelatniciObustave] ON [dbo].[DjelatniciObustave] ([NazivObustave]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [NazivObustave] ON [dbo].[DjelatniciObustave] ([NazivObustave], [IDDjelatnika]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciObustave] WITH NOCHECK ADD CONSTRAINT [DjelatniciObustave_FK00] FOREIGN KEY ([IDDjelatnika]) REFERENCES [dbo].[Djelatnici] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DjelatniciObustave] ADD CONSTRAINT [DjelatniciObustave_FK01] FOREIGN KEY ([NazivObustave]) REFERENCES [dbo].[Obustave] ([Naziv]) ON UPDATE CASCADE
GO
