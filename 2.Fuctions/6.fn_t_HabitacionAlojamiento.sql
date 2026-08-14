CREATE OR ALTER FUNCTION JCAA.fn_HabitacionesAlojamiento
(
@IdAlojamiento int
)
RETURNS TABLE
RETURN
(
	SELECT
		H.id_alojamiento,
		H.numero_habitacion,
		TH.nombrehabitacion,
		TH.capacidad_personas,
		H.precio_noche,
		H.estado,
		H.descripcion

	FROM JCAA.habitacion H INNER JOIN
	JCAA.tipo_habitacion TH ON
	H.id_tipo_habitacion=TH.id_tipo_habitacion
	WHERE id_alojamiento=@IdAlojamiento
);
GO

SELECT*,
	GETDATE() as Fecha_Consulta,
	JCAA.fn_NombreCompletoPersona(105) as Estudiante
FROM JCAA.fn_HabitacionesAlojamiento(2);