/* ------------------------- Procedimientos ------------------------- */

/* --------------- Nivel 1 --------------- */

CREATE OR REPLACE PROCEDURE insertar_sucursal(
    -- Procedimiento para ingresar en tabla "sucursal".
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
    -- Procedimiento para ingresar en tabla "proveedor".
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
    -- Procedimiento para ingresar en tabla "categoria".
    p_abreviatura categoria.abreviatura%TYPE,
    p_descripcion categoria.descripcion%TYPE,
    p_nombre categoria.nombre%TYPE,
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
    -- Procedimiento para ingresar en tabla "articulo".
    p_nombre articulo.nombre%TYPE,
    p_id_categoria articulo.id_categoria%TYPE,
    p_marca articulo.marca%TYPE,
    p_costo articulo.costo%TYPE,
    p_unidad_de_medida articulo.unidad_de_medida%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    CURSOR sucursales IS
        SELECT * FROM sucursal;
    CURSOR bodegas IS
        SELECT * FROM bodega;
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO articulo(id_articulo, id_categoria, nombre, marca, costo, unidad_de_medida)
        VALUES (secuencia_id_articulo.nextval, p_id_categoria, p_nombre, p_marca, p_costo, p_unidad_de_medida);
        FOR data IN sucursales LOOP
            INSERT INTO sucursal_tiene_articulo(id_sucursal, id_articulo, cantidad_anterior, cantidad_actual, fecha_modificacion)
            VALUES (data.id_sucursal, secuencia_id_articulo.currval, 0, 0, sysdate);
        END LOOP;
        FOR data IN bodegas LOOP
            INSERT INTO bodega_guarda_articulo(id_bodega, id_articulo, cantidad_anterior, cantidad_actual, fecha_modificacion)
            VALUES (data.id_bodega, secuencia_id_articulo.currval, 0, 0, sysdate);
        END LOOP;
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END insertar_articulo;
    /

CREATE OR REPLACE PROCEDURE insertar_cliente(
    -- Procedimiento para ingresar en tabla "cliente".
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

CREATE OR REPLACE PROCEDURE tramitar_provision_1(
    -- Procedimiento para ingresar en tabla "provision".
    p_id_provision provision.id_provision%TYPE,
    p_id_bodega provision.id_bodega%TYPE,
    p_id_proveedor provision.id_proveedor%TYPE,
    p_fecha provision.fecha%TYPE,
    p_costo provision.costo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO provision(id_provision, id_bodega, id_proveedor, fecha, costo)
        VALUES (p_id_provision, p_id_bodega, p_id_proveedor, p_fecha, p_costo);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_provision_1;
    /

CREATE OR REPLACE PROCEDURE tramitar_provision_2(
    -- Procedimiento para ingresar en tabla "provision_contiene_articulo".
    p_id_provision provision_contiene_articulo.id_provision%TYPE,
    p_id_articulo provision_contiene_articulo.id_articulo%TYPE,
    p_cantidad provision_contiene_articulo.cantidad%TYPE,
    p_costo_total IN OUT provision.costo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    CURSOR costo_del_articulo IS
        SELECT * FROM articulo WHERE id_articulo = p_id_articulo; 
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        FOR data IN costo_del_articulo LOOP
            p_costo_total := p_costo_total + (data.costo * p_cantidad);
        END LOOP;
        INSERT INTO provision_contiene_articulo(id_provision, id_articulo, cantidad)
        VALUES (p_id_provision, p_id_articulo, p_cantidad);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_provision_2;
    /

------------------------------------------------------------

CREATE OR REPLACE PROCEDURE tramitar_abastecimiento_1(
    -- Procedimiento para ingresar en tabla "provision".
    p_id_abastecimiento abastecimiento.id_abastecimiento%TYPE,
    p_id_bodega abastecimiento.id_bodega%TYPE,
    p_id_sucursal abastecimiento.id_sucursal%TYPE,
    p_fecha abastecimiento.fecha%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO abastecimiento(id_abastecimiento, id_bodega, id_sucursal, fecha)
        VALUES (p_id_abastecimiento, p_id_bodega, p_id_sucursal, p_fecha);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_abastecimiento_1;
    /

CREATE OR REPLACE PROCEDURE tramitar_abastecimiento_2(
    -- Procedimiento para ingresar en tabla "abast_contiene_articulo".
    p_id_abastecimiento abast_contiene_articulo.id_abastecimiento%TYPE,
    p_id_articulo abast_contiene_articulo.id_articulo%TYPE,
    p_cantidad abast_contiene_articulo.cantidad%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO abast_contiene_articulo(id_abastecimiento, id_articulo, cantidad)
        VALUES (p_id_abastecimiento, p_id_articulo, p_cantidad);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_abastecimiento_2;
    /

------------------------------------------------------------

CREATE OR REPLACE PROCEDURE tramitar_pedido_1(
    -- Procedimiento para ingresar en tabla "pedido".
    p_id_pedido pedido.id_pedido%TYPE,
    p_id_sucursal pedido.id_sucursal%TYPE,
    p_id_cliente pedido.id_cliente%TYPE,
    p_fecha pedido.fecha%TYPE,
    p_costo pedido.costo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        INSERT INTO pedido(id_pedido, id_sucursal, id_cliente, fecha, costo)
        VALUES (p_id_pedido, p_id_sucursal, p_id_cliente, p_fecha, p_costo);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_pedido_1;
    /

CREATE OR REPLACE PROCEDURE tramitar_pedido_2(
    -- Procedimiento para ingresar en tabla "pedido_contiene_articulo".
    p_id_pedido pedido_contiene_articulo.id_pedido%TYPE,
    p_id_articulo pedido_contiene_articulo.id_articulo%TYPE,
    p_cantidad pedido_contiene_articulo.cantidad%TYPE,
    p_costo_total IN OUT pedido.costo%TYPE,
    p_mensaje OUT VARCHAR2
    ) AS
    CURSOR costo_del_articulo IS
        SELECT * FROM articulo WHERE id_articulo = p_id_articulo; 
    BEGIN
        p_mensaje := 'Proceso ejecutado con éxito.';
        FOR data IN costo_del_articulo LOOP
            p_costo_total := p_costo_total + (data.costo * p_cantidad);
        END LOOP;
        INSERT INTO pedido_contiene_articulo(id_pedido, id_articulo, cantidad)
        VALUES (p_id_pedido, p_id_articulo, p_cantidad);
        COMMIT;
    EXCEPTION
        WHEN others THEN
            p_mensaje := 'Error desconocido';
    END tramitar_pedido_2;
    /

/* --------------- Triggers --------------- */

CREATE OR REPLACE TRIGGER inventario_tras_provision
        AFTER INSERT ON provision_contiene_articulo
        FOR EACH ROW
    DECLARE
        CURSOR bodega_provisionada IS
        SELECT * FROM provision WHERE id_provision = :NEW.id_provision;
    BEGIN

        FOR data IN bodega_provisionada LOOP
            UPDATE bodega_guarda_articulo SET
                cantidad_anterior = cantidad_actual,
                cantidad_actual = cantidad_actual + :NEW.cantidad,
                fecha_modificacion = sysdate
                WHERE (id_articulo = :NEW.id_articulo AND id_bodega = data.id_bodega);
        END LOOP;

    END inventario_tras_provision;
    /

CREATE OR REPLACE TRIGGER inventario_tras_abasto
        AFTER INSERT ON abast_contiene_articulo
        FOR EACH ROW
    DECLARE
        CURSOR sucursal_provisionada IS
        SELECT * FROM abastecimiento WHERE id_abastecimiento = :NEW.id_abastecimiento;
        CURSOR bodega_desprovisionada IS
        SELECT * FROM abastecimiento WHERE id_abastecimiento = :NEW.id_abastecimiento;
    BEGIN

        FOR data IN sucursal_provisionada LOOP
            UPDATE sucursal_tiene_articulo SET
                cantidad_anterior = cantidad_actual,
                cantidad_actual = cantidad_actual + :NEW.cantidad,
                fecha_modificacion = sysdate
                WHERE (id_articulo = :NEW.id_articulo AND id_sucursal = data.id_sucursal);
        END LOOP;

        FOR data IN bodega_desprovisionada LOOP
            UPDATE bodega_guarda_articulo SET
                cantidad_anterior = cantidad_actual,
                cantidad_actual = cantidad_actual - :NEW.cantidad,
                fecha_modificacion = sysdate
                WHERE (id_articulo = :NEW.id_articulo AND id_bodega = data.id_bodega);
        END LOOP;

    END inventario_tras_provision;
    /

CREATE OR REPLACE TRIGGER inventario_tras_pedido
        AFTER INSERT ON pedido_contiene_articulo
        FOR EACH ROW
    DECLARE
        CURSOR sucursal_desprovisionada IS
        SELECT * FROM pedido WHERE id_pedido = :NEW.id_pedido;
    BEGIN

        FOR data IN sucursal_desprovisionada LOOP
            UPDATE sucursal_tiene_articulo SET
                cantidad_anterior = cantidad_actual,
                cantidad_actual = cantidad_actual - :NEW.cantidad,
                fecha_modificacion = sysdate
                WHERE (id_articulo = :NEW.id_articulo AND id_sucursal = data.id_sucursal);
        END LOOP;

    END inventario_tras_pedido;
    /

