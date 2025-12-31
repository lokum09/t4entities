PRINT '--------------------------------'
PRINT 'BEGIN Post-Deployment Script'
PRINT '--------------------------------'

PRINT 'Creating function [abc].[GetHello2] ...'
GO

CREATE OR ALTER FUNCTION [abc].[GetHello2](@input NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN CONCAT('Hello ', @input, '!');
END
GO
:setvar Actions_Initialization "1"
:setvar Actions_Complete "2"
:setvar Actions_Withdraw "3"

-------------------------------------------------------


-------------------------------------------------------

PRINT 'SystemActions.seed.sql is running ...'
GO
:setvar Actions_Initialization "1"
:setvar Actions_Complete "2"
:setvar Actions_Withdraw "3"

MERGE INTO [xyz].[SystemActions] AS [Target]
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

-------------------------------------------------------


-------------------------------------------------------

PRINT 'Creating function [xyz].[GetMainActions] ...'
GO

CREATE OR ALTER FUNCTION [xyz].[GetMainActions]
(
	@Id TINYINT
)
RETURNS TABLE
AS
RETURN (
    SELECT Id, [Name]
    FROM xyz.SystemActions
    WHERE Id != @Id
);
GO

PRINT '--------------------------------'
PRINT 'END Post-Deployment Script'
PRINT '--------------------------------'
GO
