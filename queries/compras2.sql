EVALUATE
TOPN(
    5,
    SUMMARIZECOLUMNS(
        'Dim Sucursal'[Sucursal ID],
        'Dim Sucursal'[Nombre Sucursal],
        'Dim Sucursal'[Direccion Sucursal],
        'Dim Producto'[Producto ID],
        'Dim Producto'[Nombre Producto],
        'Dim Producto'[Categoria],
        "Unidades - Fact Compras", [Unidades - Fact Compras]
    ),
    [Unidades - Fact Compras],
    DESC
)