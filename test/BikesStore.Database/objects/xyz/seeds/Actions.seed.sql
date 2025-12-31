-------------------------------------------------------

:r "./../enums/Actions.enum.sql"

-------------------------------------------------------

PRINT 'Actions.seed.sql is running ...'
GO

MERGE INTO [xyz].[Actions] AS [Target]
USING (VALUES
	  ($(Actions_Initialization),	N'Initialization')
	, ($(Actions_Complete),			N'Complete')
	, ($(Actions_Withdraw),			N'Withdraw')
) AS [Source] ([Id], [Name])
ON ([Target].[Id] = [Source].[Id])
WHEN MATCHED AND (
	   NULLIF([Source].[Name], [Target].[Name]) IS NOT NULL 
	OR NULLIF([Target].[Name], [Source].[Name]) IS NOT NULL 
) THEN
	UPDATE SET
	[Target].[Name] = [Source].[Name]
WHEN NOT MATCHED BY TARGET THEN
	INSERT([Id], [Name])
	VALUES([Source].[Id], [Source].[Name])
WHEN NOT MATCHED BY SOURCE THEN 
	DELETE;
