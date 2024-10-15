use EcommerceDB
go
CREATE TABLE Tiendas (
    Id INT IDENTITY(1,1) PRIMARY KEY,  
    Nombre NVARCHAR(100) NOT NULL,     
    Direccion NVARCHAR(200) NOT NULL, 
    FechaAlta DATE NOT NULL DEFAULT GETDATE(), 
    Habilitado BIT NOT NULL DEFAULT 1 
);

go

INSERT INTO Tiendas (Nombre, Direccion, FechaAlta, Habilitado) VALUES
('Tienda Central', 'Av. Principal 123, Buenos Aires', '2024-01-10', 1),
('Supermercado Norte', 'Calle 9 de Julio 456, Córdoba', '2024-02-15', 1),
('Comercial Oeste', 'Ruta 20 Km 5, Mendoza', '2024-03-05', 1),
('Mercado Sur', 'San Martín 789, Rosario', '2024-04-20', 0),
('Mini Tienda Este', 'Av. Libertador 101, Salta', '2024-05-18', 1),
('Tienda Express', 'Belgrano 555, Mar del Plata', '2024-06-10', 1),
('La Esquina', 'Mitre 999, La Plata', '2024-07-05', 1),
('Almacén Urbano', 'Alem 321, Bariloche', '2024-08-11', 0),
('Centro Market', 'Av. de Mayo 678, San Juan', '2024-09-14', 1),
('Tienda Digital', 'Online - Sin dirección física', '2024-10-01', 1);


------------------------------
ALTER TABLE Tiendas DROP CONSTRAINT [PK__Tiendas__3214EC07F01C0AC3];
go
ALTER TABLE Tiendas ADD CONSTRAINT PK_TiendaId PRIMARY KEY NONCLUSTERED (Id);
go
CREATE CLUSTERED INDEX Index_FechaAlta ON Tiendas (FechaAlta);

select * from Tiendas where FechaAlta between '2023-07-05' and '2024-08-11'
go

CREATE NONCLUSTERED INDEX IndexNC_Total ON Pedidos (Total);

Select * From Pedidos where Total < 589.98
---------------------------------------------------------
Go
ALTER TABLE DetallesPedido
DROP CONSTRAINT [FK__DetallesP__Pedid__46E78A0C]
GO
ALTER TABLE Pedidos DROP CONSTRAINT [PK__Pedidos__09BA1410BE6751F7];
go
ALTER TABLE Pedidos ADD CONSTRAINT PK_PedidoId PRIMARY KEY NONCLUSTERED (PedidoId);
go
ALTER TABLE DetallesPedido ADD CONSTRAINT FK_DetallesPedido_Pedidos FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID)

GO
CREATE CLUSTERED INDEX Index_UsuarioId ON Pedidos (UsuarioID);

SELECT * FROM Pedidos 