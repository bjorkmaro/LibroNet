CREATE TABLE [dbo].[GlavnaKnjigaPredlosci]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[DokumentGK] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Dokument] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL,
[IDSvrhe] [int] NULL,
[PNB] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[StariNaziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPredlosci] ADD CONSTRAINT [aaaaaGlavnaKnjigaPredlosci_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaOpisGlavnaKnjigaDokumenti] ON [dbo].[GlavnaKnjigaPredlosci] ([DokumentGK]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[GlavnaKnjigaPredlosci] ([Naziv]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaPredlosci] ADD CONSTRAINT [GlavnaKnjigaPredlosci_FK00] FOREIGN KEY ([DokumentGK]) REFERENCES [dbo].[GlavnaKnjigaDokumenti] ([Naziv]) ON UPDATE CASCADE
GO
