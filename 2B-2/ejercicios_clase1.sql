use EcommerceDB

--1.- Mostrar los productos cuyo stock sea inferior a 30.

SELECT * FROM Productos where Stock < 30

--2.- Mostrar todos los pedidos con los nombres de los productos y los clientes que los hicieron.

SELECT pr.Nombre, u.Nombre FROM Usuarios as u
join Pedidos as pe on pe.UsuarioID = u.UsuarioID
join DetallesPedido dp on dp.PedidoID = pe.PedidoID
join Productos pr on pr.ProductoID = dp.PedidoID

--3.- Calcular el total de ventas por cliente.

SELECT u.Nombre as Cliente ,SUM(de.Cantidad * de.PrecioUnitario) as total FROM Pedidos as pe 
join Usuarios u on u.UsuarioID = pe.UsuarioID
join DetallesPedido de on de.PedidoID = pe.PedidoID
GROUP BY u.Nombre

--4.- Contar cuántos pedidos ha hecho cada cliente.

SELECT u.Nombre ,COUNT(pe.PedidoID) FROM Pedidos as pe 
join Usuarios u on u.UsuarioID = pe.UsuarioID
GROUP BY u.Nombre

--5.- Calcular el precio promedio de los productos vendidos.


--6.- SELEC los productos vendidos en orden de precio descendente.


--7.- Calcular la cantidad de días entre la fecha de registro de un cliente y la fecha de su primer pedido.

--8.- Procedimiento Almacenado: Insertar un nuevo pedido con detalles.
Go
CREATE PROCEDURE InsertPedidoConDetalles
	@usuarioId int,
	@estadoId int,
	@productoId int,
	@cantidad int
as
begin
	
	declare @pedidoId int;
	insert into Pedidos (UsuarioID, EstadoID) values (@usuarioId, @estadoId)
	set @pedidoId = SCOPE_IDENTITY();

	declare @precioUnitario decimal;
	set @precioUnitario = (select Precio from Productos where ProductoID = @productoId)

	insert into DetallesPedido (PedidoID, ProductoID, Cantidad, PrecioUnitario) values (@pedidoId, @productoId, @cantidad, @precioUnitario);
	
	declare @total decimal;
	set @total = @cantidad * @precioUnitario

	update Pedidos set Total = @total where PedidoID = @pedidoId

end;

exec InsertPedidoConDetalles 3, 1, 4, 10

--9.- Trigger: Actualizar el stock de un producto al realizar un pedido.