--Total pagado por una reserva
CREATE OR ALTER FUNCTION JCAA.fn_PagoTotalxReserva
(
	@IdReserva int
)
RETURNS money
AS
BEGIN
	Declare @Total money
	Select
		@Total = sum(monto)
	from JCAA.pago
	where id_reserva = @IdReserva;

	RETURN isnull (@Total,0);
END;
GO


--ejecutar
select JCAA.fn_PagoTotalxReserva (2) as MontoPagado,
Getdate() as Fecha_Consulta;