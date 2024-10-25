EVALUATE
TOPN(
    5,
    SUMMARIZECOLUMNS(
        'Dim Fecha'[Fecha ID],
        'Dim Fecha'[Anio],
        'Dim Fecha'[Semestre],
        'Dim Fecha'[Mes],
        "Subtotal", [Subtotal]
    ),
    [Subtotal],
    DESC
)