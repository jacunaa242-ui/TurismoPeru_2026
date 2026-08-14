--Obtener el nombre completo de una persona
CREATE OR ALTER FUNCTION JCAA.fn_NombreCompletoPersona
(
	@IdPersona int

)
RETURNS VARCHAR (200)
AS
BEGIN
	Declare @NombreCompleto varchar(200)
	Select 
		@NombreCompleto =
		nombres + '  ' + apaterno + '  ' + amaterno 
	from JCAA.persona
	where id_persona = @IdPersona;
	--
	Return @NombreCompleto;
END
GO

--ejecutar funcion
Select JCAA.fn_NombreCompletoPersona (105) AS Persona, getdate() as FechaConsulta;
