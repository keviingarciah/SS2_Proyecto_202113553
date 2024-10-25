EVALUATE
TOPN(
    5,
    SUMMARIZECOLUMNS(
        'Dim Fecha'[Fecha ID],
        'Dim Fecha'[Anio],
        'Dim Fecha'[Semestre],
        'Dim Fecha'[Mes],
        "Unidades - Fact Compras", [Unidades - Fact Compras]
    ),
    [Unidades - Fact Compras],
    DESC
)