--Reserva Cliente

CREATE OR ALTER FUNCTION JCAA.fn_MSTVF_ReservaCliente
(
	@IdeCliente int
)
RETURNS @Resultado Table
(
	IdReserva int,
	FechaReserva date,
	EstadoReserva varchar(100),
	TotalPagado money
)
AS
BEGIN
	INSERT INTO @Resultado
	(
		IdReserva,
		FechaReserva,
		EstadoReserva,
		TotalPagado
	)
	SELECT
		R.id_reserva,
		r.fecha_reserva,
		ER.nombre,
		isnull (SUM(P.monto), 0)
	FROM JCAA.reserva R INNER JOIN
		JCAA.estado_reserva ER on
		ER.id_estado_reserva=r.id_estado_reserva
	LEFT JOIN
		JCAA.pago P on
		R.id_reserva=P.id_reserva

	WHERE R.id_cliente= @IdeCliente

	GROUP BY 
	R.id_reserva,
	R.fecha_reserva,
	ER.nombre; --Estado Reserva

	RETURN;
END;
GO

SELECT
*,
GETDATE() as Fecha_Consulta,
	JCAA.fn_NombreCompletoPersona(105) as Estudiante
FROM JCAA.fn_ReservaCliente(10);