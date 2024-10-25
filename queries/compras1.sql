SELECT 
    NON EMPTY { [Measures].[Subtotal - Fact Compras] } ON COLUMNS, 
    NON EMPTY 
    TOPCOUNT(
        { 
            ([Dim Fecha].[Fecha ID].[Fecha ID].ALLMEMBERS * 
            [Dim Fecha].[Anio].[Anio].ALLMEMBERS * 
            [Dim Fecha].[Semestre].[Semestre].ALLMEMBERS * 
            [Dim Fecha].[Mes].[Mes].ALLMEMBERS) 
        }, 
        5, 
        [Measures].[Subtotal - Fact Compras]
    ) 
    DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_VALUE, MEMBER_UNIQUE_NAME ON ROWS 
FROM [Seminario2 202113553] 
CELL PROPERTIES VALUE, BACK_COLOR, FORE_COLOR, FORMATTED_VALUE, FORMAT_STRING, FONT_NAME, FONT_SIZE, FONT_FLAGS
CELL PROPERTIES VALUE, BACK_COLOR, FORE_COLOR, FORMATTED_VALUE, FORMAT_STRING, FONT_NAME, FONT_SIZE, FONT_FLAGS