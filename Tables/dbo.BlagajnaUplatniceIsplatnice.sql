CREATE TABLE [dbo].[BlagajnaUplatniceIsplatnice]
(
[Blagajna] [smallint] NULL,
[Broj] [int] NULL,
[Datum] [datetime] NULL,
[Tip] [smallint] NULL CONSTRAINT [DF__BlagajnaUpl__Tip__24E777C3] DEFAULT ((0)),
[Primitak] [float] NULL,
[Izdatak] [float] NULL,
[Svrha] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Opis] [ntext] COLLATE Croatian_CI_AS NULL,
[Subjekt] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Blagajnik] [int] NULL,
[IDPartnera] [int] NULL,
[IDZakljucka] [int] NULL,
[RedniBroj] [int] NULL CONSTRAINT [DF__BlagajnaU__Redni__25DB9BFC] DEFAULT ((0)),
[Slobodno] [float] NULL CONSTRAINT [DF__BlagajnaU__Slobo__26CFC035] DEFAULT ((0)),
[KPI] [int] NULL,
[upsize_ts] [timestamp] NULL,
[UID] [varchar] (36) COLLATE Croatian_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] ADD CONSTRAINT [aaaaaBlagajnaUplatniceIsplatnice_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BlagajneBlagajnaUplatniceIsplatnice] ON [dbo].[BlagajnaUplatniceIsplatnice] ([Blagajna]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciBlagajnaUplatniceIsplatnice] ON [dbo].[BlagajnaUplatniceIsplatnice] ([Blagajnik]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BlagajnaUplatniceIsplatniceBroj] ON [dbo].[BlagajnaUplatniceIsplatnice] ([Broj]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[BlagajnaUplatniceIsplatnice] ([Broj], [Tip]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriBlagajnaUplatniceIsplatnice] ON [dbo].[BlagajnaUplatniceIsplatnice] ([IDPartnera]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BlagajnaZakljucakBlagajnaUplatniceIsplatnice] ON [dbo].[BlagajnaUplatniceIsplatnice] ([IDZakljucka]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BlagajnaSvrhaBlagajnaUplatniceIsplatnice] ON [dbo].[BlagajnaUplatniceIsplatnice] ([Svrha]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] WITH NOCHECK ADD CONSTRAINT [BlagajnaUplatniceIsplatni_FK02] FOREIGN KEY ([Blagajna]) REFERENCES [dbo].[Blagajne] ([Broj]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] ADD CONSTRAINT [FK_BlagajnaUplatniceIsplatnice_Korisnici] FOREIGN KEY ([Blagajnik]) REFERENCES [dbo].[Korisnici] ([ID])
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] WITH NOCHECK ADD CONSTRAINT [BlagajnaUplatniceIsplatni_FK04] FOREIGN KEY ([IDPartnera]) REFERENCES [dbo].[Partneri] ([ID])
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] WITH NOCHECK ADD CONSTRAINT [BlagajnaUplatniceIsplatni_FK01] FOREIGN KEY ([IDZakljucka]) REFERENCES [dbo].[BlagajnaZakljucak] ([ID])
GO
ALTER TABLE [dbo].[BlagajnaUplatniceIsplatnice] WITH NOCHECK ADD CONSTRAINT [BlagajnaUplatniceIsplatni_FK00] FOREIGN KEY ([Svrha]) REFERENCES [dbo].[BlagajnaSvrha] ([Naziv]) ON UPDATE CASCADE
GO
