CREATE TABLE [dbo].[GlavnaKnjigaPricuva]
(
[Broj] [int] NULL CONSTRAINT [DF__GlavnaKnji__Broj__695C9DA1] DEFAULT ((0)),
[Datum] [datetime] NULL,
[NazivDokumenta] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[BrojDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__BrojD__6A50C1DA] DEFAULT ((0)),
[DugujePotrazuje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Duguj__6B44E613] DEFAULT ((0)),
[BrojKnjizenogDokumenta] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[DatumKnjizenogDokumenta] [datetime] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[VrstaKnjizenogDokumenta] [smallint] NULL,
[IDKnjizenogDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__IDKnj__6C390A4C] DEFAULT ((0)),
[Auto] [bit] NOT NULL CONSTRAINT [DF__GlavnaKnji__Auto__6D2D2E85] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPricuva] ADD CONSTRAINT [aaaaaGlavnaKnjigaPricuva_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPricuva] ADD CONSTRAINT [FK_GlavnaKnjigaPricuva_GlavnaKnjigaDokumenti] FOREIGN KEY ([NazivDokumenta]) REFERENCES [dbo].[GlavnaKnjigaDokumenti] ([Naziv]) ON UPDATE CASCADE
GO
