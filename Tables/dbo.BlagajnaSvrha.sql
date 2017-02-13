CREATE TABLE [dbo].[BlagajnaSvrha]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Opis] [ntext] COLLATE Croatian_CI_AS NULL,
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Vrsta] [bit] NOT NULL CONSTRAINT [DF__BlagajnaS__Vrsta__2B947552] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL,
[KPI] [bit] NULL CONSTRAINT [DF_BlagajnaSvrha_KPI] DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlagajnaSvrha] ADD CONSTRAINT [aaaaaBlagajnaSvrha_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanBlagajnaSvrha] ON [dbo].[BlagajnaSvrha] ([Konto]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[BlagajnaSvrha] ([Naziv]) ON [PRIMARY]
GO
