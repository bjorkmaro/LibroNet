CREATE TABLE [dbo].[KPI]
(
[Broj] [int] NULL CONSTRAINT [DF__KPI__Broj__182C9B23] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[PrimiciGotovina] [float] NULL,
[PrimiciZiro] [float] NULL,
[PrimiciNarav] [float] NULL,
[PrimiciPorez] [float] NULL,
[IzdaciGotovina] [float] NULL,
[IzdaciZiro] [float] NULL,
[IzdaciNarav] [float] NULL,
[IzdaciPorez] [float] NULL,
[IzdaciCl19] [float] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[StopaPoreza] [real] NULL CONSTRAINT [DF__KPI__StopaPoreza__1A14E395] DEFAULT ((0)),
[VrstaKnjizenogDokumenta] [smallint] NULL,
[IDKnjizenogDokumenta] [int] NULL CONSTRAINT [DF__KPI__IDKnjizenog__1B0907CE] DEFAULT ((0)),
[DatumKnjizenogDokumenta] [datetime] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KPI] ADD CONSTRAINT [aaaaaKPI_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
