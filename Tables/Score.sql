USE [IntronDB]
GO

/****** Object:  Table [dbo].[Score]    Script Date: 4/29/2020 2:11:29 PM ******/
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


