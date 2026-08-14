---Sintaxis Funcion Tabla Multiples Sentencias
CREATE OR ALTER FUNCTION JCAA.fn_nombrefuncion
(
	--@Parametro TipoDato
	@edad int
)
RETURNS @Resultado Table 
(
	Columna1 tipoDato,
	Columna2 tipoDato,
	Columna3 tipoDato
)
AS
BEGIN
	--Instrucciones SQL
RETURN;
END;
GO