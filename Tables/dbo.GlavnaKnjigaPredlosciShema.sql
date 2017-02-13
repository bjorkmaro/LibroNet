CREATE TABLE [dbo].[GlavnaKnjigaPredlosciShema]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Parametar] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[D/P] [nvarchar] (1) COLLATE Croatian_CI_AS NULL,
[+/-] [nvarchar] (1) COLLATE Croatian_CI_AS NULL,
[IDDokumenta] [int] NULL CONSTRAINT [DF__GlavnaKnj__IDDok__71F1E3A2] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPredlosciShema] ADD CONSTRAINT [aaaaaGlavnaKnjigaPredlosciShema_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaDokumentiGlavnaKnjigaDokumentiShema] ON [dbo].[GlavnaKnjigaPredlosciShema] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDDokumenta] ON [dbo].[GlavnaKnjigaPredlosciShema] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanGlavnaKnjigaPredlosciShema] ON [dbo].[GlavnaKnjigaPredlosciShema] ([Konto]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPredlosciShema] ADD CONSTRAINT [GlavnaKnjigaPredlosciShem_FK00] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GlavnaKnjigaPredlosciShema] ADD CONSTRAINT [GlavnaKnjigaPredlosciShem_FK01] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
