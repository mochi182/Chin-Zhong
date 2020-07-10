-- Insercion en tabla "Cliente".
DECLARE
    v_cedula cliente.cedula%TYPE := '68339089';
    v_nombre cliente.nombre%TYPE := 'Juan';
    v_apellido cliente.apellido%TYPE := 'Arauz';
    v_sexo cliente.sexo%TYPE := 'M';
    mensaje VARCHAR2(50);
BEGIN
    insertar_cliente(v_cedula, v_nombre, v_apellido, v_sexo, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

-- Insercion en tabla "Artículo".
DECLARE
    v_nombre articulo.nombre%TYPE := 'Taladro';
    v_marca articulo.marca%TYPE := 'Dewalt';
    v_costo articulo.costo%TYPE := 40.00;
    unidad_de_medida articulo.unidad_de_medida%TYPE := 'unidades';
    mensaje VARCHAR2(50);
BEGIN
    insertar_articulo(v_nombre, v_marca, v_costo, unidad_de_medida, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre articulo.nombre%TYPE := 'Martillo';
    v_marca articulo.marca%TYPE := 'Bosch';
    v_costo articulo.costo%TYPE := 15.00;
    unidad_de_medida articulo.unidad_de_medida%TYPE := 'unidades';
    mensaje VARCHAR2(50);
BEGIN
    insertar_articulo(v_nombre, v_marca, v_costo, unidad_de_medida, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/