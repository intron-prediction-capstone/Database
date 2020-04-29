
/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create table for Transcript table
*/
USE [IntronDB]
GO

/****** Object:  Table [dbo].[Transcript]    Script Date: 4/29/2020 2:33:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transcript](
	[transcriptId] [int] NOT NULL,
	[transcriptEnsemblLink] [nvarchar](255) NULL,
	[transcriptStartCoord] [bigint] NULL,
	[transcriptEndCoord] [bigint] NULL,
	[geneId] [int] NULL,
	[ensemblId] [nvarchar](255) NULL,
 CONSTRAINT [PK_Transcript] PRIMARY KEY CLUSTERED 
(
	[transcriptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD  CONSTRAINT [FK_Transcript_Gene] FOREIGN KEY([geneId])
REFERENCES [dbo].[Gene] ([geneId])
GO

ALTER TABLE [dbo].[Transcript] CHECK CONSTRAINT [FK_Transcript_Gene]
GO


