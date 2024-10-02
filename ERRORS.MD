# COMP

- CodProveedor: En blancos \*
- DireccionProveedor: Comillas dobles
- NumeroProveedor: Sean números \*
- CodProducto: En blancos \*
- DireccionSucursal: Comillas dobles
- Unidades: Unidades negativas \*
- CostoU: Bien escrito y unidades negativas \*

# VENT

- CodigoCliente: En blancos \*
- DireccionCliente: Comillas dobles
- NumeroProveedor: Sean números \*
- CodProducto: En blancos \*
- CodVendedor: En blancos \*
- DireccionSucursal: Comillas dobles
- Unidades: Unidades negativas \*
- PrecioUnitario: Bien escrito y unidades negativas \*

ISNULL(CodProducto) || TRIM(CodProducto) == ""
ISNULL(CodProveedor) || TRIM(CodProveedor) == ""

ISNULL(CodigoCliente) || TRIM(CodigoCliente) == ""
ISNULL(CodVendedor) || TRIM(CodVendedor) == ""

Unidades < 0 || PrecioUnitario < 0

!(LEN(TRIM(NumeroProveedor)) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,1,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,2,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,3,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,4,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,5,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,6,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,7,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,8,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,9,1),1) > 0 && FINDSTRING("0123456789",SUBSTRING(NumeroProveedor,10,1),1) > 0)
