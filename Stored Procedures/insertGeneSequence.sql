/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create procedure for inserting gene sequences
*/
USE [IntronDB]
GO

/****** Object:  StoredProcedure [dbo].[insertGeneSequence]    Script Date: 4/29/2020 2:34:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insertGeneSequence]
	@ensemblGeneId varchar(MAX) = null,
	@ensemblTranscriptId nvarchar(255) = null,
	@intronStartCoord bigint = null,
	@intronEndCoord bigint = null,
	@intronSequence varchar(MAX) = null
AS

Update t1 
	SET t1.intronSequence = @intronSequence
	FROM dbo.Intron AS t1
	INNER JOIN dbo.intron_transcript_junction AS t2
	ON t1.intronId = t2.intronId
	INNER JOIN dbo.Transcript as t3
	ON t2.transcriptId = t3.transcriptId
	INNER JOIN dbo.Gene as t4
	ON t3.geneId = t4.geneId
	WHERE t1.intronStartCoord = @intronStartCoord AND t1.intronEndCoord = @intronEndCoord
	AND t3.ensemblId = @ensemblTranscriptId
	AND t4.ensemblGeneId = @ensemblGeneId
GO


