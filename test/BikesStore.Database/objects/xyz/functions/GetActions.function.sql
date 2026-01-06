-------------------------------------------------------

PRINT 'Creating function [xyz].[GetActions] ...'
GO

CREATE OR ALTER FUNCTION [xyz].[GetActions]()
RETURNS @ret TABLE
(
	[Id] TINYINT,
	[Name] NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO @ret (Id, [Name])
    SELECT Id, [Name] FROM xyz.SystemActions;

    RETURN;
END;
GO