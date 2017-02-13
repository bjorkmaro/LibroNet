CREATE TABLE [dbo].[KadroviDopunskiRad]
(
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[RadnoVrijeme] [real] NULL CONSTRAINT [DF__KadroviDo__Radno__73BA3083] DEFAULT ((0)),
[Ulica] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Grad] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ZIP] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Drzava] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDZapisa] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviDopunskiRad] ADD CONSTRAINT [aaaaaKadroviDopunskiRad_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DrzaveKadroviDopunskiRad] ON [dbo].[KadroviDopunskiRad] ([Drzava]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviKadroviDopunskiRad] ON [dbo].[KadroviDopunskiRad] ([Grad]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviKadroviDopunskiRad] ON [dbo].[KadroviDopunskiRad] ([IDZapisa]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviDopunskiRadNaziv] ON [dbo].[KadroviDopunskiRad] ([Naziv]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KadroviDopunskiRad] ([Naziv], [IDZapisa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviDopunskiRad] ADD CONSTRAINT [KadroviDopunskiRad_FK00] FOREIGN KEY ([Drzava]) REFERENCES [dbo].[Drzave] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KadroviDopunskiRad] ADD CONSTRAINT [KadroviDopunskiRad_FK01] FOREIGN KEY ([Grad]) REFERENCES [dbo].[Gradovi] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KadroviDopunskiRad] ADD CONSTRAINT [KadroviDopunskiRad_FK02] FOREIGN KEY ([IDZapisa]) REFERENCES [dbo].[Kadrovi] ([ID]) ON DELETE CASCADE
GO
