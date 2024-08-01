USE TiendaOnline;

-- Insertar productos
INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES
('Producto 1', 'Descripcion 1', 100.00, 10),
('Producto 2', 'Descripcion 2', 200.00, 20);

-- Insertar clientes
INSERT INTO Cliente (nombre, email, telefono) VALUES
('Cliente 1', 'cliente1@example.com', '1234567890'),
('Cliente 2', 'cliente2@example.com', '0987654321');

-- Insertar pedidos
INSERT INTO Pedido (fecha, id_cliente) VALUES
('2024-01-01 10:00:00', 1),
('2024-01-02 11:00:00', 2);

-- Insertar detalles de pedidos
INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio) VALUES
(1, 1, 2, 100.00),
(1, 2, 1, 200.00),
(2, 1, 1, 100.00);

-- Insertar pagos
INSERT INTO Pago (id_pedido, fecha_pago, monto) VALUES
(1, '2024-01-01 12:00:00', 400.00),
(2, '2024-01-02 13:00:00', 100.00);

-- Insertar un nuevo producto (esto agregará un producto con un nuevo id_producto autoincremental)
INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES 
('Producto 3', 'Descripcion 3', 300.00, 30);

