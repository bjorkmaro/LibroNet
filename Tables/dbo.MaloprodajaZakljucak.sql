CREATE TABLE [dbo].[MaloprodajaZakljucak]
(
[Broj] [int] NULL,
[Datum] [datetime] NULL,
[DeklaracijaGotovina] [float] NULL,
[DeklaracijaCekovi] [float] NULL,
[DeklaracijaSlipovi] [float] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaloprodajaZakljucak] ADD CONSTRAINT [PK_MaloprodajaZakljucak] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
