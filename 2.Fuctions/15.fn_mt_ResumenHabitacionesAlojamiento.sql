-- Función que reciba un alojamiento y devuelva información resumida de sus habitaciones.

CREATE OR ALTER FUNCTION JCAA.fn_MT_ResumenHabitacionesAlojamiento(
    @IdAlojamiento INT
)
RETURNS @Resultado TABLE
(
	TipoHabitacion VARCHAR(50),
	CapacidadPersonas INT,
	CantidadHabitaciones INT,
	HabitacionesDisponibles INT,
	PrecioMinimo DECIMAL(10,2),
	PrecioPromedio DECIMAL(10,2),
	PrecioMaximo DECIMAL(10,2)

)
AS
BEGIN
	INSERT INTO @Resultado
	(
		TipoHabitacion,
		CapacidadPersonas,
		CantidadHabitaciones,
		HabitacionesDisponibles,
		PrecioMinimo,
		PrecioPromedio,
		PrecioMaximo
	)
	SELECT
		TH.nombrehabitacion,
		TH.capacidad_personas,
		COUNT(H.id_habitacion),
		SUM(CASE WHEN H.estado = 'Disponible' THEN 1 ELSE 0 END),
		MIN(H.precio_noche),
		AVG(H.precio_noche),
		MAX(H.precio_noche)
	FROM JCAA.habitacion H
		INNER JOIN JCAA.tipo_habitacion TH ON TH.id_tipo_habitacion = H.id_tipo_habitacion
	WHERE
		H.id_alojamiento = @IdAlojamiento
	GROUP BY
		TH.nombrehabitacion,
		TH.capacidad_personas;

	RETURN;

END;
GO

-- Ejecución
SELECT *,
    GETDATE() AS Fecha_Consulta,
    JCAA.fn_NombreCompletoPersona(105) AS Estudiante
FROM JCAA.fn_MT_ResumenHabitacionesAlojamiento(1);
GO