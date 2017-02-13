CREATE TABLE [dbo].[IDObrazacDoprinosi]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDokumenta] [int] NULL CONSTRAINT [DF__IDObrazac__IDDok__38B96646] DEFAULT ((0)),
[IDDoprinosa] [int] NULL CONSTRAINT [DF__IDObrazac__IDDop__39AD8A7F] DEFAULT ((0)),
[StopaIz] [real] NULL CONSTRAINT [DF__IDObrazac__Stopa__3AA1AEB8] DEFAULT ((0)),
[StopaNa] [real] NULL CONSTRAINT [DF__IDObrazac__Stopa__3B95D2F1] DEFAULT ((0)),
[IznosIz] [float] NULL CONSTRAINT [DF__IDObrazac__Iznos__3C89F72A] DEFAULT ((0)),
[IznosNa] [float] NULL CONSTRAINT [DF__IDObrazac__Iznos__3D7E1B63] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDObrazacDoprinosi] ADD CONSTRAINT [aaaaaIDObrazacDoprinosi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDObrazacIDObrazacDoprinosi] ON [dbo].[IDObrazacDoprinosi] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DoprinosiIDObrazacDoprinosi] ON [dbo].[IDObrazacDoprinosi] ([IDDoprinosa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDObrazacDoprinosi] ADD CONSTRAINT [IDObrazacDoprinosi_FK01] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[IDObrazac] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[IDObrazacDoprinosi] WITH NOCHECK ADD CONSTRAINT [IDObrazacDoprinosi_FK00] FOREIGN KEY ([IDDoprinosa]) REFERENCES [dbo].[Doprinosi] ([ID])
GO
