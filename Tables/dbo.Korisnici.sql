CREATE TABLE [dbo].[Korisnici]
(
[UserName] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Titula] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Ime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Prezime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Sufiks] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Aktivan] [bit] NOT NULL CONSTRAINT [DF_Korisnici_Aktivan] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[Password] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[PromjenaZaporke] [bit] NULL CONSTRAINT [DF_Korisnici_PromjenaZaporke] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Korisnici] ADD CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Korisnici] ON [dbo].[Korisnici] ([UserName]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
