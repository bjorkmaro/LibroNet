CREATE TABLE [dbo].[GlavnaKnjigaPricuvaStavke]
(
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Duguje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Duguj__61BB7BD9] DEFAULT ((0)),
[Potrazuje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Potra__62AFA012] DEFAULT ((0)),
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__IDDok__63A3C44B] DEFAULT ((0)),
[D] [nvarchar] (40) COLLATE Croatian_CI_AS NULL,
[P] [nvarchar] (40) COLLATE Croatian_CI_AS NULL,
[IDPartnera] [int] NULL,
[Datum] [datetime] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPricuvaStavke] ADD CONSTRAINT [aaaaaGlavnaKnjigaPricuvaStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPricuvaGlavnaKnjigaPricuvaStavke] ON [dbo].[GlavnaKnjigaPricuvaStavke] ([IDDokumenta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPricuvaStavke] ADD CONSTRAINT [GlavnaKnjigaPricuvaStavke_FK00] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[GlavnaKnjigaPricuva] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GlavnaKnjigaPricuvaStavke] ADD CONSTRAINT [FK_GlavnaKnjigaPricuvaStavke_KontniPlan] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
