--Clasificación del cliente en función a la cantidad de reservas

CREATE OR ALTER FUNCTION JCAA.fn_ClasificacionCliente(
	@IdCliente INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @Cantidad INT;
	DECLARE @Clasificacion VARCHAR(50);
	
	-- Llamamos a la función anterior para obtener el total de reservas
	SET @Cantidad = JCAA.fn_CantidadReservasxCliente(@IdCliente);

	-- Evaluamos la cantidad para asignar la categoría
	IF @Cantidad > 15
		SET @Clasificacion = 'Cliente VIP';
	ELSE IF @Cantidad > 5
		SET @Clasificacion = 'Cliente Frecuente';
	ELSE
		SET @Clasificacion = 'Cliente Nuevo';

	RETURN @Clasificacion;
END;
GO

-- Ejecutar función
SELECT 
JCAA.fn_NombreCompletoPersona(1) AS Cliente,
JCAA.fn_CantidadReservasxCliente(1) AS CantidadReservas,
JCAA.fn_ClasificacionCliente(105) AS Clasificación, GETDATE() AS FechaConsulta,
JCAA.fn_NombreCompletoPersona(105) AS Estudiante;
GO