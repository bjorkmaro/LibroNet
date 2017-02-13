CREATE TABLE [dbo].[Doprinosi]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[StopaIz] [real] NULL CONSTRAINT [DF__Doprinosi__Stopa__32767D0B] DEFAULT ((0)),
[StopaNa] [real] NULL CONSTRAINT [DF__Doprinosi__Stopa__336AA144] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[RadnoVrijeme] [bit] NOT NULL CONSTRAINT [DF__Doprinosi__Radno__345EC57D] DEFAULT ((0)),
[NajnizaOsnovica] [bit] NOT NULL CONSTRAINT [DF__Doprinosi__Najni__3552E9B6] DEFAULT ((0)),
[RedBroj] [smallint] NULL CONSTRAINT [DF__Doprinosi__RedBr__36470DEF] DEFAULT ((0)),
[RedBroj1] [smallint] NULL CONSTRAINT [DF_Doprinosi_RedBroj1] DEFAULT ((0)),
[KontoIzDuguje] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[KontoIzPotrazuje] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[KontoNaDuguje] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[KontoNaPotrazuje] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[IDPartnera] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doprinosi] ADD CONSTRAINT [aaaaaDoprinosi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriDoprinosi] ON [dbo].[Doprinosi] ([IDPartnera]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanDoprinosi] ON [dbo].[Doprinosi] ([KontoIzDuguje]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanDoprinosi1] ON [dbo].[Doprinosi] ([KontoIzPotrazuje]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanDoprinosi2] ON [dbo].[Doprinosi] ([KontoNaDuguje]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanDoprinosi3] ON [dbo].[Doprinosi] ([KontoNaPotrazuje]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Doprinosi] ([Naziv]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
