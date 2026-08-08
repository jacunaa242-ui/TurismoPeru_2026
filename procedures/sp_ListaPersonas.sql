--sp_ListaPersonas.sql
CREATE OR ALTER PROCEDURE jcaa.sp_ListaPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From jcaa.persona
END
GO

