/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create table for Intron table
*/
USE [IntronDB]
GO

/****** Object:  Table [dbo].[Intron]    Script Date: 4/29/2020 2:31:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Intron](
	[intronId] [int] NOT NULL,
	[intronType] [bit] NULL,
	[subtype] [nchar](5) NULL,
	[intronStartCoord] [bigint] NULL,
	[intronSequence] [varchar](max) NULL,
	[rank] [int] NULL,
	[intronLength] [int] NULL,
	[branchPoint] [varchar](max) NULL,
	[acceptorSpliceSite] [varchar](max) NULL,
	[strand] [bit] NULL,
	[cluster] [int] NULL,
	[frame] [int] NULL,
	[chromosome] [varchar](max) NULL,
	[intronEndCoord] [bigint] NULL,
	[donorSpliceSite] [varchar](max) NULL,
 CONSTRAINT [PK_Intron] PRIMARY KEY CLUSTERED 
(
	[intronId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


