--Reservas de un cliente

CREATE OR ALTER FUNCTION JCAA.fn_ReservaCliente
(
	@IdCliente int
)
RETURNS TABLE
RETURN
(
	SELECT
	id_reserva AS [Codigo Reserva],
	fecha_reserva,
	ER.nombre as [Estado Reserva]
	From JCAA.reserva R
		inner join JCAA.estado_reserva ER on 
		ER.id_estado_reserva = R.id_estado_reserva
	where id_cliente = @IdCliente
);
GO

--Ejecucion de funcion de tabla
select *,
GETDATE() as Fecha_Consulta,
JCAA.fn_NombreCompletoPersona(105) as Estudiante
from JCAA.fn_ReservaCliente(2);
