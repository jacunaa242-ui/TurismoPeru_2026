--Calcular el IGV de un Pago
CREATE OR ALTER FUNCTION JCAA.fn_CalcularIGVPago
(
	@monto money
)
RETURNS money
as
begin
	return @monto*0.18;
end;
go


select JCAA.fn_CalcularIGVPago(459) as IGV,
GETDATE() as Fecha_Consulta;


--Ejecutar en consulta real
Select
monto,
JCAA.fn_CalcularIGVPago(monto) as IGV, GETDATE () as Fecha_Consulta
from JCAA.pago
where monto >=0