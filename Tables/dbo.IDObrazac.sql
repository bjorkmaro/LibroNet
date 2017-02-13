CREATE TABLE [dbo].[IDObrazac]
(
[Mjesec] [smallint] NULL CONSTRAINT [DF__IDObrazac__Mjese__4242D080] DEFAULT ((0)),
[Datum] [datetime] NULL,
[BrojDjelatnika] [smallint] NULL CONSTRAINT [DF__IDObrazac__BrojD__4336F4B9] DEFAULT ((0)),
[Od] [datetime] NULL,
[Do] [datetime] NULL,
[Brutto] [float] NULL CONSTRAINT [DF__IDObrazac__Brutt__442B18F2] DEFAULT ((0)),
[DoprinosiUkupno] [float] NULL CONSTRAINT [DF__IDObrazac__Dopri__451F3D2B] DEFAULT ((0)),
[DoprinosiIz] [float] NULL CONSTRAINT [DF__IDObrazac__Dopri__46136164] DEFAULT ((0)),
[Premije] [float] NULL CONSTRAINT [DF__IDObrazac__Premi__4707859D] DEFAULT ((0)),
[Dohodak] [float] NULL CONSTRAINT [DF__IDObrazac__Dohod__47FBA9D6] DEFAULT ((0)),
[OsobniOdbici] [float] NULL CONSTRAINT [DF__IDObrazac__Osobn__48EFCE0F] DEFAULT ((0)),
[Osnovica] [float] NULL CONSTRAINT [DF__IDObrazac__Osnov__49E3F248] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__IDObrazac__Porez__4AD81681] DEFAULT ((0)),
[Prirez] [float] NULL CONSTRAINT [DF__IDObrazac__Prire__4BCC3ABA] DEFAULT ((0)),
[Novac] [float] NULL CONSTRAINT [DF__IDObrazac__Novac__4CC05EF3] DEFAULT ((0)),
[Mirovina] [float] NULL CONSTRAINT [DF__IDObrazac__Mirov__4DB4832C] DEFAULT ((0)),
[Narav] [float] NULL CONSTRAINT [DF__IDObrazac__Narav__4EA8A765] DEFAULT ((0)),
[Naknade] [float] NULL CONSTRAINT [DF__IDObrazac__Nakna__4F9CCB9E] DEFAULT ((0)),
[Ostalo] [float] NULL CONSTRAINT [DF__IDObrazac__Ostal__5090EFD7] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[NajnizaOsnovica] [float] NULL CONSTRAINT [DF__IDObrazac__Najni__51851410] DEFAULT ((0)),
[DoprinosiIzPosto] [real] NULL CONSTRAINT [DF__IDObrazac__Dopri__52793849] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDObrazac] ADD CONSTRAINT [aaaaaIDObrazac_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
