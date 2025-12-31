-------------------------------------------------------

:r "./../enums/Actions.enum.sql"

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
    FROM xyz.Actions
    WHERE Id != $(Actions_Initialization)
);
GO