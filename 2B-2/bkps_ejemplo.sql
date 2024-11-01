use EcommerceDB
go
---BKP Completo
Backup database EcommerceDB
to disk = 'C:\SQLBKP\BKP_Ecommerce.bak'
with name='bkpCompleto'
go

--Insertar datos
INSERT INTO Tiendas 
values	('Dexter','Corrientes 2786', '2024-10-28',0),
		('Fravega', 'Santa Fe 1900','2024-10-28',1)

-- BKP Diferencial
Backup Database EcommerceDB
to disk = 'C:\SQLBKP\BKP_Ecommerce.bak'
with name='bkpDiferencial', Differential
go

--INSERT INTO Usuarios 
--VALUES ('Pepe Argento','pepe@gmail.com', 'hashed_password6', 'Calle Racing 321')

-- BKP de Log
Backup Log EcommerceDB
to disk = 'C:\SQLBKP\BKP_Ecommerce.bak'
with name='bkpLog'
go


--Información de los bkps dentro del archiv .bak
Restore headeronly
from disk = 'C:\SQLBKP\BKP_Ecommerce.bak'

----------R E S T A U R A N D O__EcommerceDB---------
go
-- 1.- Eliminando Base de Datos EcommerceDB
use [master]
drop database EcommerceDB

--2.- Restore de bkps

-- a).- Restaurar el backup completo en NORECOVERY
RESTORE DATABASE EcommerceDB
FROM DISK = 'C:\SQLBKP\BKP_Ecommerce.bak'
WITH FILE = 1, NORECOVERY;
GO

-- b).- Restaurar el backup diferencial en NORECOVERY
RESTORE DATABASE EcommerceDB
FROM DISK = 'C:\SQLBKP\BKP_Ecommerce.bak'
WITH FILE = 2, NORECOVERY;
GO

-- c).- Restaurar el backup del log en RECOVERY
RESTORE LOG EcommerceDB
FROM DISK = 'C:\SQLBKP\BKP_Ecommerce.bak'
WITH FILE = 3, RECOVERY;
GO
