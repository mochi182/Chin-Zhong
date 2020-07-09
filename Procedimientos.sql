/* ------------------------- DDL ------------------------- */

/* --------------- Nivel 1 --------------- */

CREATE OR REPLACE PROCEDURE insertar_sucursal(
    -- Procedimiento para ingresar en tabla "bodega".
    p_direccion sucursal.direccion%TYPE,
    p_telefono sucursal.telefono%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO sucursal(id_sucursal, direccion, telefono)
        VALUES (secuencia_id_sucursal.nextval, p_direccion, p_telefono);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_sucursal;
    /

CREATE OR REPLACE PROCEDURE insertar_proveedor(
    -- Procedimiento para ingresar en tabla "bodega".
    p_nombre proveedor.nombre%TYPE,
    p_direccion proveedor.direccion%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO proveedor(id_proveedor, nombre, direccion)
        VALUES (secuencia_id_proveedor.nextval, p_nombre, p_direccion);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_proveedor;
    /

CREATE OR REPLACE PROCEDURE insertar_categoria(
    -- Procedimiento para ingresar en tabla "bodega".
    p_abreviatura categoria.abreviatura%TYPE,
    p_descripcion categoria.descripcion%TYPE,
    p_nombre categoria.estado%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO categoria(id_categoria, abreviatura, descripcion, nombre)
        VALUES (secuencia_id_categoria.nextval, p_abreviatura, p_descripcion, p_nombre);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_categoria;
    /


CREATE OR REPLACE PROCEDURE insertar_bodega(
    -- Procedimiento para ingresar en tabla "bodega".
    p_ubicacion bodega.ubicacion%TYPE,
    p_area bodega.area%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO bodega(id_bodega, ubicacion, area)
        VALUES (secuencia_id_bodega.nextval, p_ubicacion, p_area);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_bodega;
    /


/* --------------- Nivel 2 --------------- */

CREATE OR REPLACE PROCEDURE insertar_articulo(
    -- Procedimiento para ingresar en tabla "bodega".
    p_nombre articulo.nombre%TYPE,
    p_descripcion articulo.descripcion%TYPE,
    p_costo articulo.costo%TYPE,
    p_unidad_de_medida articulo.unidad_de_medida%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO articulo(id_articulo, nombre, descripcion, costo, unidad_de_medida)
        VALUES (secuencia_id_articulo.nextval, p_nombre, p_descripcion, p_costo, p_unidad_de_medida);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_articulo;
    /

CREATE OR REPLACE PROCEDURE insertar_empleado(
    -- Procedimiento para ingresar en tabla "bodega".
    p_cedula empleado.cedula%TYPE,
    p_nombre empleado.nombre%TYPE,
    p_apellido empleado.apellido%TYPE,
    p_fecha_de_nacimiento empleado.fecha_de_nacimiento%TYPE,
    p_ocupacion empleado.ocupacion%TYPE,
    p_sexo empleado.sexo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    f_edad NUMBER;
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        f_edad := calcular_edad(p_fecha_de_nacimiento);
        INSERT INTO empleado(id_empleado, cedula, nombre, apellido, fecha_de_nacimiento, edad, ocupacion, sexo)
        VALUES (secuencia_id_empleado.nextval, p_cedula, p_nombre, p_apellido, p_fecha_de_nacimiento, f_edad, p_ocupacion, p_sexo);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_empleador;
    /

CREATE OR REPLACE PROCEDURE insertar_cliente(
    -- Procedimiento para ingresar en tabla "bodega".
    p_cedula cliente.cedula%TYPE,
    p_nombre cliente.nombre%TYPE,
    p_apellido cliente.apellido%TYPE,
    p_sexo cliente.sexo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO cliente(id_cliente, cedula, nombre, apellido, sexo)
        VALUES (secuencia_id_cliente.nextval, p_cedula, p_nombre, p_apellido, p_sexo);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_cliente;
    /

/* --------------- Nivel 3 --------------- */

CREATE OR REPLACE PROCEDURE insertar_abasto(
    -- Procedimiento para ingresar en tabla "bodega".
    p_id_sucursal sucursal.id_sucursal%TYPE,
    p_id_bodega bodega.id_bodega%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO abasto(id_abasto, id_sucursal, id_bodega)
        VALUES (secuencia_id_abasto.nextval, p_id_sucursal, p_id_bodega);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_abasto;
    /

CREATE OR REPLACE PROCEDURE insertar_pedido(
    -- Procedimiento para ingresar en tabla "bodega".
    p_id_sucursal sucursal.id_sucursal%TYPE,
    p_id_cliente cliente.id_cliente%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO pedido(id_pedido, id_sucursal, id_cliente)
        VALUES (secuencia_id_pedido.nextval, p_id_sucursal, p_id_cliente);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_pedido;
    /