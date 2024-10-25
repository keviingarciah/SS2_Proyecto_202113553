-- Agregar la columna Subtotal a FactCompras y FactVentas
ALTER TABLE FactCompras ADD Subtotal DECIMAL(10, 2);
ALTER TABLE FactVentas ADD Subtotal DECIMAL(10, 2);

-- Actualizar la columna Subtotal en FactCompras
UPDATE FactCompras
SET Subtotal = Unidades * CostoU;

-- Actualizar la columna Subtotal en FactVentas
UPDATE FactVentas
SET Subtotal = Unidades * PrecioUnitario;
GO