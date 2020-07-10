/* Inserciones nivel 2 */

-- Insercion en tabla "Cliente".
DECLARE
    v_cedula cliente.cedula%TYPE := '61234567';
    v_nombre cliente.nombre%TYPE := 'Juan';
    v_apellido cliente.apellido%TYPE := 'Arauz';
    v_sexo cliente.sexo%TYPE := 'M';
    mensaje VARCHAR2(50);
BEGIN
    insertar_cliente(v_cedula, v_nombre, v_apellido, v_sexo, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_cedula cliente.cedula%TYPE := '88411013';
    v_nombre cliente.nombre%TYPE := 'Francisco';
    v_apellido cliente.apellido%TYPE := 'Pérez';
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
    v_categoria articulo.id_categoria%TYPE := 8;
    v_marca articulo.marca%TYPE := 'Dewalt';
    v_costo articulo.costo%TYPE := 40.00;
    unidad_de_medida articulo.unidad_de_medida%TYPE := 'unidades';
    mensaje VARCHAR2(50);
BEGIN
    insertar_articulo(v_nombre, v_categoria, v_marca, v_costo, unidad_de_medida, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre articulo.nombre%TYPE := 'Esmeril';
    v_categoria articulo.id_categoria%TYPE := 8;
    v_marca articulo.marca%TYPE := 'Bosch';
    v_costo articulo.costo%TYPE := 15.00;
    unidad_de_medida articulo.unidad_de_medida%TYPE := 'unidades';
    mensaje VARCHAR2(50);
BEGIN
    insertar_articulo(v_nombre, v_categoria, v_marca, v_costo, unidad_de_medida, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre articulo.nombre%TYPE := 'Sierra eléctrica';
    v_categoria articulo.id_categoria%TYPE := 8;
    v_marca articulo.marca%TYPE := 'Sears';
    v_costo articulo.costo%TYPE := 130.00;
    unidad_de_medida articulo.unidad_de_medida%TYPE := 'unidades';
    mensaje VARCHAR2(50);
BEGIN
    insertar_articulo(v_nombre, v_categoria, v_marca, v_costo, unidad_de_medida, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/