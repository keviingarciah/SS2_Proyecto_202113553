EVALUATE
TOPN(
    5,
    SUMMARIZECOLUMNS(
        'Dim Sucursal'[Sucursal ID],
        'Dim Sucursal'[Region],
        'Dim Producto'[Producto ID],
        'Dim Producto'[Categoria],
        'Dim Producto'[Marca Producto],
        'Dim Producto'[Nombre Producto],
        "Subtotal", [Subtotal]
    ),
    [Subtotal],
    DESC
)