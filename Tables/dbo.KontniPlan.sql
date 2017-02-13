CREATE TABLE [dbo].[KontniPlan]
(
[Broj] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Vrsta] [smallint] NULL CONSTRAINT [DF__KontniPla__Vrsta__1FCDBCEB] DEFAULT ((0)),
[SudjelujeUIzvjestaju] [smallint] NULL CONSTRAINT [DF__KontniPla__Sudje__20C1E124] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[ObveznoMjestoTroska] [bit] NOT NULL CONSTRAINT [DF_KontniPlan_ObveznoMjestoTroska] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KontniPlan] ADD CONSTRAINT [aaaaaKontniPlan_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[KontniPlan] ([Broj]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KontniPlan] ([Naziv], [Vrsta]) ON [PRIMARY]
GO
