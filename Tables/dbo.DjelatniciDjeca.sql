CREATE TABLE [dbo].[DjelatniciDjeca]
(
[Ime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Prezime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Spol] [smallint] NULL CONSTRAINT [DF__Djelatnici__Spol__4C364F0E] DEFAULT ((0)),
[DatumRodjenja] [datetime] NULL,
[Uzdrzavan] [bit] NOT NULL CONSTRAINT [DF__Djelatnic__Uzdrz__4D2A7347] DEFAULT ((0)),
[Invalid] [bit] NOT NULL CONSTRAINT [DF__Djelatnic__Inval__4E1E9780] DEFAULT ((0)),
[IDDjelatnika] [int] NULL CONSTRAINT [DF__Djelatnic__IDDje__4F12BBB9] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciDjeca] ADD CONSTRAINT [aaaaaDjelatniciDjeca_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciDjecaDjelatnika] ON [dbo].[DjelatniciDjeca] ([IDDjelatnika]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DjelatniciDjeca] WITH NOCHECK ADD CONSTRAINT [DjelatniciDjeca_FK00] FOREIGN KEY ([IDDjelatnika]) REFERENCES [dbo].[Djelatnici] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
