CREATE TABLE [dbo].[GlavnaKnjiga]
(
[Broj] [int] NULL CONSTRAINT [DF__GlavnaKnji__Broj__30242045] DEFAULT ((0)),
[Datum] [datetime] NULL,
[NazivDokumenta] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[BrojDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__BrojD__3118447E] DEFAULT ((0)),
[DugujePotrazuje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Duguj__320C68B7] DEFAULT ((0)),
[BrojKnjizenogDokumenta] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[DatumKnjizenogDokumenta] [datetime] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[VrstaKnjizenogDokumenta] [smallint] NULL,
[IDKnjizenogDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__IDKnj__33008CF0] DEFAULT ((0)),
[Auto] [bit] NOT NULL CONSTRAINT [DF__GlavnaKnji__Auto__33F4B129] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjiga] ADD CONSTRAINT [aaaaaGlavnaKnjiga_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[GlavnaKnjiga] ([Broj]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[GlavnaKnjiga] ([BrojDokumenta], [NazivDokumenta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjiga] ADD CONSTRAINT [FK_GlavnaKnjiga_GlavnaKnjigaDokumenti] FOREIGN KEY ([NazivDokumenta]) REFERENCES [dbo].[GlavnaKnjigaDokumenti] ([Naziv]) ON UPDATE CASCADE
GO
