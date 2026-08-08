--sp_ListaClientes.sql

CREATE OR ALTER PROCEDURE jcaa.sp_ListaClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From jcaa.persona p
    inner join jcaa.cliente c
    on p.id_persona = c.id_persona
END
GO
