PRINT 'Creating function [abc].[GetHello2] ...'
GO

CREATE OR ALTER FUNCTION [abc].[GetHello2](@input NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN CONCAT('Hello ', @input, '!');
END
GO