CREATE TABLE [dbo].[Blagajne]
(
[Broj] [smallint] NULL CONSTRAINT [DF__Blagajne__Broj__11D4A34F] DEFAULT ((0)),
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Saldo] [float] NULL CONSTRAINT [DF__Blagajne__Saldo__12C8C788] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[RedniBroj] [int] NULL CONSTRAINT [DF__Blagajne__RedniB__13BCEBC1] DEFAULT ((0)),
[BrojUplate] [int] NULL CONSTRAINT [DF__Blagajne__BrojUp__14B10FFA] DEFAULT ((0)),
[BrojIsplate] [int] NULL CONSTRAINT [DF__Blagajne__BrojIs__15A53433] DEFAULT ((0)),
[BrojZakljucka] [int] NULL CONSTRAINT [DF__Blagajne__BrojZa__1699586C] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blagajne] ADD CONSTRAINT [aaaaaBlagajne_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[Blagajne] ([Broj]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanBlagajne] ON [dbo].[Blagajne] ([Konto]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Blagajne] ([Naziv]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blagajne] ADD CONSTRAINT [FK_Blagajne_KontniPlan] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
