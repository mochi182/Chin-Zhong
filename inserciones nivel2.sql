-- Insercion en tabla "CLIENTE".
DECLARE
    v_cedula cliente.cedula%TYPE := '1111111';
    v_nombre cliente.nombre%TYPE := 'Juan';
    v_apellido cliente.apellido%TYPE := 'Arauz';
    v_sexo cliente.sexo%TYPE := 'M';
    mensaje VARCHAR2(50);
BEGIN
    insertar_cliente(v_cedula, v_nombre, v_apellido, v_sexo, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/








-- Insercion en tabla "empleado".
DECLARE
    v_cedula empleado.cedula%TYPE := '123456';
    v_nombre empleado.nombre%TYPE := 'Sergio';
    v_apellido empleado.apellido%TYPE := 'Gomez';
    v_fecha_de_nacimiento empleado.fecha_de_nacimiento%TYPE := '30';
    v_ocupacion empleado.ocupacion%TYPE := 'Gerente de ventas';
    v_sexo empleado.sexo%TYPE := 'M';
    mensaje VARCHAR2(50);
BEGIN
    insertar_cliente(v_cedula, v_nombre, v_apellido, v_fecha_de_nacimiento, v_ocupacion, v_sexo, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/