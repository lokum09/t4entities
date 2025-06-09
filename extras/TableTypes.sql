                        SELECT
                            s.[name] AS type_schema,
                            tt.[name] AS type_name,
                            c.[name] AS column_name,
                            t.[name] AS column_type,
                            CONVERT(int, t.max_length) / 2 AS max_length,
                            c.is_nullable,
							0/2,
							t.*
                        FROM sys.table_types AS tt
                        INNER JOIN sys.columns AS c ON c.[object_id] = tt.type_table_object_id
						INNER JOIN sys.types AS t ON t.user_type_id = c.user_type_id
                        INNER JOIN sys.schemas AS s ON tt.[schema_id] = s.[schema_id]
                        --WHERE tt.is_user_defined = 1 AND tt.is_table_type = 1