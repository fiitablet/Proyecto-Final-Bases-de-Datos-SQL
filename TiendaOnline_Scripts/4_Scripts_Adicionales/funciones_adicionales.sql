DELIMITER $$

CREATE FUNCTION ObtenerStockDisponible(producto_id INT) RETURNS INT
BEGIN
    DECLARE stock_disponible INT;
    SELECT stock INTO stock_disponible
    FROM Producto
    WHERE id_producto = producto_id;
    RETURN stock_disponible;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION CalcularDescuentoPedido(pedido_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE descuento DECIMAL(10, 2);
    DECLARE total DECIMAL(10, 2);
    SET descuento = 0;

    -- Ejemplo de cálculo: 10% de descuento si el total supera 500
    SELECT SUM(cantidad * precio) INTO total
    FROM Detalle_Pedido
    WHERE id_pedido = pedido_id;

    IF total > 500 THEN
        SET descuento = total * 0.10;
    END IF;

    RETURN descuento;
END$$

DELIMITER ;
DELIMITER $$

CREATE FUNCTION ObtenerNumeroPedidos(cliente_id INT) RETURNS INT
BEGIN
    DECLARE num_pedidos INT;
    SELECT COUNT(*) INTO num_pedidos
    FROM Pedido
    WHERE id_cliente = cliente_id;
    RETURN num_pedidos;
END$$

DELIMITER ;
DELIMITER $$

CREATE FUNCTION ObtenerUltimoPago(pedido_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE ultimo_pago DECIMAL(10, 2);
    SELECT monto INTO ultimo_pago
    FROM Pago
    WHERE id_pedido = pedido_id
    ORDER BY fecha_pago DESC
    LIMIT 1;
    RETURN ultimo_pago;
END$$

DELIMITER ;
