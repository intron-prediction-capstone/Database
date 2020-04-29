/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create procedure for searching the database
*/
USE [IntronDB]
GO

/****** Object:  StoredProcedure [dbo].[SearchProcedure]    Script Date: 4/29/2020 2:34:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchProcedure]
	@SpeciesName NVARCHAR(255) = null,
	@Version NVARCHAR(255) = null,
	@EnsemblGeneId VARCHAR(MAX) = null,
	@EnsemblTranscriptId NVARCHAR(255) = null,
	@GeneSymbol VARCHAR(MAX) = null,
	@IntronClass BIT = null,
	@Length INT = null,
	@Strand BIT = null,
	@Sequence VARCHAR(MAX) = null,
	@Rank INT = null
AS
BEGIN
SELECT 	
	i.intronType,
	i.subtype,
	i.intronStartCoord,
	i.intronEndCoord,
	i.intronSequence,
	i.rank,
	i.intronLength,
	i.branchPoint,
	i.acceptorSpliceSite,
	i.donorSpliceSite,
	i.strand,
	i.cluster,
	i.frame,
	i.chromosome,
	e.exonStartCoordUp,
	e.exonEndCoordUp,
	e.exonStartCoordUp,
	e.exonEndCoordUp,
	s.overallScore,
	s.fiveScore,
	s.threeScore,
	s.breakPointScore,
	s.type,
	t.ensemblId,
	t.transcriptEnsemblLink,
	t.transcriptStartCoord,
	t.transcriptEndCoord,
	g.geneName,
	g.geneType,
	g.geneStartCoord,
	g.geneEndCoord,
	g.geneLength,
	g.geneSequence,
	g.ncbiGeneId,
	g.ncbiGeneLink,
	g.ensemblGeneId,
	g.ensemblGeneLink,
	g.ucscLink,
	sp.speciesName,
	sp.commonName,
	sp.genomeVersion,
	sp.ensemblversion
	
	FROM Intron AS i
LEFT OUTER JOIN Exon as e
	on i.intronId = e.intronId
LEFT OUTER JOIN intron_score_junction as isj
	on i.intronId = isj.intronId
LEFT OUTER JOIN Score as s
	on isj.scoreId = s.scoreId
LEFT OUTER JOIN intron_transcript_junction AS itj
	ON i.intronId = itj.intronId
LEFT OUTER JOIN Transcript as t
	ON itj.transcriptId = t.transcriptId
LEFT OUTER JOIN Gene as g
	ON t.geneId = g.geneId
LEFT OUTER JOIN Species as sp
	ON g.speciesId = sp.speciesId

WHERE 
	(@SpeciesName IS NULL OR (sp.speciesName = @SpeciesName))
	AND (@Version IS NULL OR (sp.genomeVersion = @Version))
	AND (@EnsemblGeneId IS NULL OR (g.ensemblGeneId = @EnsemblGeneId))
	AND (@EnsemblTranscriptId IS NULL OR (t.ensemblId = @EnsemblTranscriptId))
	AND (@GeneSymbol IS NULL OR (g.geneName = @GeneSymbol))
	AND (@IntronClass IS NULL OR (i.intronType = @IntronClass))
	AND (@Length IS NULL OR (i.intronLength = @Length))
	AND (@Strand IS NULL OR (i.strand = @Strand))
	AND (@Sequence IS NULL OR (i.intronSequence = @Sequence))
	AND (@Rank IS NULL OR (i.rank = @Rank))
END

GO


