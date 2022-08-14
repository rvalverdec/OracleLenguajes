---DROP

/*
DROP TABLE EMPLEADO CASCADE CONSTRAINTS;
DROP TABLE NOMINA CASCADE CONSTRAINTS; 
DROP TABLE CLIENTE CASCADE CONSTRAINTS; 
DROP TABLE MAESTRO CASCADE CONSTRAINTS;
DROP TABLE DETALLE CASCADE CONSTRAINTS; 
DROP TABLE CITA CASCADE CONSTRAINTS; 
DROP TABLE VACUNA CASCADE CONSTRAINTS; 
DROP TABLE VACUNA_APLICADA CASCADE CONSTRAINTS; 
DROP TABLE DIAGNOSTICO CASCADE CONSTRAINTS; 
DROP TABLE MASCOTA CASCADE CONSTRAINTS;
DROP TABLE PRODUCTO CASCADE CONSTRAINTS;
DROP TABLE SUCURSAL CASCADE CONSTRAINTS;
*/


CREATE TABLE SUCURSAL (
    ID_SUCURSAL INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    DISTRITO VARCHAR2(30) NOT NULL,
    CANTON VARCHAR2(30) NOT NULL,
    PROVINCIA VARCHAR2(20) NOT NULL,
    PRIMARY KEY (ID_SUCURSAL)
);

CREATE TABLE EMPLEADO (
    ID_EMPLEADO INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NOMBRE VARCHAR2(30) NOT NULL,
    APELLIDO1 VARCHAR2(30) NOT NULL,
    APELLIDO2 VARCHAR2(30) NOT NULL,
    FECHA_INGRESO DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    DIAS_VACACIONES INT NOT NULL,
    ROLE_EMPLEADO VARCHAR2(50) NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    PRIMARY KEY (ID_EMPLEADO),
    CONSTRAINT FK_SUCURSAL_EMPLEADO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL)
);


CREATE TABLE NOMINA (
    ID_NOMINA INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    SALARIO FLOAT(30) NOT NULL,
    MES DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    ID_EMPLEADO INT NOT NULL,
    PRIMARY KEY (ID_NOMINA),
    CONSTRAINT FK_ID_EMPLEADO_NOMINA FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
);


CREATE TABLE CLIENTE (
    ID_CLIENTE INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CORREO VARCHAR2(50) NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    NOMBRE_CLI VARCHAR2(30) NOT NULL,
    APELLIDO1 VARCHAR2(30) NOT NULL,
    APELLIDO2 VARCHAR2(30) NOT NULL,
    PRIMARY KEY (ID_CLIENTE)
);


CREATE TABLE MAESTRO (
    ID_MAESTRO INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    TIPO_VENTA VARCHAR2(30) NOT NULL,
    FECHA_VENTA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    TOTAL_VENTA FLOAT NOT NULL,
    TIPO_PAGO VARCHAR2(30) NOT NULL,
    ID_CLIENTE INT NOT NULL,
    PRIMARY KEY (ID_MAESTRO),
    CONSTRAINT FK_CLIENTE_MAESTRO FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);


CREATE TABLE PRODUCTO (
    ID_PRODUCTO NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NOMBRE_PRODUCTO VARCHAR2(30) NOT NULL,
    DESCRIPCION VARCHAR2(20) NOT NULL,
    FECHA_VENCIMIENTO DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    STOCK INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    ID_PROVEEDOR INT NOT NULL,
    PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT FK_SUCURSALP FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL)
);

CREATE TABLE DETALLE (
    ID_DETALLE INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_MAESTRO INT NOT NULL,
   ID_PRODUCTO INT NOT NULL,
    CANTIDAD INT NOT NULL,
    IMPUESTO FLOAT NOT NULL,
    SUBTOTAL FLOAT NOT NULL,
    PRECIO_UNITARIO FLOAT NOT NULL,
    PRIMARY KEY (ID_DETALLE),
    CONSTRAINT FK_PRODUCT_DETALLE FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
    CONSTRAINT FK_MAESTRO_DETALLE FOREIGN KEY (ID_MAESTRO) REFERENCES MAESTRO(ID_MAESTRO)
);

CREATE TABLE CITA (
    ID_CITA INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_CLIENTE INT NOT NULL,
    FECHA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_CITA),
    CONSTRAINT FK_ID_CLIENTE_CITA FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE VACUNA (
    ID_VACUNA INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NOMBRE VARCHAR2(30) NOT NULL,
    DESCRIPCION VARCHAR2(60) NOT NULL,
    PRIMARY KEY (ID_VACUNA)
);

CREATE TABLE MASCOTA (
    ID_MASCOTA INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    RAZA VARCHAR2(50) NOT NULL,
    TIPO_ANIMAL VARCHAR2(50) NOT NULL,
    PESO NUMERIC(8,1) NOT NULL,
    EDAD INT NOT NULL,
    ID_CLIENTE INT NOT NULL,
    PRIMARY KEY (ID_MASCOTA),
    CONSTRAINT FK_ID_CLIENTE_MASCOTA FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);


CREATE TABLE VACUNA_APLICADA (
    ID_VACUNA_APLICADA INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ID_MASCOTA INT NOT NULL,
    ID_VACUNA INT NOT NULL,
    DOSIS NUMERIC(5,1) NOT NULL,
    FECHA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_VACUNA_APLICADA),  
    CONSTRAINT FK_ID_MASCOTA_VACUN_APLI FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA),
    CONSTRAINT FK_ID_VACUNA_VACUN_APLI FOREIGN KEY (ID_VACUNA) REFERENCES VACUNA(ID_VACUNA)
    );
    
    
    CREATE TABLE DIAGNOSTICO (
    ID_DIAGNOSTICO INT GENERATED BY DEFAULT ON NULL AS IDENTITY,
    DESCRIPCION VARCHAR2(100) NOT NULL,
    ID_MASCOTA INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    FECHA_SALIDA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    FECHA_ENTRADA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_DIAGNOSTICO),  
    CONSTRAINT FK_ID_CLIENTE_DIAGNOSTICO FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA),
    CONSTRAINT FK_ID_SUCURSAL_DIAGNOSTICO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL)
);


SELECT * FROM SUCURSAL;

INSERT INTO SUCURSAL (DISTRITO, CANTON, PROVINCIA) 
    VALUES ('Carmen','San jose', 'San jose');
