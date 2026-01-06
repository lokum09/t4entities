PRINT 'Creating function [dbo].[GetHello] ...'
GO

CREATE OR ALTER FUNCTION [dbo].[GetHello](@input1 NVARCHAR(50), @input2 NVARCHAR(50))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN CONCAT(@input1, ' ', @input2);
END
GO