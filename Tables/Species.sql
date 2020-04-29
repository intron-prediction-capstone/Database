USE [IntronDB]
GO

/****** Object:  Table [dbo].[Species]    Script Date: 4/29/2020 2:11:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Species](
	[speciesId] [int] NOT NULL,
	[speciesName] [nvarchar](255) NULL,
	[commonName] [nvarchar](255) NULL,
	[genomeVersion] [nvarchar](255) NULL,
	[ensemblVersion] [nvarchar](255) NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[speciesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


