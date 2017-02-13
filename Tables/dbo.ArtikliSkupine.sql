CREATE TABLE [dbo].[ArtikliSkupine]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RUCMaloprodaja] [float] NULL CONSTRAINT [DF__ArtikliSk__RUCMa__38EE7070] DEFAULT ((0)),
[RUCVeleprodaja] [float] NULL CONSTRAINT [DF__ArtikliSk__RUCVe__39E294A9] DEFAULT ((0)),
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[RedBroj] [smallint] NULL,
[PP] [bit] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtikliSkupine] ADD CONSTRAINT [aaaaaArtikliSkupine_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[ArtikliSkupine] ([Naziv]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtikliSkupine] WITH NOCHECK ADD CONSTRAINT [FK_ArtikliSkupine_KontniPlan] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
