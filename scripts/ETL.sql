
CREATE TABLE DimProveedor (
    ProveedorID INT IDENTITY(1,1) PRIMARY KEY,
    CodProveedor VARCHAR(50),
    NombreProveedor VARCHAR(255),
    DireccionProveedor VARCHAR(255),
    NumeroProveedor VARCHAR(50),
    WebProveedor VARCHAR(255)
);
GO


CREATE TABLE DimProducto (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    CodProducto VARCHAR(50),
    NombreProducto VARCHAR(255),
    MarcaProducto VARCHAR(100),
    Categoria VARCHAR(100)
);
GO

CREATE TABLE DimSucursal (
    SucursalID INT IDENTITY(1,1) PRIMARY KEY,
    SodSuSursal VARCHAR(50),
    NombreSucursal VARCHAR(100),
    DireccionSucursal VARCHAR(255),
    Region VARCHAR(100),
    Departamento VARCHAR(100)
);
GO


CREATE TABLE DimCliente (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente VARCHAR(50),
    NombreCliente VARCHAR(255),
    TipoCliente VARCHAR(50),
    DireccionCliente VARCHAR(255),
    NumeroCliente VARCHAR(50)
);
GO


CREATE TABLE DimVendedor (
    VendedorID INT IDENTITY(1,1) PRIMARY KEY,
    CodVendedor VARCHAR(50),
    NombreVendedor VARCHAR(255),
    Vacacionista BIT
);


CREATE TABLE FactCompras (
    CompraID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    ProveedorID INT,
    ProductoID INT,
    SucursalID INT,
    Unidades INT,
    CostoU DECIMAL(10, 2),
    FOREIGN KEY (ProveedorID) REFERENCES DimProveedor(ProveedorID),
    FOREIGN KEY (ProductoID) REFERENCES DimProducto(ProductoID),
    FOREIGN KEY (SucursalID) REFERENCES DimSucursal(SucursalID)
);
GO



CREATE TABLE FactVentas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    VendedorID INT,
    ProductoID INT,
    SucursalID INT,
    Unidades INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES DimCliente(ClienteID),
    FOREIGN KEY (VendedorID) REFERENCES DimVendedor(VendedorID),
    FOREIGN KEY (ProductoID) REFERENCES DimProducto(ProductoID),
    FOREIGN KEY (SucursalID) REFERENCES DimSucursal(SucursalID)
);
GO