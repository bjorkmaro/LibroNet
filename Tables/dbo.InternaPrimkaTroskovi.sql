CREATE TABLE [dbo].[InternaPrimkaTroskovi]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Datum] [datetime] NULL,
[Iznos] [float] NULL CONSTRAINT [DF__InternaPr__Iznos__0BE6BFCF] DEFAULT ((0)),
[IDDokumenta] [int] NULL CONSTRAINT [DF__InternaPr__IDDok__0CDAE408] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDRacuna] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimkaTroskovi] ADD CONSTRAINT [aaaaaInternaPrimkaTroskovi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InternaPrimkaInternaPrimkaTroskovi] ON [dbo].[InternaPrimkaTroskovi] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KnjigaURAInternaPrimkaTroskovi] ON [dbo].[InternaPrimkaTroskovi] ([IDRacuna]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TroskoviInternaPrimkaTroskovi] ON [dbo].[InternaPrimkaTroskovi] ([Naziv]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimkaTroskovi] ADD CONSTRAINT [InternaPrimkaTroskovi_FK00] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[InternaPrimka] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InternaPrimkaTroskovi] ADD CONSTRAINT [InternaPrimkaTroskovi_FK01] FOREIGN KEY ([IDRacuna]) REFERENCES [dbo].[KnjigaURA] ([ID])
GO
ALTER TABLE [dbo].[InternaPrimkaTroskovi] ADD CONSTRAINT [InternaPrimkaTroskovi_FK02] FOREIGN KEY ([Naziv]) REFERENCES [dbo].[Troskovi] ([Naziv]) ON UPDATE CASCADE
GO
