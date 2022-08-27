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
DROP MATERIALIZED VIEW LISTA_CLIENTES;
*/


CREATE TABLE SUCURSAL (
    ID_SUCURSAL INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    DISTRITO VARCHAR2(30) NOT NULL,
    CANTON VARCHAR2(30) NOT NULL,
    PROVINCIA VARCHAR2(20) NOT NULL,
    PRIMARY KEY (ID_SUCURSAL)
);

CREATE TABLE EMPLEADO (
    ID_EMPLEADO INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    NOMBRE_EMPLEADO VARCHAR2(30) NOT NULL,
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
    ID_NOMINA INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    SALARIO FLOAT(30) NOT NULL,
    MES DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    ID_EMPLEADO INT NOT NULL,
    PRIMARY KEY (ID_NOMINA),
    CONSTRAINT FK_ID_EMPLEADO_NOMINA FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
);


CREATE TABLE CLIENTE (
    ID_CLIENTE INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    CORREO VARCHAR2(50) NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    NOMBRE_CLI VARCHAR2(30) NOT NULL,
    APELLIDO1 VARCHAR2(30) NOT NULL,
    APELLIDO2 VARCHAR2(30) NOT NULL,
    PRIMARY KEY (ID_CLIENTE)
);


CREATE TABLE MAESTRO (
    ID_MAESTRO INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    TIPO_VENTA VARCHAR2(30) NOT NULL,
    FECHA_VENTA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    TOTAL_VENTA FLOAT NOT NULL,
    TIPO_PAGO VARCHAR2(30) NOT NULL,
    ID_CLIENTE INT NOT NULL,
    PRIMARY KEY (ID_MAESTRO),
    CONSTRAINT FK_CLIENTE_MAESTRO FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);


CREATE TABLE PRODUCTO (
    ID_PRODUCTO INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    NOMBRE_PRODUCTO VARCHAR2(30) NOT NULL,
    DESCRIPCION VARCHAR2(100) NOT NULL,
    FECHA_VENCIMIENTO DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    STOCK INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    ID_PROVEEDOR INT NOT NULL,
    PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT FK_SUCURSALP FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL)
);

CREATE TABLE DETALLE (
    ID_DETALLE INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
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
    ID_CITA INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    ID_CLIENTE INT NOT NULL,
    FECHA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_CITA),
    CONSTRAINT FK_ID_CLIENTE_CITA FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE VACUNA (
    ID_VACUNA INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    NOMBRE_VACUNA VARCHAR2(30) NOT NULL,
    DESCRIPCION VARCHAR2(100) NOT NULL,
    PRIMARY KEY (ID_VACUNA)
);

CREATE TABLE MASCOTA (
    ID_MASCOTA INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    NOMBRE_MASCOTA VARCHAR2(50) NOT NULL,
    RAZA VARCHAR2(50) NOT NULL,
    TIPO_ANIMAL VARCHAR2(50) NOT NULL,
    PESO NUMERIC(8,1) NOT NULL,
    EDAD INT NOT NULL,
    ID_CLIENTE INT NOT NULL,
    PRIMARY KEY (ID_MASCOTA),
    CONSTRAINT FK_ID_CLIENTE_MASCOTA FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);


CREATE TABLE VACUNA_APLICADA (
    ID_VACUNA_APLICADA INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    ID_MASCOTA INT NOT NULL,
    ID_VACUNA INT NOT NULL,
    DOSIS NUMERIC(5,1) NOT NULL,
    FECHA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_VACUNA_APLICADA),  
    CONSTRAINT FK_ID_MASCOTA_VACUN_APLI FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA),
    CONSTRAINT FK_ID_VACUNA_VACUN_APLI FOREIGN KEY (ID_VACUNA) REFERENCES VACUNA(ID_VACUNA)
    );
    
    
    CREATE TABLE DIAGNOSTICO (
    ID_DIAGNOSTICO INT GENERATED BY DEFAULT ON NULL AS IDENTITY (START with 1 INCREMENT by 1),
    DESCRIPCION VARCHAR2(100) NOT NULL,
    ID_MASCOTA INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    FECHA_SALIDA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    FECHA_ENTRADA DATE DEFAULT (TO_DATE('01-01-0001', 'dd-mm-yyyy')) NOT NULL,
    PRIMARY KEY (ID_DIAGNOSTICO),  
    CONSTRAINT FK_ID_CLIENTE_DIAGNOSTICO FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA),
    CONSTRAINT FK_ID_SUCURSAL_DIAGNOSTICO FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL)
);



INSERT INTO SUCURSAL (DISTRITO,CANTON,PROVINCIA)
VALUES('EL CARMEN','SANJOSE','SAN JOSE');
INSERT INTO SUCURSAL (DISTRITO,CANTON,PROVINCIA)
VALUES('CARRIZAL','ALAJUELA','ALAJUELA');
INSERT INTO SUCURSAL (DISTRITO,CANTON,PROVINCIA)
VALUES('ORIENTAL','CARTAGO','CARTAGO');
INSERT INTO SUCURSAL(DISTRITO,CANTON,PROVINCIA)
VALUES('MERCEDES','HEREDIA','HEREDIA');
INSERT INTO SUCURSAL(DISTRITO,CANTON,PROVINCIA)
VALUES('MAYORGA','LIBERIA','GUANACASTE');
INSERT INTO SUCURSAL(DISTRITO,CANTON,PROVINCIA)
VALUES('LEPANTO','PUNTARENAS','PUNTARENAS');
INSERT INTO SUCURSAL(DISTRITO,CANTON,PROVINCIA)
VALUES('VALLE LA ESTRELLA','LIMON','LIMON');




INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('JUAN','MORALES','JIMENEZ','20-JAN-2019',8,'VENDEDOR',01);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('MARIA','MOSCOSO','GUTIERREZ','23-jun-2019',3,'ADMINISTRADOR',02);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('JUAN','PEREZ','SANDOVAL','19-feb-2009',5,'VETERINARIO',03);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('MARIO','MORENO','ARTAVIA','11-sep-2010',10,'ADMINISTRADOR',04);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('ALBERTO','MOJE','MEJIAS','12-dec-2021',13,'ADMINISTRADOR',05);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('JOSE','RODRIGUEZ','RODRIGUEZ','29-nov-2010',12,'VETERINARIO',06);
INSERT INTO EMPLEADO(NOMBRE_EMPLEADO,APELLIDO1,APELLIDO2,FECHA_INGRESO,DIAS_VACACIONES,ROLE_EMPLEADO,ID_SUCURSAL)
VALUES('CARLOS','HERRERA','GRANADOS','25-May-2022',3,'VENDEDOR',07);



INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(360000,'01-may-2022',01);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(380000,'15-jun-2022',02);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(600000,'15-jul-2022',03);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(500000,'01-apr-2022',04);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(550000,'01-aug-2022',05);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(490000,'15-aug-2022',06);
INSERT INTO NOMINA(SALARIO,MES,ID_EMPLEADO)
VALUES(600000,'01-jul-2022',07);




INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('MPEREZ@HOTMAIL.COM','22056989','MARIO','ZUÑIGA','PEREZ');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('MORALES06@HOTMAIL.COM','88620896','JULIO','CANTILLANO','MORALES');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('SALAS16@HOTMAIL.COM','25341611','BERTA','MORA','SALAS');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('MARTINEZR@HOTMAIL.COM','77096345','VICTOR','MARTINEZ','RODRIGUEZ');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('BERTRANMARIA@HOTMAIL.COM','25052332','MARIA','AZOFEIFA','BERTRAN');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('PEREZ@GMAIL.COM','88693236','RUBEN','PEREZ','ARIAS');
INSERT INTO CLIENTE(CORREO,TELEFONO,NOMBRE_CLI,APELLIDO1,APELLIDO2)
VALUES('ADRIANA@LIVE.ES','63639897','ADRIANA','NUÑEZ','MUNJIA');




INSERT INTO MAESTRO(TIPO_VENTA,FECHA_VENTA,TOTAL_VENTA,TIPO_PAGO,ID_CLIENTE)
VALUES('CONTADO','16-aug-2022',35033,'EFECTIVO',1);
INSERT INTO MAESTRO(TIPO_VENTA,FECHA_VENTA,TOTAL_VENTA,TIPO_PAGO,ID_CLIENTE)
VALUES('CREDITO','15-aug-2022',40033,'TARJETA_DEBITO',2);
INSERT INTO MAESTRO(TIPO_VENTA,FECHA_VENTA,TOTAL_VENTA,TIPO_PAGO,ID_CLIENTE)
VALUES('CONTADO','11-sep-2022',20233,'TARJETA_CREDITO',2);
INSERT INTO MAESTRO(TIPO_VENTA,FECHA_VENTA,TOTAL_VENTA,TIPO_PAGO,ID_CLIENTE)
VALUES('CREDITO','09-sep-2022',50333,'SIMPE_MOVIL',4);
INSERT INTO MAESTRO(TIPO_VENTA,FECHA_VENTA,TOTAL_VENTA,TIPO_PAGO,ID_CLIENTE)
VALUES('CREDITO','09-jun-2022',5000,'EFECTIVO',4);




INSERT INTO PRODUCTO(NOMBRE_PRODUCTO,DESCRIPCION,FECHA_VENCIMIENTO,STOCK,ID_SUCURSAL,ID_PROVEEDOR)
VALUES('VAC_DISTEMPER','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE','25-dec-2024',1200,01,1);
INSERT INTO PRODUCTO(NOMBRE_PRODUCTO,DESCRIPCION,FECHA_VENCIMIENTO,STOCK,ID_SUCURSAL,ID_PROVEEDOR)
VALUES('VAC_PARVOVIRUS','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE','25-dec-2024',2500,02,2);
INSERT INTO PRODUCTO(NOMBRE_PRODUCTO,DESCRIPCION,FECHA_VENCIMIENTO,STOCK,ID_SUCURSAL,ID_PROVEEDOR)
VALUES('VAC_AVC-2','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE','25-feb-2024',3000,03,3);
INSERT INTO PRODUCTO(NOMBRE_PRODUCTO,DESCRIPCION,FECHA_VENCIMIENTO,STOCK,ID_SUCURSAL,ID_PROVEEDOR)
VALUES('VAC_LEPTOSPIROSIS','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE','25-dec-2024',25000,04,4);
INSERT INTO PRODUCTO(NOMBRE_PRODUCTO,DESCRIPCION,FECHA_VENCIMIENTO,STOCK,ID_SUCURSAL,ID_PROVEEDOR)
VALUES('VAC_RABIA','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE','25-may-2024',12000,05,5);




INSERT INTO DETALLE(ID_MAESTRO,ID_PRODUCTO,CANTIDAD,IMPUESTO,SUBTOTAL,PRECIO_UNITARIO)
VALUES(1,1,2,13,1200,10560);
INSERT INTO DETALLE(ID_MAESTRO,ID_PRODUCTO,CANTIDAD,IMPUESTO,SUBTOTAL,PRECIO_UNITARIO)
VALUES(2,2,5,13,1200,10560);
INSERT INTO DETALLE(ID_MAESTRO,ID_PRODUCTO,CANTIDAD,IMPUESTO,SUBTOTAL,PRECIO_UNITARIO)
VALUES(3,3,1,13,1200,10560);
INSERT INTO DETALLE(ID_MAESTRO,ID_PRODUCTO,CANTIDAD,IMPUESTO,SUBTOTAL,PRECIO_UNITARIO)
VALUES(4,4,6,13,1200,10560);
INSERT INTO DETALLE(ID_MAESTRO,ID_PRODUCTO,CANTIDAD,IMPUESTO,SUBTOTAL,PRECIO_UNITARIO)
VALUES(5,5,10,13,1200,10560);



INSERT INTO CITA(ID_CLIENTE,FECHA)
VALUES(1,'23-JUL-2022');
INSERT INTO CITA(ID_CLIENTE,FECHA)
VALUES(2,'8-MAY-2022');
INSERT INTO CITA(ID_CLIENTE,FECHA)
VALUES(3,'16-JAN-2021');
INSERT INTO CITA(ID_CLIENTE,FECHA)
VALUES(4,'15-DEC-2019');
INSERT INTO CITA(ID_CLIENTE,FECHA)
VALUES(5,'30-JUN-2022');



INSERT INTO VACUNA(NOMBRE_VACUNA,DESCRIPCION)
VALUES('VAC_DISTEMPER','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');
INSERT INTO VACUNA(NOMBRE_VACUNA ,DESCRIPCION)
VALUES('VAC_PARVOVIRUS','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');
INSERT INTO VACUNA(NOMBRE_VACUNA ,DESCRIPCION)
VALUES('VAC_AVC-2','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');
INSERT INTO VACUNA(NOMBRE_VACUNA ,DESCRIPCION)
VALUES('VAC_LEPTOSPIROSIS','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');
INSERT INTO VACUNA(NOMBRE_VACUNA ,DESCRIPCION)
VALUES('VAC_DISTEMPER','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');
INSERT INTO VACUNA(NOMBRE_VACUNA ,DESCRIPCION)
VALUES('VAC_LEPTOSPIROSIS','APLICAR DOSIS POR AÑO Y CACHORROS DE 2 A 3 MESES EN ADELANTE');




INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('ZEUS','MESTIZO','PERRO',6,1,1);
INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('PEPE','CHIGUAGUA','PERRO',2,3,2);
INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('SOCRATES','BULL_DOG','PERRO',18,3,3);
INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('LANZELOT','CANE_CORSO','PERRO',56,2,4);
INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('LANZELOT','CANE_CORSO','PERRO',56,2,5);




INSERT INTO VACUNA_APLICADA(ID_MASCOTA,ID_VACUNA,DOSIS,FECHA)
VALUES(1,1,2,'25-JAN-2022');
INSERT INTO VACUNA_APLICADA(ID_MASCOTA,ID_VACUNA,DOSIS,FECHA)
VALUES(2,2,3,'16-MAY-2022');
INSERT INTO VACUNA_APLICADA(ID_MASCOTA,ID_VACUNA,DOSIS,FECHA)
VALUES(3,3,1,'15-AUG-2022');
INSERT INTO VACUNA_APLICADA(ID_MASCOTA,ID_VACUNA,DOSIS,FECHA)
VALUES(4,4,1,'14-JUN-2022');
INSERT INTO VACUNA_APLICADA(ID_MASCOTA,ID_VACUNA,DOSIS,FECHA)
VALUES(5,5,2,'13-FEB-2022');




INSERT INTO DIAGNOSTICO(DESCRIPCION,ID_MASCOTA,ID_SUCURSAL,FECHA_SALIDA,FECHA_ENTRADA)
VALUES('NO APLICAR, VER EXPEDIENTE',1,1,'25-JUN-2022','27-JUN-2022');
INSERT INTO DIAGNOSTICO(DESCRIPCION,ID_MASCOTA,ID_SUCURSAL,FECHA_SALIDA,FECHA_ENTRADA)
VALUES('PENDIENTE DE VACUNAS',2,2,'27-FEB-2021','27-FEB-2021');
INSERT INTO DIAGNOSTICO(DESCRIPCION,ID_MASCOTA,ID_SUCURSAL,FECHA_SALIDA,FECHA_ENTRADA)
VALUES('ESQUEMA COMPLETO',3,3,'19-MAY-2022','20-MAY-2022');
INSERT INTO DIAGNOSTICO(DESCRIPCION,ID_MASCOTA,ID_SUCURSAL,FECHA_SALIDA,FECHA_ENTRADA)
VALUES('APLICAR DOSIS COMPLETAS',4,4,'07-JUN-2021','08-JUN-2021');
INSERT INTO DIAGNOSTICO(DESCRIPCION,ID_MASCOTA,ID_SUCURSAL,FECHA_SALIDA,FECHA_ENTRADA)
VALUES('APLICAR SOLO RABIA',5,5,'16-JUL-2022','16-JUL-2022');


--- PROCEDIMIENTO USANDO UN CURSOR #1
CREATE OR REPLACE PROCEDURE MASCOTAS (FILAS OUT SYS_REFCURSOR)
AS
    BEGIN
        OPEN FILAS FOR SELECT * FROM MASCOTA;
    END;
    
    /*
    #test
    VAR FILAS REFCURSOR;
    EXECUTE MASCOTAS(:FILAS);
    PRINT FILAS;
    */
    
    
    PROCEDIMIENTO #2
    CREATE OR REPLACE PROCEDURE FIND_MASCOTA (MNAME IN VARCHAR2,FILA OUT SYS_REFCURSOR)
    AS
    BEGIN
        OPEN FILA FOR
        SELECT M.NOMBRE_MASCOTA , M.RAZA, M.TIPO_ANIMAL, C.NOMBRE_CLI, C.APELLIDO1, V.NOMBRE_VACUNA FROM MASCOTA M INNER JOIN CLIENTE C ON C.ID_CLIENTE=M.ID_CLIENTE 
        INNER JOIN VACUNA_APLICADA VP ON VP.ID_MASCOTA=M.ID_MASCOTA INNER JOIN VACUNA V ON V.ID_VACUNA=VP.ID_VACUNA where NOMBRE_MASCOTA=MNAME;
        
    END;
    
    /*
    #TEST
    VAR FILA REFCURSOR;
    EXECUTE FIND_MASCOTA ('ZEUS',:FILA);
    PRINT FILA;
    */
    

---TRIGGER #1

---CREACION TABLA AUDITORIA
CREATE TABLE AUDITORIA(
    ID_RECORD NUMBER GENERATED ALWAYS AS IDENTITY,
    FECHA DATE,
    ACCION VARCHAR2(250),
    USUARIO VARCHAR2(50),
    PRIMARY KEY (ID_RECORD)
)
    
CREATE OR REPLACE TRIGGER AUDITORIA_MASCOTAS
    AFTER INSERT OR UPDATE OR DELETE
    ON MASCOTA
DECLARE
    VFECHA DATE;
    VACCION VARCHAR2(250);
    VUSUARIO VARCHAR2(50);
BEGIN
    SELECT USER,SYSDATE INTO VUSUARIO,VFECHA FROM DUAL;
    IF INSERTING THEN
        INSERT INTO AUDITORIA (ACCION, USUARIO, FECHA)VALUES ('SE INSERTARON DATOS',VUSUARIO,VFECHA);
    ELSIF UPDATING THEN
        INSERT INTO AUDITORIA (ACCION, USUARIO, FECHA)VALUES ('SE ACTUALIZARON DATOS',VUSUARIO,VFECHA);
    ELSIF DELETING THEN
        INSERT INTO AUDITORIA (ACCION, USUARIO, FECHA)VALUES ('SE BORRARON DATOS',VUSUARIO,VFECHA);
    ELSE
        DBMS_OUTPUT.PUT_LINE('ACCION NO RECONOCIDA');
    END IF;
END;


/*
---TEST
INSERT INTO MASCOTA(NOMBRE_MASCOTA,RAZA,TIPO_ANIMAL,PESO,EDAD,ID_CLIENTE)
VALUES('ZEUS','MESTIZO','PERRO',6,1,1);
DELETE  FROM MASCOTA WHERE ID_MASCOTA=7;


SELECT * FROM MASCOTA
SELECT * FROM AUDITORIA
*/

---CREACION DE VISTAS #1

        CREATE MATERIALIZED VIEW LISTA_CLIENTES AS SELECT C.NOMBRE_CLI||' '|| C.APELLIDO1 ||' '|| C.APELLIDO2 AS "NOMBRE COMPLETO", 
        M.NOMBRE_MASCOTA , M.RAZA, M.TIPO_ANIMAL , V.NOMBRE_VACUNA FROM MASCOTA M INNER JOIN CLIENTE C ON C.ID_CLIENTE=M.ID_CLIENTE 
        INNER JOIN VACUNA_APLICADA VP ON VP.ID_MASCOTA=M.ID_MASCOTA INNER JOIN VACUNA V ON V.ID_VACUNA=VP.ID_VACUNA;
        /*
        DROP MATERIALIZED VIEW LISTA_CLIENTES;
        SELECT * FROM LISTA_CLIENTES
        */
    
    
    
