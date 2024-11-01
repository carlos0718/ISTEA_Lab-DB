SELECT princ.name AS Usuario, 
       perm.permission_name AS Permiso, 
       perm.state_desc AS Estado
FROM sys.database_permissions AS perm
JOIN sys.database_principals AS princ 
    ON perm.grantee_principal_id = princ.principal_id
WHERE princ.name = 'powerbi';




-- VER PERMISOS POR TABLA
SELECT * 
FROM fn_my_permissions('Usuarios', 'OBJECT');

-- VER DATOS DE CREACIÓN DE USUARIO
SELECT * 
FROM sys.database_principals where name like 'powerbi'

-- VER DATOS DE PERMISO DE USUARIO
SELECT * 
FROM sys.database_permissions 
where grantee_principal_id = (SELECT principal_id FROM sys.database_principals where name like 'powerbi')

SELECT USER_NAME()

