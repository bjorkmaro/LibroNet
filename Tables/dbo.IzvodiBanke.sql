CREATE TABLE [dbo].[IzvodiBanke]
(
[BrojRacuna] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Broj] [nvarchar] (3) COLLATE Croatian_CI_AS NULL,
[Datum] [datetime] NULL,
[Duguje] [float] NULL CONSTRAINT [DF__IzvodiBan__Duguj__5A4F643B] DEFAULT ((0)),
[Potrazuje] [float] NULL CONSTRAINT [DF__IzvodiBan__Potra__5B438874] DEFAULT ((0)),
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Knjizeno] [int] NULL,
[AutoKnjizenje] [bit] NOT NULL CONSTRAINT [DF__IzvodiBan__AutoK__5C37ACAD] DEFAULT ((1)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IzvodiBanke] ADD CONSTRAINT [aaaaaIzvodiBanke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[IzvodiBanke] ([Broj], [BrojRacuna]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BankovniRacuniIzvodiBanke] ON [dbo].[IzvodiBanke] ([BrojRacuna]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IzvodiBanke] ADD CONSTRAINT [IzvodiBanke_FK00] FOREIGN KEY ([BrojRacuna]) REFERENCES [dbo].[BankovniRacuni] ([Broj]) ON UPDATE CASCADE
GO
