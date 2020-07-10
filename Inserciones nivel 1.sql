/* Inserciones nivel 1 */

-- Insercion en tabla "SUCURSAL".
DECLARE
    v_direccion sucursal.direccion%TYPE := 'Panama, San Miguelito';
    v_telefono sucursal.telefono%TYPE := 68936586;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Panama, Pedregal';
    v_telefono sucursal.telefono%TYPE := 69004588;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Panama, Tocumen';
    v_telefono sucursal.telefono%TYPE := 67094577;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Panama, La Cabima';
    v_telefono sucursal.telefono%TYPE := 66789044;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Panama, Albrook';
    v_telefono sucursal.telefono%TYPE := 62988945;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Los Santos, La Villa';
    v_telefono sucursal.telefono%TYPE := 63388945;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Herrera, Chitre';
    v_telefono sucursal.telefono%TYPE := 69041920;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Herrera, Monagrillo';
    v_telefono sucursal.telefono%TYPE := 64168951;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Colon, Sabanitas';
    v_telefono sucursal.telefono%TYPE := 63988526;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Chiriqui, David';
    v_telefono sucursal.telefono%TYPE := 68941570;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Bocas del Toro, Changuinola';
    v_telefono sucursal.telefono%TYPE := 68961254;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_direccion sucursal.direccion%TYPE := 'Darien, Las Palmas';
    v_telefono sucursal.telefono%TYPE := 67591690;
    mensaje VARCHAR2(50);
BEGIN
    insertar_sucursal(v_direccion, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/









-- Insercion en tabla "PROVEEDOR".
DECLARE
    v_nombre proveedor.nombre%TYPE := 'BLOQUES S.A';
    v_telefono proveedor.direccion%TYPE := 'Panama Oeste, Chame';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'TORNILLOS S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, Los Andes #1';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'TUBERIAS S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, El Dorado';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'CEMENTO S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, Villa Zaita';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'ZINC S.A.';
    v_telefono proveedor.direccion%TYPE := 'Veraguas, Santiago';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'ARGOS S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, Costa del Este';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'ZHONG S.A.';
    v_telefono proveedor.direccion%TYPE := 'Baru, Chiriqui ';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'MOTTA S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, Las Cumbres';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'GRANITO S.A.';
    v_telefono proveedor.direccion%TYPE := 'Herrera, Monagrillo';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'Super Piso S.A.';
    v_telefono proveedor.direccion%TYPE := 'Panama, Clayton';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_nombre proveedor.nombre%TYPE := 'Technos S.A.';
    v_telefono proveedor.direccion%TYPE := 'Colon, Zona Libre';
    mensaje VARCHAR2(50);
BEGIN
    insertar_proveedor(v_nombre, v_telefono, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/











-- Insercion en tabla "CATEGORIA".
DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'PLO';
    v_descripcion categoria.descripcion%TYPE := 'Articulos de plomería como tubos, grifos, llaves...';
    v_nombre categoria.nombre%TYPE := 'Plomeria';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'ELE';
    v_descripcion categoria.descripcion%TYPE := 'Articulos para electricidad.';
    v_nombre categoria.nombre%TYPE := 'Electricidad';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'JAR';
    v_descripcion categoria.descripcion%TYPE := 'Articulos para jardín, campos, patios...';
    v_nombre categoria.nombre%TYPE := 'Jardineria';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'HOG';
    v_descripcion categoria.descripcion%TYPE := 'Articulos para el hogar';
    v_nombre categoria.nombre%TYPE := 'Hogar';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'AUT';
    v_descripcion categoria.descripcion%TYPE := 'Productos para automoviles';
    v_nombre categoria.nombre%TYPE := 'Automoviles';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'LB';
    v_descripcion categoria.descripcion%TYPE := 'Electrodomesticos para cocina, habitaciones...';
    v_nombre categoria.nombre%TYPE := 'Linea Blanca';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'TOR';
    v_descripcion categoria.descripcion%TYPE := 'Tornillería, tuercas, clavos';
    v_nombre categoria.nombre%TYPE := 'Tornilleria';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'HE';
    v_descripcion categoria.descripcion%TYPE := 'Herramientas con electricidad';
    v_nombre categoria.nombre%TYPE := 'Herramientas electricas';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_abreviatura categoria.abreviatura%TYPE := 'PI';
    v_descripcion categoria.descripcion%TYPE := 'Pinturas de agua, aceite, selladores...';
    v_nombre categoria.nombre%TYPE := 'Pinturas';
    mensaje VARCHAR2(50);
BEGIN
    insertar_categoria(v_abreviatura, v_descripcion, v_nombre, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/













-- Insercion en tabla "BODEGA".
DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'La Doña';
    v_area bodega.area%TYPE := 2000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'San Francisco';
    v_area bodega.area%TYPE := 1000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'El Ingenio';
    v_area bodega.area%TYPE := 1200;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'Chanis';
    v_area bodega.area%TYPE := 1800;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'El Dorado';
    v_area bodega.area%TYPE := 2500;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'Chitre';
    v_area bodega.area%TYPE := 500;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'Los Andes';
    v_area bodega.area%TYPE := 1000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/


DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'La Villa';
    v_area bodega.area%TYPE := 2000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'La Palma';
    v_area bodega.area%TYPE := 3000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/

DECLARE
    v_ubicacion bodega.ubicacion%TYPE := 'Tocumen';
    v_area bodega.area%TYPE := 10000;
    mensaje VARCHAR2(50);
BEGIN
    insertar_bodega(v_ubicacion, v_area, mensaje);
    DBMS_OUTPUT.PUT_LINE(mensaje);
END;
/