/* ---------- Vistas ---------- */

CREATE OR REPLACE VIEW articulos_a_la_venta AS
    SELECT  S.id_articulo AS "ID DEL ARTICULO", A.NOMBRE, S.id_sucursal AS "SUCURSAL"
    FROM sucursal_tiene_articulo S, articulo A
    WHERE A.id_articulo=S.id_articulo AND S.cantidad_actual <> 0;

