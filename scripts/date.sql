-- Crear la tabla DimFecha
CREATE TABLE DimFecha (
    FechaID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    Dia INT,
    Mes INT,
    Anio INT
);

-- Insertar datos en la tabla DimFecha
INSERT INTO DimFecha (Fecha, Dia, Mes, Anio)
SELECT DISTINCT 
    Fecha,
    DAY(Fecha) AS Dia,
    MONTH(Fecha) AS Mes,
    YEAR(Fecha) AS Anio
FROM (
    SELECT Fecha FROM FactCompras
    UNION
    SELECT Fecha FROM FactVentas
) AS Fechas;
GO

-- Agregar la columna FechaID a FactCompras y FactVentas
ALTER TABLE FactCompras ADD FechaID INT;
ALTER TABLE FactVentas ADD FechaID INT;

-- Actualizar FactCompras y FactVentas para establecer FechaID
UPDATE FactCompras
SET FechaID = (SELECT FechaID FROM DimFecha WHERE DimFecha.Fecha = FactCompras.Fecha);

UPDATE FactVentas
SET FechaID = (SELECT FechaID FROM DimFecha WHERE DimFecha.Fecha = FactVentas.Fecha);

-- Eliminar la columna Fecha de FactCompras y FactVentas
ALTER TABLE FactCompras DROP COLUMN Fecha;
ALTER TABLE FactVentas DROP COLUMN Fecha;

-- Agregar la clave foránea para FechaID
ALTER TABLE FactCompras ADD FOREIGN KEY (FechaID) REFERENCES DimFecha(FechaID);
ALTER TABLE FactVentas ADD FOREIGN KEY (FechaID) REFERENCES DimFecha(FechaID);
GO

-- Agregar la columna Semestre a la tabla DimFecha
ALTER TABLE DimFecha ADD Semestre INT;

-- Actualizar la columna Semestre en función del mes
UPDATE DimFecha
SET Semestre = CASE 
    WHEN Mes BETWEEN 1 AND 6 THEN 1
    WHEN Mes BETWEEN 7 AND 12 THEN 2
END;
GO