-- Clientes con reservas activas

CREATE OR ALTER FUNCTION JCAA.fn_ClientesReservasActivas
(
)
RETURNS TABLE
RETURN
(
	SELECT
		C.id_persona AS [Codigo Cliente],
		JCAA.fn_NombreCompletoPersona(C.id_persona) AS Cliente,
		R.id_reserva AS [Codigo Reserva],
		R.codigo_reserva AS [Numero Reserva],
		R.fecha_reserva AS [Fecha Reserva],
		R.fecha_inicio AS [Fecha Inicio],
		R.fecha_fin AS [Fecha Fin],
		ER.nombre AS [Estado Reserva]
	FROM JCAA.reserva R
		INNER JOIN JCAA.cliente C ON C.id_persona = R.id_cliente
		INNER JOIN JCAA.estado_reserva ER ON ER.id_estado_reserva = R.id_estado_reserva
	WHERE
	-- Exclimos elementos que representen un estado no confirmado de reserva
		LOWER(ER.nombre) NOT IN ('completada', 'anulada', 'reembolsada', 'vencida', 'no show', 'finalizada')
);
GO

-- Ejecución
SELECT
	*,
	GETDATE() AS [Fecha de Consulta],
	JCAA.fn_NombreCompletoPersona(105) AS Estudiante
FROM JCAA.fn_ClientesReservasActivas();