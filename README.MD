# SG-FoodMart

El objetivo principal de este proyecto es proporcionar una solución basada en la implementación de un sistema de análisis y reportes para que SG-Food, una megaempresa dedicada a la compra, distribución y comercialización de productos de diversas marcas y categorías, logre un control sólido sobre sus ventas e inventarios. En los últimos años, debido a los cambios en los hábitos de consumo y la creciente tendencia hacia la compra de productos alimentarios y de uso personal para el hogar, las ventas y compras han experimentado un aumento significativo.

En respuesta a este crecimiento reciente, SG-Food necesita optimizar los tiempos de respuesta al realizar análisis sobre sus compras y ventas. Actualmente, el sistema que manejan presenta un tiempo de respuesta demasiado lento y se han enfrentado a problemas en la base de datos principal debido a la cantidad de solicitudes generadas. Por lo tanto, se solicita implementar una solución de Business Intelligence que optimice tanto el tiempo de respuesta como la carga sobre la base de datos central de la empresa.

SG-Food requiere una solución que aborde los problemas mencionados, con el objetivo principal de generar reportes sobre las compras y ventas de la empresa. Se busca la capacidad de crear estos informes en intervalos de tiempo flexibles, según las necesidades que se presenten. La información se obtendrá de la base de datos fuente, pero no se podrá operar directamente desde la fuente original, ya que se deben utilizar las herramientas que se explicarán más adelante en el proyecto.

## Modelo Data Warehouse

Para abordar los problemas mencionados, se propone implementar un Data Warehouse basado en un modelo de constelación de estrellas.

## Modelo de Constelación de Estrellas

El modelo de constelación de estrellas es una arquitectura de Data Warehouse que permite analizar datos a través de múltiples tablas de hechos que comparten dimensiones comunes. Este modelo es útil para escenarios donde se necesita analizar diferentes tipos de transacciones (como compras y ventas) que comparten dimensiones similares (como productos, sucursales, etc.).

### Tablas de Dimensión

Las tablas de dimensión contienen datos descriptivos que proporcionan contexto a los datos transaccionales en las tablas de hechos. En este modelo, se han creado las siguientes tablas de dimensión:

### DimProveedor

- **ProveedorID**: Clave primaria autoincremental que identifica de manera única a cada proveedor.
- **CodProveedor**: Código del proveedor.
- **NombreProveedor**: Nombre del proveedor.
- **DireccionProveedor**: Dirección del proveedor.
- **NumeroProveedor**: Número de contacto del proveedor.
- **WebProveedor**: Página web del proveedor.

### DimProducto

- **ProductoID**: Clave primaria autoincremental que identifica de manera única a cada producto.
- **CodProducto**: Código del producto.
- **NombreProducto**: Nombre del producto.
- **MarcaProducto**: Marca del producto.
- **Categoria**: Categoría del producto.

### DimSucursal

- **SucursalID**: Clave primaria autoincremental que identifica de manera única a cada sucursal.
- **SodSuSursal**: Código de la sucursal.
- **NombreSucursal**: Nombre de la sucursal.
- **DireccionSucursal**: Dirección de la sucursal.
- **Region**: Región de la sucursal.
- **Departamento**: Departamento de la sucursal.

### DimCliente

- **ClienteID**: Clave primaria autoincremental que identifica de manera única a cada cliente.
- **CodigoCliente**: Código del cliente.
- **NombreCliente**: Nombre del cliente.
- **TipoCliente**: Tipo de cliente (por ejemplo, minorista, mayorista).
- **DireccionCliente**: Dirección del cliente.
- **NumeroCliente**: Número de contacto del cliente.

### DimVendedor

- **VendedorID**: Clave primaria autoincremental que identifica de manera única a cada vendedor.
- **CodVendedor**: Código del vendedor.
- **NombreVendedor**: Nombre del vendedor.
- **Vacacionista**: Indicador de si el vendedor está de vacaciones (tipo de datos BIT).

## Tablas de Hechos

Las tablas de hechos contienen datos transaccionales y métricas que se analizan en el Data Warehouse. En este modelo, se han creado las siguientes tablas de hechos:

### FactCompras

- **CompraID**: Clave primaria autoincremental que identifica de manera única a cada compra.
- **Fecha**: Fecha de la compra.
- **ProveedorID**: Clave foránea que referencia a `DimProveedor`.
- **ProductoID**: Clave foránea que referencia a `DimProducto`.
- **SucursalID**: Clave foránea que referencia a `DimSucursal`.
- **Unidades**: Número de unidades compradas.
- **CostoU**: Costo por unidad.

### FactVentas

- **VentaID**: Clave primaria autoincremental que identifica de manera única a cada venta.
- **Fecha**: Fecha de la venta.
- **ClienteID**: Clave foránea que referencia a `DimCliente`.
- **VendedorID**: Clave foránea que referencia a `DimVendedor`.
- **ProductoID**: Clave foránea que referencia a `DimProducto`.
- **SucursalID**: Clave foránea que referencia a `DimSucursal`.
- **Unidades**: Número de unidades vendidas.
- **PrecioUnitario**: Precio por unidad.

## Tablas Fuente

Las tablas fuente (`comp` y `vent`) contienen los datos originales que se cargarán en el Data Warehouse. Estas tablas incluyen información detallada sobre las transacciones de compras y ventas.

### Tabla `comp`

- Contiene datos de compras, incluyendo información sobre proveedores, productos, sucursales, unidades compradas y costo por unidad.

### Tabla `vent`

- Contiene datos de ventas, incluyendo información sobre clientes, vendedores, productos, sucursales, unidades vendidas y precio por unidad.

## Proceso de Carga de Datos

El proceso de carga de datos implica extraer datos de las tablas fuente, transformarlos según sea necesario y cargarlos en las tablas de dimensiones y hechos del Data Warehouse.

### Carga de Dimensiones

Las dimensiones se cargan primero para asegurar que todas las claves foráneas en las tablas de hechos tengan referencias válidas. Se insertan datos únicos en las tablas de dimensiones desde las tablas fuente.

### Carga de Hechos

Una vez que las dimensiones están cargadas, se insertan los datos en las tablas de hechos utilizando las claves foráneas generadas en las tablas de dimensiones. Esto asegura la integridad referencial y permite análisis detallados a través de múltiples dimensiones.
