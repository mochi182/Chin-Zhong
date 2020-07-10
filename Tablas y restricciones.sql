/* ------------------------- DDL ------------------------- */

/* --------------- Nivel 1: Tablero --------------- */

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

/* --------------- Nivel 2: Fichas --------------- */

CREATE TABLE articulo(
    id_articulo NUMBER NOT NULL,
    nombre VARCHAR(50) UNIQUE,
    descripcion VARCHAR(100),
    costo NUMBER(10,2),
    unidad_de_medida VARCHAR(30),
    PRIMARY KEY(id_articulo)
);

CREATE SEQUENCE secuencia_id_articulo
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE empleado(
    id_empleado NUMBER NOT NULL,
    cedula VARCHAR(30),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_de_nacimiento DATE,
    edad NUMBER,
    ocupacion VARCHAR(50),
    sexo VARCHAR(1),
    PRIMARY KEY(id_empleado)
);
ALTER TABLE empleado ADD CHECK (sexo='M' OR sexo='F');
ALTER TABLE empleado ADD UNIQUE (cedula);

CREATE SEQUENCE secuencia_id_empleado
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

CREATE TABLE abasto(
    id_abasto NUMBER NOT NULL,
    id_sucursal NUMBER, --FK
    id_bodega NUMBER, --FK
    PRIMARY KEY(id_abasto)
);
ALTER TABLE abasto ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE abasto ADD FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega);

CREATE SEQUENCE secuencia_id_abasto
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE TABLE pedido(
    id_pedido NUMBER NOT NULL,
    id_sucursal NUMBER, --FK
    id_cliente NUMBER, --FK
    PRIMARY KEY(id_pedido)
);
ALTER TABLE pedido ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE pedido ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

CREATE SEQUENCE secuencia_id_pedido
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

/* --------------- Relaciones --------------- */

CREATE TABLE articulo_pertenece_categoria(
    id_articulo NUMBER NOT NULL,
    id_categoria NUMBER NOT NULL,
    PRIMARY KEY(id_articulo, id_categoria)
);
ALTER TABLE articulo_pertenece_categoria ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);
ALTER TABLE articulo_pertenece_categoria ADD FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);

CREATE TABLE empleado_trabaja_sucursal(
    id_empleado NUMBER NOT NULL,
    id_sucursal NUMBER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE,
    PRIMARY KEY(id_empleado, id_sucursal, fecha_inicio)
);
ALTER TABLE empleado_trabaja_sucursal ADD FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);
ALTER TABLE empleado_trabaja_sucursal ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);

CREATE TABLE pedido_contiene_articulo(
    id_pedido NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_pedido, id_articulo)
);
ALTER TABLE pedido_contiene_articulo ADD FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);
ALTER TABLE pedido_contiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE abasto_contiene_articulo(
    id_abasto NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_abasto, id_articulo)
);
ALTER TABLE abasto_contiene_articulo ADD FOREIGN KEY (id_abasto) REFERENCES abasto(id_abasto);
ALTER TABLE abasto_contiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE sucursal_tiene_articulo(
    id_sucursal NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_sucursal, id_articulo)
);
ALTER TABLE sucursal_tiene_articulo ADD FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE sucursal_tiene_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE bodega_guarda_articulo(
    id_bodega NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    cantidad NUMBER,
    PRIMARY KEY(id_bodega, id_articulo)
);
ALTER TABLE bodega_guarda_articulo ADD FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega);
ALTER TABLE bodega_guarda_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);

CREATE TABLE proveedor_provee_articulo(
    id_proveedor NUMBER NOT NULL,
    id_articulo NUMBER NOT NULL,
    PRIMARY KEY(id_proveedor, id_articulo)
);
ALTER TABLE proveedor_provee_articulo ADD FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor);
ALTER TABLE proveedor_provee_articulo ADD FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo);


