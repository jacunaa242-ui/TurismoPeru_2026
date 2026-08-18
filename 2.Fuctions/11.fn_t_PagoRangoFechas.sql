-- Pagos por rango de fechas

CREATE OR ALTER FUNCTION JCAA.fn_PagosRangoFechas(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
RETURN(
    SELECT
        id_pago AS [Codigo Pago],
        id_reserva AS [Codigo Reserva],
        monto AS [Monto Pagado],
        fecha_pago AS [Fecha de Pago],
        numero_operacion AS [Nro Operacion],
        estado AS [Estado del Pago]
    FROM JCAA.pago
    WHERE CAST(fecha_pago AS DATE) BETWEEN @FechaInicio AND @FechaFin
);
GO

-- Ejecución
SELECT *,
    GETDATE() AS Fecha_Consulta,
    JCAA.fn_NombreCompletoPersona(105) AS Estudiante
FROM JCAA.fn_PagosRangoFechas('2026-01-01', '2026-12-31');
GO