USE [IntronDB]
GO

/****** Object:  Table [dbo].[intron_score_junction]    Script Date: 4/29/2020 2:11:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[intron_score_junction](
	[scoreId] [int] NOT NULL,
	[intronId] [int] NOT NULL,
 CONSTRAINT [PK_intron_score_junction] PRIMARY KEY CLUSTERED 
(
	[scoreId] ASC,
	[intronId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[intron_score_junction]  WITH CHECK ADD  CONSTRAINT [FK_intron_score_junction_Intron] FOREIGN KEY([intronId])
REFERENCES [dbo].[Intron] ([intronId])
GO

ALTER TABLE [dbo].[intron_score_junction] CHECK CONSTRAINT [FK_intron_score_junction_Intron]
GO

ALTER TABLE [dbo].[intron_score_junction]  WITH CHECK ADD  CONSTRAINT [FK_intron_score_junction_Score] FOREIGN KEY([scoreId])
REFERENCES [dbo].[Score] ([scoreId])
GO

ALTER TABLE [dbo].[intron_score_junction] CHECK CONSTRAINT [FK_intron_score_junction_Score]
GO


