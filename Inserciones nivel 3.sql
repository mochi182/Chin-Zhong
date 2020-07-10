/* Inserciones nivel 3 */

/* ----- Procedimiento: Tramitar pedido ----- */

DECLARE
    -- Pedido de artículos
    v_cuantos_articulos NUMBER := 2; -- Número de artículos pedidos
    v_id_cliente pedido.id_cliente%TYPE := 1; -- Cliente
    V_id_sucursal pedido.id_sucursal%TYPE := 1; -- Sucursal
    v_fecha pedido.fecha%TYPE := sysdate;
    v_id_pedido pedido.id_pedido%TYPE := secuencia_id_pedido.nextval;
    type lista_articulos IS VARRAY(99999) of NUMBER;
    type lista_cantidades IS VARRAY(99999) of NUMBER;
    v_articulos lista_articulos;
    v_cantidades lista_cantidades;
    v_costo_total pedido.costo%TYPE := 0;
    v_mensaje VARCHAR2(50);
BEGIN
    v_articulos := lista_articulos(1,2); -- Lista de artículos
    v_cantidades := lista_cantidades(1,3); -- Cantidad por artículo

    tramitar_pedido_2(v_id_pedido, v_id_sucursal, v_id_cliente, v_fecha, v_costo_total, v_mensaje);
    FOR cuenta IN  1..v_cuantos_articulos LOOP
        tramitar_pedido_1(v_id_pedido, v_articulos(cuenta), v_cantidades(cuenta), v_costo_total, v_mensaje);
    END LOOP;
    UPDATE pedido SET
        costo = v_costo_total
        WHERE id_pedido = v_id_pedido;
END;
/

/* ----- Procedimiento: Tramitar abastecimiento ----- */

/

/* ----- Procedimiento: Tramitar provision ----- */


/