/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create table for Score table
*/
USE [IntronDB]
GO

/****** Object:  Table [dbo].[Score]    Script Date: 4/29/2020 2:32:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Score](
	[scoreId] [int] NOT NULL,
	[overallScore] [float] NULL,
	[fiveScore] [float] NULL,
	[threeScore] [float] NULL,
	[breakPointScore] [float] NULL,
	[type] [varchar](255) NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[scoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


