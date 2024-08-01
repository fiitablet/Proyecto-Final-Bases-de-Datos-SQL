USE TiendaOnline;

-- Seleccionar todos los productos
SELECT * FROM Producto;

-- Actualizar el precio de un producto específico
UPDATE Producto SET precio = 350.00 WHERE id_producto = 3;

-- Eliminar un producto específico
DELETE FROM Producto WHERE id_producto = 3;

-- Cambiar el delimitador para definir la función
DELIMITER $$

-- Crear una función para calcular el total de un pedido
CREATE FUNCTION CalcularTotalPedido(pedido_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(cantidad * precio) INTO total
    FROM Detalle_Pedido
    WHERE id_pedido = pedido_id;
    RETURN total;
END$$

DELIMITER ;

-- Cambiar el delimitador para definir el trigger
DELIMITER $$

-- Crear un trigger para actualizar el stock después de insertar un detalle de pedido
CREATE TRIGGER ActualizarStock
AFTER INSERT ON Detalle_Pedido
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END$$

-- Cambiar el delimitador de nuevo a punto y coma
DELIMITER ;

