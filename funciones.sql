CREATE OR REPLACE FUNCTION calcular_edad(
p_fecha_nacimiento        empleado.fecha_de_nacimiento%TYPE) RETURN NUMBER AS
BEGIN
RETURN FLOOR(months_between(sysdate, p_fecha_nacimiento)/12);
END calcular_edad;
/
