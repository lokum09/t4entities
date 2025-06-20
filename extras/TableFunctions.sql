SELECT 
    r.ROUTINE_SCHEMA,
    r.ROUTINE_NAME, 
    p.PARAMETER_NAME,
    p.DATA_TYPE,
    p.USER_DEFINED_TYPE_SCHEMA,
    p.USER_DEFINED_TYPE_NAME,
    r.*
FROM INFORMATION_SCHEMA.ROUTINES r
INNER JOIN INFORMATION_SCHEMA.PARAMETERS p ON r.ROUTINE_SCHEMA = p.SPECIFIC_SCHEMA AND r.ROUTINE_NAME = p.SPECIFIC_NAME
WHERE r.ROUTINE_TYPE = 'FUNCTION' AND r.DATA_TYPE = 'TABLE' --AND p.PARAMETER_MODE = 'IN'
ORDER BY p.SPECIFIC_SCHEMA, p.SPECIFIC_NAME, p.ORDINAL_POSITION