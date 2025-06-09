SELECT 
	s.[name] AS type_schema,
	t.[Name] AS [type_name],
	bt.[name] AS base_type,
	1
FROM sys.types AS t
INNER JOIN sys.schemas AS s ON t.[schema_id] = s.[schema_id]
INNER JOIN sys.types AS bt ON t.system_type_id = bt.user_type_id
WHERE t.is_user_defined = 1 AND t.is_table_type = 0
UNION
SELECT
    s.[name],
    t.[name],
    NULL,
    2
FROM sys.table_types AS t
INNER JOIN sys.schemas AS s ON t.[schema_id] = s.[schema_id]
WHERE t.is_user_defined = 1 AND t.is_table_type = 1
UNION
SELECT
	s.[name],
	t.[Name],
	NULL,
	3
FROM sys.assembly_types AS t
INNER JOIN sys.schemas AS s ON t.[schema_id] = s.[schema_id]
