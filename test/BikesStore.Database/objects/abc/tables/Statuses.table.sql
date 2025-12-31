CREATE TABLE [abc].[Statuses] (
    [Id]                            TINYINT         NOT NULL,
    [Name]                          NVARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_abc.Statuses] PRIMARY KEY CLUSTERED ([Id])
);
GO