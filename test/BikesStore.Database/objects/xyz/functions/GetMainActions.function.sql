-------------------------------------------------------

:r "./../enums/SystemActions.enum.sql"

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