use EcommerceDB
-- Esquemas donde el usuario es propietario
SELECT s.name AS SchemaName
FROM sys.schemas s
JOIN sys.sysusers u ON s.principal_id = u.uid
WHERE u.name = 'user_read';

-- Esquemas a los que el usuario tiene acceso
SELECT s.name AS SchemaName
FROM sys.schemas s
JOIN sys.database_permissions p ON s.schema_id = p.major_id
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
WHERE dp.name = 'user_read'

--revisar todos los objetos asociados con ese usuario
GO
SELECT o.name AS ObjectName, o.type_desc AS ObjectType
FROM sys.objects o
JOIN sys.schemas s ON o.schema_id = s.schema_id
JOIN sys.database_principals p ON s.principal_id = p.principal_id
WHERE p.name = 'user_read';

--Para cambiar la propiedad
ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO dbo;

--ALTER ROLE [db_datareader] DROP MEMBER [user_read];

--delete user
GO
EXEC sp_dropuser 'user_read';
GO
