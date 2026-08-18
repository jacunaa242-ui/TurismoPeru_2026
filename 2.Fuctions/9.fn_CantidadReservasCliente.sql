--Cantidad de reservas por cliente

CREATE OR ALTER FUNCTION JCAA.fn_CantidadReservasxCliente
(
	@IdCliente INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Cantidad INT;
	
	SELECT 
		@Cantidad = COUNT(id_reserva)
	FROM JCAA.reserva
	WHERE id_cliente = @IdCliente;

	-- Retorna 0 si el cliente no tiene ninguna reserva
	RETURN ISNULL(@Cantidad, 0);
END;
GO

-- Ejecutar función
SELECT 
JCAA.fn_NombreCompletoPersona(1) AS Cliente, JCAA.fn_CantidadReservasxCliente(1) 
AS CantidadReservas, GETDATE() AS FechaConsulta,
JCAA.fn_NombreCompletoPersona(105) AS Estudiante;
GO