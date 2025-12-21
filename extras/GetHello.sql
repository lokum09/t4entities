create schema abc;

CREATE FUNCTION abc.GetHello2()
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN N'Hello world2!'
END
GO
