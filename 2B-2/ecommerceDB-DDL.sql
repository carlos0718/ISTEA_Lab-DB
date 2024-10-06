-- Crear la base de datos
CREATE DATABASE EcommerceDB;
GO

-- Usar la base de datos recién creada
USE EcommerceDB;
GO

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Contraseña NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);
GO

-- Tabla de Estados de Pedido
CREATE TABLE EstadosPedido (
    EstadoID INT IDENTITY(1,1) PRIMARY KEY,
    Estado NVARCHAR(50) NOT NULL
);
GO

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    FechaPedido DATETIME DEFAULT GETDATE(),
    EstadoID INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (EstadoID) REFERENCES EstadosPedido(EstadoID)
);
GO

-- Tabla de Detalles del Pedido
CREATE TABLE DetallesPedido (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO
