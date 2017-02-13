CREATE TABLE [dbo].[DjelatniciDoprinos]
(
[Doprinos] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[StopaIz] [real] NULL CONSTRAINT [DF__Djelatnic__Stopa__42ACE4D4] DEFAULT ((0)),
[StopaNa] [real] NULL CONSTRAINT [DF__Djelatnic__Stopa__43A1090D] DEFAULT ((0)),
[VrstaIz] [smallint] NULL CONSTRAINT [DF__Djelatnic__Vrsta__44952D46] DEFAULT ((0)),
[VrstaNa] [smallint] NULL CONSTRAINT [DF__Djelatnic__Vrsta__4589517F] DEFAULT ((0)),
[NajnizaOsnovica] [bit] NOT NULL CONSTRAINT [DF__Djelatnic__Najni__467D75B8] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDjelatnika] [int] NULL CONSTRAINT [DF__Djelatnic__IDDje__477199F1] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciDoprinos] ADD CONSTRAINT [aaaaaDjelatniciDoprinos_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DoprinosiDjelatniciDoprinos] ON [dbo].[DjelatniciDoprinos] ([Doprinos]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Doprinos] ON [dbo].[DjelatniciDoprinos] ([Doprinos], [IDDjelatnika]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciDjelatniciDoprinos] ON [dbo].[DjelatniciDoprinos] ([IDDjelatnika]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciDoprinos] WITH NOCHECK ADD CONSTRAINT [DjelatniciDoprinos_FK01] FOREIGN KEY ([Doprinos]) REFERENCES [dbo].[Doprinosi] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DjelatniciDoprinos] WITH NOCHECK ADD CONSTRAINT [DjelatniciDoprinos_FK00] FOREIGN KEY ([IDDjelatnika]) REFERENCES [dbo].[Djelatnici] ([ID])
GO
