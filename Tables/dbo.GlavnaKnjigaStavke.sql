CREATE TABLE [dbo].[GlavnaKnjigaStavke]
(
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Duguje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Duguj__5B0E7E4A] DEFAULT ((0)),
[Potrazuje] [float] NULL CONSTRAINT [DF__GlavnaKnj__Potra__5C02A283] DEFAULT ((0)),
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDokumenta] [int] NULL,
[D] [nvarchar] (40) COLLATE Croatian_CI_AS NULL,
[P] [nvarchar] (40) COLLATE Croatian_CI_AS NULL,
[IDPartnera] [int] NULL,
[Datum] [datetime] NULL,
[IDMjestaTroska] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaStavke] ADD CONSTRAINT [aaaaaGlavnaKnjigaStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaGlavnaKnjigaStavke] ON [dbo].[GlavnaKnjigaStavke] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDDokumenta] ON [dbo].[GlavnaKnjigaStavke] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanGlavnaKnjigaStavke] ON [dbo].[GlavnaKnjigaStavke] ([Konto]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaStavke] ADD CONSTRAINT [GlavnaKnjigaStavke_FK00] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[GlavnaKnjiga] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GlavnaKnjigaStavke] WITH NOCHECK ADD CONSTRAINT [FK_GlavnaKnjigaStavke_MjestaTroska] FOREIGN KEY ([IDMjestaTroska]) REFERENCES [dbo].[MjestaTroska] ([ID])
GO
ALTER TABLE [dbo].[GlavnaKnjigaStavke] ADD CONSTRAINT [GlavnaKnjigaStavke_FK01] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
