EVALUATE
TOPN(
    5,
    SUMMARIZECOLUMNS(
        'Dim Sucursal'[Sucursal ID],
        'Dim Sucursal'[Nombre Sucursal],
        'Dim Sucursal'[Direccion Sucursal],
        'Dim Vendedor'[Nombre Vendedor],
        'Dim Vendedor'[Vendedor ID],
        "Unidades", [Unidades]
    ),
    [Unidades],
    DESC
)