/* ------------------------- DDL ------------------------- */

/* --------------- Nivel 1: Estructura --------------- */

CREATE TABLE sucursal(
    id_sucursal NUMBER NOT NULL,
    direccion VARCHAR(50),
    telefono NUMBER(8),
    PRIMARY KEY(id_sucursal)
);

CREATE SEQUENCE secuencia_id_sucursal
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE categoria(
    id_categoria  NUMBER NOT NULL,
    abreviatura VARCHAR(30),
    descripcion VARCHAR(100),
    nombre VARCHAR(50),
    PRIMARY KEY(id_categoria)
);

CREATE SEQUENCE secuencia_id_categoria
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE bodega(
    id_bodega NUMBER NOT NULL,
    ubicacion VARCHAR(50),
    area NUMBER,
    PRIMARY KEY(id_bodega)
);

CREATE SEQUENCE secuencia_id_bodega
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

/* --------------- Nivel 2: Activos --------------- */

CREATE TABLE proveedor(
    id_proveedor NUMBER,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    PRIMARY KEY(id_proveedor)
);

CREATE SEQUENCE secuencia_id_proveedor
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE articulo(
    id_articulo NUMBER NOT NULL,
    id_categoria NUMBER NOT NULL,
    nombre VARCHAR(50) UNIQUE,
    marca VARCHAR(50),
    costo NUMBER(10,2),
    unidad_de_medida VARCHAR(30),
    PRIMARY KEY(id_articulo)
);
ALTER TABLE articulo ADD FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);

CREATE SEQUENCE secuencia_id_articulo
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE cliente(
    id_cliente NUMBER NOT NULL,
    cedula VARCHAR(30),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    sexo VARCHAR(1),
    PRIMARY KEY(id_cliente)
);
ALTER TABLE cliente ADD CHECK (sexo='M' OR sexo='F');
ALTER TABLE cliente ADD UNIQUE (cedula);

CREATE SEQUENCE secuencia_id_cliente
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

/* --------------- Nivel 3: Actividades --------------- */

CREATE TABLE provision(
    id_provision NUMBER NOT NULL,
    id_proveedor NUMBER NOT NULL, --FK
    id_bodega NUMBER NOT NULL, --FK
    fecha DATE,
    costo NUMBER(10,2),
    PRIMARY KEY(id_provision)
);
ALTER TABLE provision ADD FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor);
ALTER TABLE provision ADD FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega);

CREATE SEQUENCE secuencia_id_provision
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE abastecimiento(
    id_abastecimiento NUMBER NOT NULL,
    id_sucursal NUMBER NOT NULL, --FK
    id_bodega NUMBER NOT NULL, --FK
    fecha DATE,
    PRIMARY KEY(id_abastecimiento)
);
ALTER TABLE abastecimiento ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE abastecimiento ADD FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega);

CREATE SEQUENCE secuencia_id_abastecimiento
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE pedido(
    id_pedido NUMBER NOT NULL,
    id_sucursal NUMBER NOT NULL, --FK
    id_cliente NUMBER, --FK
    fecha DATE,
    costo NUMBER(10,2),
    PRIMARY KEY(id_pedido)
);
ALTER TABLE pedido ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE pedido ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

CREATE SEQUENCE secuencia_id_pedido
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

/* --------------- Tablas de relaciones --------------- */

CREATE TABLE pedido_contiene_articulo(
    id_pedido NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_pedido, id_articulo)
);
ALTER TABLE pedido_contiene_articulo ADD FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);
ALTER TABLE pedido_contiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE abast_contiene_articulo(
    id_abastecimiento NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_abastecimiento, id_articulo)
);
ALTER TABLE abast_contiene_articulo ADD FOREIGN KEY (id_abastecimiento) REFERENCES abastecimiento(id_abastecimiento);
ALTER TABLE abast_contiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE provision_contiene_articulo(
    id_provision NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_provision, id_articulo)
);
ALTER TABLE provision_contiene_articulo ADD FOREIGN KEY (id_provision) REFERENCES provision(id_provision);
ALTER TABLE provision_contiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE sucursal_tiene_articulo(
    id_sucursal NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad_anterior NUMBER,
    cantidad_actual NUMBER,
    fecha_modificacion DATE,
    PRIMARY KEY(id_sucursal, id_articulo)
);
ALTER TABLE sucursal_tiene_articulo ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE sucursal_tiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE bodega_guarda_articulo(
    id_bodega NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad_anterior NUMBER,
    cantidad_actual NUMBER,
    fecha_modificacion DATE,
    PRIMARY KEY(id_bodega, id_articulo)
);
ALTER TABLE bodega_guarda_articulo ADD FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega);
ALTER TABLE bodega_guarda_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);
