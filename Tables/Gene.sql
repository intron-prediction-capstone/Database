/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create table for Gene table
*/
USE [IntronDB]
GO

/****** Object:  Table [dbo].[Gene]    Script Date: 4/29/2020 2:31:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Gene](
	[geneId] [int] NOT NULL,
	[geneName] [varchar](max) NULL,
	[ncbiGeneId] [varchar](max) NULL,
	[ensemblGeneId] [varchar](max) NULL,
	[geneType] [varchar](max) NULL,
	[geneStartCoord] [bigint] NULL,
	[geneEndCoord] [bigint] NULL,
	[geneLength] [int] NULL,
	[geneSequence] [nvarchar](255) NULL,
	[ncbiGeneLink] [nvarchar](255) NULL,
	[ensemblGeneLink] [nvarchar](255) NULL,
	[ucscLink] [nvarchar](255) NULL,
	[speciesId] [int] NULL,
 CONSTRAINT [PK_Gene] PRIMARY KEY CLUSTERED 
(
	[geneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Gene]  WITH CHECK ADD  CONSTRAINT [FK_Gene_Species] FOREIGN KEY([speciesId])
REFERENCES [dbo].[Species] ([speciesId])
GO

ALTER TABLE [dbo].[Gene] CHECK CONSTRAINT [FK_Gene_Species]
GO


