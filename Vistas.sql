/* ---------- Vistas ---------- */

CREATE OR REPLACE VIEW articulos_a_la_venta AS
    SELECT  S.id_articulo AS "ID DEL ARTICULO", A.NOMBRE, S.id_sucursal AS "SUCURSAL"
    FROM sucursal_tiene_articulo S, articulo A
    WHERE A.id_articulo=S.id_articulo AND S.cantidad_actual <> 0;

CREATE OR REPLACE VIEW inventario_bodega AS
    SELECT  B.id_articulo AS "ID DEL ARTICULO", A.NOMBRE, B.id_bodega AS "BODEGA"
    FROM bodega_guarda_articulo B, articulo A
    WHERE A.id_articulo=B.id_articulo AND B.cantidad_actual <> 0;

CREATE OR REPLACE VIEW categoria_articulos AS
    SELECT A.id_articulo AS "ID DEL ARTICULO", A.nombre, Z.abreviatura, Z.nombre AS "Nombre de categoria" 
    FROM articulo A, categoria Z
    WHERE A.id_categoria=Z.id_categoria;

CREATE OR REPLACE VIEW articulos_por_proveedor AS 
    SELECT S.nombre AS "PROVEEDOR", H.fecha, H.id_provision, A.nombre AS "NOMBRE ARTICULO" 
    FROM proveedor S, provision H, provision_contiene_articulo J, articulo A
    WHERE S.id_proveedor=H.id_proveedor AND H.id_provision=J.id_provision AND J.id_articulo=A.id_articulo;

CREATE OR REPLACE VIEW pedidos_de_clientes AS 
    SELECT A.id_cliente, (A.nombre||' '||A.apellido) AS "NOMBRES DE CLIENTES", B.id_pedido, B.fecha, B.costo 
    FROM cliente A INNER JOIN pedido B
    ON A.id_cliente = B.id_cliente;

CREATE OR REPLACE VIEW articulos_por_sucursal AS
    SELECT  S.id_articulo AS "ID DEL ARTICULO", A.NOMBRE, S.cantidad_actual, B.id_sucursal, B.direccion
    FROM sucursal_tiene_articulo S, articulo A, sucursal B
    WHERE A.id_articulo=S.id_articulo AND S.id_sucursal=B.id_sucursal;
