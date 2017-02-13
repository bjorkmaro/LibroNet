CREATE TABLE [dbo].[Narudzbenica]
(
[Broj] [int] NULL CONSTRAINT [DF__Narudzbeni__Broj__45BE5BA9] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Vrijednost] [float] NULL CONSTRAINT [DF__Narudzben__Vrije__46B27FE2] DEFAULT ((0)),
[TekstPrije] [ntext] COLLATE Croatian_CI_AS NULL,
[TekstIza] [ntext] COLLATE Croatian_CI_AS NULL,
[Veza] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__Narudzbeni__IDPJ__47A6A41B] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDPoslovnice] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Narudzbenica] ADD CONSTRAINT [aaaaaNarudzbenica_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[Narudzbenica] ([Broj]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceNarudzbenica1] ON [dbo].[Narudzbenica] ([IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDPoslovnice] ON [dbo].[Narudzbenica] ([IDPoslovnice]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceNarudzbenica] ON [dbo].[Narudzbenica] ([IDPoslovnice]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriNarudzbenica] ON [dbo].[Narudzbenica] ([Partner]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Narudzbenica] ADD CONSTRAINT [Narudzbenica_FK02] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[Narudzbenica] ADD CONSTRAINT [Narudzbenica_FK01] FOREIGN KEY ([IDPoslovnice]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[Narudzbenica] WITH NOCHECK ADD CONSTRAINT [Narudzbenica_FK00] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
