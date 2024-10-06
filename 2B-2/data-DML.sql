USE EcommerceDB
GO

INSERT INTO Usuarios (Nombre, Email, Contrase�a, Direccion)
VALUES
('Carlos Gomez', 'carlos.gomez@example.com', 'hashed_password1', 'Av. Libertador 1234'),
('Maria Perez', 'maria.perez@example.com', 'hashed_password2', 'Calle Falsa 456'),
('Juan Lopez', 'juan.lopez@example.com', 'hashed_password3', 'Calle San Martin 789'),
('Ana Rodriguez', 'ana.rodriguez@example.com', 'hashed_password4', 'Calle Corrientes 101'),
('Jose Martinez', 'jose.martinez@example.com', 'hashed_password5', 'Avenida Rivadavia 202');
GO

INSERT INTO Categorias (Nombre)
VALUES
('Electr�nica'),
('Ropa'),
('Hogar'),
('Deportes'),
('Juguetes');
GO

INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, CategoriaID)
VALUES
('Smartphone X', 'Tel�fono inteligente con pantalla OLED', 299.99, 50, 1),
('Camiseta Deportiva', 'Camiseta transpirable de alta calidad', 19.99, 100, 2),
('Sof� 3 Plazas', 'Sof� c�modo de 3 plazas en color gris', 499.99, 10, 3),
('Bicicleta de Monta�a', 'Bicicleta para terrenos irregulares', 299.99, 20, 4),
('Lego Star Wars', 'Set de construcci�n de la Estrella de la Muerte', 89.99, 30, 5);
GO

INSERT INTO EstadosPedido (Estado) VALUES ('Pendiente'), ('Enviado'), ('Entregado'), ('Cancelado');
GO

INSERT INTO Pedidos (UsuarioID, FechaPedido, EstadoID, Total)
VALUES
(1, GETDATE(), 1, 319.98),  -- Pedido de Carlos Gomez, estado "Pendiente"
(2, GETDATE(), 2, 19.99),   -- Pedido de Maria Perez, estado "Enviado"
(3, GETDATE(), 3, 299.99),  -- Pedido de Juan Lopez, estado "Entregado"
(4, GETDATE(), 1, 589.98),  -- Pedido de Ana Rodriguez, estado "Pendiente"
(5, GETDATE(), 1, 89.99);   -- Pedido de Jose Martinez, estado "Pendiente"
GO

INSERT INTO DetallesPedido (PedidoID, ProductoID, Cantidad, PrecioUnitario)
VALUES
(1, 1, 1, 299.99),  -- Pedido 1, Carlos Gomez compr� un Smartphone X
(1, 2, 1, 19.99),   -- Pedido 1, Carlos Gomez compr� una Camiseta Deportiva
(2, 2, 1, 19.99),   -- Pedido 2, Maria Perez compr� una Camiseta Deportiva
(3, 4, 1, 299.99),  -- Pedido 3, Juan Lopez compr� una Bicicleta de Monta�a
(4, 3, 1, 499.99),  -- Pedido 4, Ana Rodriguez compr� un Sof�
(4, 2, 1, 19.99),   -- Pedido 4, Ana Rodriguez compr� una Camiseta Deportiva
(5, 5, 1, 89.99);   -- Pedido 5, Jose Martinez compr� un Lego Star Wars
GO
