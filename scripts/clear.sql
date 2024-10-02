-- Limpiar las tablas en la base de datos 1
DELETE FROM seminario2_db1.dbo.comp;
GO

DELETE FROM seminario2_db1.dbo.vent;
GO


-- Limpiar las tablas en la base de datos 2
DELETE FROM seminario2_db2.dbo.comp;
GO

DELETE FROM seminario2_db2.dbo.vent;
GO


-- Limpiar modelo DWH
DELETE FROM seminario2_202113553.dbo.FactCompras;
GO

DELETE FROM seminario2_202113553.dbo.FactVentas;
GO

DELETE FROM seminario2_202113553.dbo.DimCliente;
GO

DELETE FROM seminario2_202113553.dbo.DimProducto;
GO 

DELETE FROM seminario2_202113553.dbo.DimProveedor;
GO

DELETE FROM seminario2_202113553.dbo.DimSucursal;
GO

DELETE FROM seminario2_202113553.dbo.DimVendedor;
GO
