/*
Kyle Gorman and Will Eccles
SER492 Senior Capstone
Major and Minor Intron Dataset
Create procedure for inserting entries from gtf files
*/
USE [IntronDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertData]    Script Date: 4/29/2020 2:34:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertData] 
--all the variables handled in the database seperated by table
--defaulted to null since if it is not entered it will be entered as null
	@speciesId int = null,
	@speciesName nvarchar(255) = null,
	@commonName nvarchar(255) = null,
	@genomeVersion nvarchar(255) = null,
	@ensemblVersion nvarchar(255) = null,
	
	@geneId int = null,
	@geneName varchar(MAX) = null,
	@ncbiGeneID varchar(MAX) = null,
	@ensemblGeneId varchar(MAX) = null,
	@geneType varchar(MAX) = null,
	@geneStartCoord bigint = null,
	@geneEndCoord bigint = null,
	@geneLength int = null,
	@geneSequence nvarchar(255) = null,
	@ncbiGeneLink nvarchar(255) = null,
	@ensemblGeneLink nvarchar(255) = null,
	@ucscLink nvarchar(255) = null,
	
	@transcriptId int = null,
	@transcriptEnsemblLink nvarchar(255) = null,
	@transcriptStartCoord bigint = null,
	@transcriptEndCoord bigint = null,
	@ensemblId nvarchar(255) = null,

	@intronId int = null,
	@intronType bit = null,
	@subtype nchar(5) = null,
	@intronStartCoord bigint = null,
	@intronSequence varchar(MAX) = null,
	@rank int = null,
	@intronLength int = null,
	@branchPoint varchar(MAX) = null,
	@acceptorSpliceSite varchar(MAX) = null,
	@strand bit = null,
	@cluster int = null,
	@frame int = null,
	@chromosome varchar(MAX) = null,
	@intronEndCoord bigint = null,
	@donorSpliceSite varchar(MAX) = null,

	@scoreId int = null,
	@overallScore float = null,
	@fiveScore float = null,
	@threeScore float = null,
	@breakPointScore float = null,
	@scoreType varchar(255) = null,

	@exonId int = null,
	@exonStartCoordUp bigint = null,
	@exonEndCoordUp bigint = null,
	@exonStartCoordDown bigint = null,
	@exonEndCoordDown bigint = null
AS
--handles inserting into the species table

--handles if the entry does not currently exist
IF NOT EXISTS 
 (
	SELECT *
	FROM Species
	WHERE 
	(@speciesName = speciesName OR @speciesName is NULL) AND
	(@commonName = commonName OR @commonName is NULL) AND
	(@genomeVersion = genomeVersion OR @genomeVersion is NULL) AND
	(@ensemblVersion = ensemblVersion OR @ensemblVersion is NULL)
 )
BEGIN
	--gets the current species id
	SET @speciesId = (SELECT MAX(speciesId) FROM Species)
	--handles if it is the first entry or if it needs to be iterated up one
	if @speciesId is null set @speciesId = 0 else set @speciesId = @speciesId + 1

	--inserts the inputed values into species table 
	INSERT Species (speciesId, speciesName, commonName, genomeVersion, ensemblVersion) 
	VALUES (@speciesId, @speciesName, @commonName, @genomeVersion, @ensemblVersion)
END;

--handles if the entry exists
ELSE 
BEGIN
	--sets the species id to be equal to where the existing species is
	SET @speciesId = (SELECT speciesId FROM Species WHERE 
	(@speciesName = speciesName OR @speciesName is NULL) AND
	(@commonName = commonName OR @commonName is NULL) AND
	(@genomeVersion = genomeVersion OR @genomeVersion is NULL) AND
	(@ensemblVersion = ensemblVersion OR @ensemblVersion is NULL))
END;

--handles inserting into gene table

--handles if the entry does not exist
IF NOT EXISTS 
 (
	SELECT *
	FROM Gene
	WHERE 
	(@geneName = geneName OR @geneName is NULL) AND
	(@ncbiGeneID = ncbiGeneId OR @ncbiGeneId is NULL) AND
	(@ensemblGeneId = ensemblGeneId OR @ensemblGeneId is NULL) AND
	(@geneType = geneType OR @geneType is NULL) AND
	(@geneStartCoord = geneStartCoord OR @geneStartCoord is NULL) AND
	(@geneEndCoord = geneEndCoord OR @geneEndCoord is NULL) AND
	(@geneLength = geneLength OR @geneLength is NULL) AND
	(@geneSequence = geneSequence OR @geneSequence is NULL) AND
	(@ncbiGeneLink = ncbiGeneLink OR @ncbiGeneLink is NULL) AND
	(@ensemblGeneLink = ensemblGeneLink OR @ensemblGeneLink is NULL) AND
	(@ucscLink = ucscLink OR @ucscLink is NULL) AND
	(@speciesId = speciesId or @speciesId is NULL)
 )
BEGIN
	--iterates the gene id up one
	SET @geneId = (SELECT MAX(geneId) FROM Gene)
	--handles if it is the first entry
	if @geneId is null set @geneId = 0 else set @geneId = @geneId + 1

	--inserts the inputed values into the gene table
	INSERT Gene (geneId, geneName, ncbiGeneId, ensemblGeneId, geneType, geneStartCoord, geneEndCoord, geneLength, geneSequence, ncbiGeneLink, ensemblGeneLink, ucscLink, speciesId) 
	VALUES (@geneId, @geneName, @ncbiGeneId, @ensemblGeneId, @geneType, @geneStartCoord, @geneEndCoord, @geneLength, @geneSequence, @ncbiGeneLink, @ensemblGeneLink, @ucscLink, @speciesId)
END;

--handles if the entry exists
ELSE 
BEGIN
	--sets the gene id to be equal to where the existing gene is
	SET @geneId = (SELECT geneId FROM Gene WHERE 
	(@geneName = geneName OR @geneName is NULL) AND
	(@ncbiGeneID = ncbiGeneId OR @ncbiGeneId is NULL) AND
	(@ensemblGeneId = ensemblGeneId OR @ensemblGeneId is NULL) AND
	(@geneType = geneType OR @geneType is NULL) AND
	(@geneStartCoord = geneStartCoord OR @geneStartCoord is NULL) AND
	(@geneEndCoord = geneEndCoord OR @geneEndCoord is NULL) AND
	(@geneLength = geneLength OR @geneLength is NULL) AND
	(@geneSequence = geneSequence OR @geneSequence is NULL) AND
	(@ncbiGeneLink = ncbiGeneLink OR @ncbiGeneLink is NULL) AND
	(@ensemblGeneLink = ensemblGeneLink OR @ensemblGeneLink is NULL) AND
	(@ucscLink = ucscLink OR @ucscLink is NULL) AND
	(@speciesId = speciesId OR @speciesId is NULL))
END;

--handles inserting into transcript table

--handles if the entry does not exist
IF NOT EXISTS 
 (
	SELECT transcriptEnsemblLink, transcriptStartCoord, transcriptEndCoord, ensemblId, geneId
	FROM Transcript
	WHERE 
	(@transcriptEnsemblLink  = transcriptEnsemblLink OR @transcriptEnsemblLink is NULL) AND
	(@transcriptStartCoord  = transcriptStartCoord OR @transcriptStartCoord is NULL) AND
	(@transcriptEndCoord  = transcriptEndCoord OR @transcriptEndCoord is NULL) AND
	(@ensemblId = ensemblId OR @ensemblId is NULL) AND
	(@geneId = geneId OR @geneId is NULL)
 )
BEGIN
	--gets the max value in the ids, adds one, and then sets to a variable
	SET @transcriptId = (SELECT MAX(transcriptId) FROM Transcript)
	--handles if it is the first entry
	if @transcriptId is null set @transcriptId = 0 else set @transcriptId = @transcriptId + 1

	--inserts the inputed values into the transcript table
	INSERT Transcript (transcriptId, transcriptEnsemblLink, transcriptStartCoord, transcriptEndCoord, ensemblId, geneId) 
	VALUES (@transcriptId, @transcriptEnsemblLink, @transcriptStartCoord, @transcriptEndCoord, @ensemblId, @geneId)
END;

--handles if the entry exists
ELSE
BEGIN
	--sets the transcript id to be equal to where the existing transcript is
	SET @transcriptId = (SELECT transcriptId FROM Transcript WHERE 
	(@transcriptEnsemblLink  = transcriptEnsemblLink OR @transcriptEnsemblLink is NULL) AND
	(@transcriptStartCoord  = transcriptStartCoord OR @transcriptStartCoord is NULL) AND
	(@transcriptEndCoord  = transcriptEndCoord OR @transcriptEndCoord is NULL) AND
	(@ensemblId = ensemblId OR @ensemblId is NULL) AND
	(@geneId = geneId OR @geneId is NULL))
END;

--handles inserting into intron table

--handles if the entry does not exist
IF NOT EXISTS 
 (
	SELECT *
	FROM Intron
	WHERE 
	(@intronType = intronType OR @intronType is NULL) AND
	(@subtype = subtype or @subtype is NULL) AND
	(@intronStartCoord = intronStartCoord or @intronStartCoord is null) and
	(@intronSequence = intronSequence or @intronSequence is null) and
	(@rank = Intron.rank or @rank is null) and
	(@intronLength = intronLength or @intronLength is null) and
	(@branchPoint = branchPoint or @branchPoint is null) and
	(@acceptorSpliceSite = acceptorSpliceSite or @acceptorSpliceSite is null) and
	(@strand = strand or @strand is null) and 
	(@cluster = cluster or @cluster is null) and 
	(@frame = frame or @frame is null) and 
	(@chromosome = chromosome or @chromosome is null) and
	(@intronEndCoord = intronEndCoord or @intronEndCoord is null) and
	(@donorSpliceSite = donorSpliceSite or @donorSpliceSite is null)
 )
BEGIN
	--gets the max value in the ids, adds one, and then sets to a variable
	SET @intronId = (SELECT MAX(intronId) FROM Intron)
	--handles if it is the first entry
	if @intronId is null set @intronId = 0 else set @intronId = @intronId + 1

	--inserts the inputed values into the intron table
	INSERT Intron (intronId, intronType, subtype, intronStartCoord, intronSequence, rank, intronLength, branchPoint, acceptorSpliceSite, strand, cluster, frame, chromosome, intronEndCoord, donorSpliceSite) 
	VALUES (@intronId, @intronType, @subtype, @intronStartCoord, @intronSequence, @rank, @intronLength, @branchPoint, @acceptorSpliceSite, @strand, @cluster, @frame, @chromosome, @intronEndCoord, @donorSpliceSite)
END;

--handles if the entry exists
ELSE
BEGIN
	--sets the intron id to be equal to where the existing intron is
	SET @intronId = (SELECT intronId FROM Intron WHERE 
	(@intronType = intronType OR @intronType is NULL) AND
	(@subtype = subtype or @subtype is NULL) AND
	(@intronStartCoord = intronStartCoord or @intronStartCoord is null) and
	(@intronSequence = intronSequence or @intronSequence is null) and
	(@rank = Intron.rank or @rank is null) and
	(@intronLength = intronLength or @intronLength is null) and
	(@branchPoint = branchPoint or @branchPoint is null) and
	(@acceptorSpliceSite = acceptorSpliceSite or @acceptorSpliceSite is null) and
	(@strand = strand or @strand is null) and 
	(@cluster = cluster or @cluster is null) and 
	(@frame = frame or @frame is null) and 
	(@chromosome = chromosome or @chromosome is null) and
	(@intronEndCoord = intronEndCoord or @intronEndCoord is null) and
	(@donorSpliceSite = donorSpliceSite or @donorSpliceSite is null))
END;

--handles inserting into the intron transcript junciton table

--handles if the entry does not exist
IF NOT EXISTS 
	(
		SELECT *
		FROM intron_transcript_junction
		WHERE 
		(@transcriptId = transcriptId) AND
		(@intronId = intronId)
	)
BEGIN
	--inserts the inputed values into the junction table
	INSERT intron_transcript_junction (transcriptId, intronId)
	VALUES (@transcriptId, @intronId)
END;

--handles inserting into the score table

--handles if the entry does not exist
IF NOT EXISTS 
 (
	SELECT *
	FROM Score
	WHERE 
	(@overallScore = overallScore or @overallScore is null) and
	(@fiveScore = fiveScore or @fiveScore is null) and
	(@threeScore = threeScore or @threeScore is null) and
	(@breakPointScore = breakPointScore or @breakPointScore is null) and
	(@scoreType = type or @scoreType is null)
 )
BEGIN
	--gets the max value in the ids, adds one, and then sets to a variable
	SET @scoreId = (SELECT MAX(scoreId) FROM Score)
	--handles if it is the first entry
	if @scoreId is null set @scoreId = 0 else set @scoreId = @scoreId + 1
	
	--inserts the inputed values into the score table
	INSERT Score (scoreId, overallScore, fiveScore, threeScore, breakPointScore, type) 
	VALUES (@scoreId, @overallScore, @fiveScore, @threeScore, @breakPointScore, @scoreType)
END;

--handles if the entry exists
ELSE
BEGIN
	--sets the score id to be equal to where the existing score entry is
	SET @scoreId = (SELECT scoreId FROM Score WHERE 
	(@overallScore = overallScore or @overallScore is null) and
	(@fiveScore = fiveScore or @fiveScore is null) and
	(@threeScore = threeScore or @threeScore is null) and
	(@breakPointScore = breakPointScore or @breakPointScore is null) and
	(@scoreType = type or @scoreType is null))
END;
--handldes inserting into the intron score junction table

--handles if the entry does not exist
IF NOT EXISTS 
	(
		SELECT *
		FROM intron_score_junction
		WHERE 
		(@scoreId = scoreId) AND
		(@intronId = intronId)
	)
BEGIN
	--inserts the inputed values into the junction table
	INSERT intron_score_junction (scoreId, intronId)
	VALUES (@scoreId, @intronId)
END;

--handles inserting into the the exon table

--handles if the entry does not exist
IF NOT EXISTS 
 (
	SELECT *
	FROM Exon
	WHERE 
	(@exonStartCoordUp = exonStartCoordUp or @exonStartCoordUp is null) and
	(@exonEndCoordUp = exonEndCoordUp or @exonEndCoordUp is null) and
	(@exonStartCoordDown = exonStartCoordDown or @exonStartCoordDown is null) and
	(@exonEndCoordUp = exonEndCoordUp or @exonEndCoordUp is null) and
	(@intronId = intronId or @intronId is null)
 )
BEGIN
	--gets the max value in the ids, adds one, and then sets to a variable
	SET @exonId = (SELECT MAX(exonId) FROM Exon)
	--handles if it is the first entry
	if @exonId is null set @exonId = 0 else set @exonId = @exonId + 1
	
	--inserts the inputed values into exon
	INSERT Exon (exonId, exonStartCoordUp, exonEndCoordUp, exonStartCoordDown, exonEndCoordDown, intronId) 
	VALUES (@exonId, @exonStartCoordUp, @exonEndCoordUp, @exonStartCoordDown, @exonEndCoordDown, @intronId)
END;

--handles if the entry exists
ELSE
BEGIN
	--sets the exon id to be equal to where the existing exon is
	SET @exonId = (SELECT exonId FROM Exon WHERE 
	(@exonStartCoordUp = exonStartCoordUp or @exonStartCoordUp is null) and
	(@exonEndCoordUp = exonEndCoordUp or @exonEndCoordUp is null) and
	(@exonStartCoordDown = exonStartCoordDown or @exonStartCoordDown is null) and
	(@exonEndCoordUp = exonEndCoordUp or @exonEndCoordUp is null) and
	(@intronId = intronId or @intronId is null))
END;
GO


