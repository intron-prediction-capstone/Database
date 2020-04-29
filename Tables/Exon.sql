USE [IntronDB]
GO

/****** Object:  Table [dbo].[Exon]    Script Date: 4/29/2020 2:10:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Exon](
	[exonId] [int] NOT NULL,
	[exonStartCoordUp] [bigint] NULL,
	[exonEndCoordUp] [bigint] NULL,
	[intronId] [int] NULL,
	[exonStartCoordDown] [bigint] NULL,
	[exonEndCoordDown] [bigint] NULL,
 CONSTRAINT [PK_Exon] PRIMARY KEY CLUSTERED 
(
	[exonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exon]  WITH CHECK ADD  CONSTRAINT [FK_Exon_Intron] FOREIGN KEY([intronId])
REFERENCES [dbo].[Intron] ([intronId])
GO

ALTER TABLE [dbo].[Exon] CHECK CONSTRAINT [FK_Exon_Intron]
GO


