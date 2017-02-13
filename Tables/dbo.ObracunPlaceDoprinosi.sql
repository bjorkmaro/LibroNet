CREATE TABLE [dbo].[ObracunPlaceDoprinosi]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDObracuna] [int] NULL CONSTRAINT [DF__ObracunPl__IDObr__18B6AB08] DEFAULT ((0)),
[IDDoprinosa] [int] NULL CONSTRAINT [DF__ObracunPl__IDDop__19AACF41] DEFAULT ((0)),
[StopaIz] [real] NULL CONSTRAINT [DF__ObracunPl__Stopa__1A9EF37A] DEFAULT ((0)),
[IznosIz] [float] NULL CONSTRAINT [DF__ObracunPl__Iznos__1B9317B3] DEFAULT ((0)),
[StopaNa] [real] NULL CONSTRAINT [DF__ObracunPl__Stopa__1C873BEC] DEFAULT ((0)),
[IznosNa] [float] NULL CONSTRAINT [DF__ObracunPl__Iznos__1D7B6025] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ObracunPlaceDoprinosi] ADD CONSTRAINT [aaaaaObracunPlaceDoprinosi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DoprinosiObracunPlaceDoprinosi] ON [dbo].[ObracunPlaceDoprinosi] ([IDDoprinosa]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ObracunPlaceObracunPlaceDoprinosi] ON [dbo].[ObracunPlaceDoprinosi] ([IDObracuna]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ObracunPlaceDoprinosi] WITH NOCHECK ADD CONSTRAINT [ObracunPlaceDoprinosi_FK00] FOREIGN KEY ([IDDoprinosa]) REFERENCES [dbo].[Doprinosi] ([ID])
GO
ALTER TABLE [dbo].[ObracunPlaceDoprinosi] ADD CONSTRAINT [ObracunPlaceDoprinosi_FK01] FOREIGN KEY ([IDObracuna]) REFERENCES [dbo].[ObracunPlace] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
