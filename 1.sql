----TABLA CLIENTE
CREATE TABLE CLIENTE(
ID_CLIENTE INT IDENTITY PRIMARY KEY NO NULL,
NOMBRE VARHCAR2(50),
APELLIDO VACHAR2(50),
DIRECCION VARCAHR2(50),
TELEFONO VARCHAR2(50),
CORREO VARCHAR2(50));

----TABLA DISTRIBUIDOR 
CREATE TABLE DISTRIBUIDOR(
ID_DISTRIBUIDOR INT IDENTITY PRIMARY KEY NO NULL,
NOMBRE VARHCAR2(50),
DIRECCION VARCAHR2(50),
TELEFONO VARCHAR2(50),
);

----TABLA EMPLEADO
CREATE TABLE EMPLEADO(
ID_EMPLEADO INT IDENTITY PRIMARY KEY NO NULL,
NOMBRE VARHCAR2(50),
APELLIDO VACHAR2(50),
TELEFONO VARCHAR2(50),
CORREO VARCHAR2(50));
);

----TABLA COLOR
CREATE TABLE COLOR(
ID_COLOR INT IDENTITY PRIMARY KEY NO NULL,
COLOR VARHCAR2(20));

----TABLA MARCA
CREATE TABLE MARCA(
ID_MARCA INT IDENTITY PRIMARY KEY NO NULL,
NOMBRE_MARCA VARHCAR2(20));

----TABLA AUTOMOVIL
CREATE TABLE AUTOMOVIL(
ID_AUTOMOVIL INT IDENTITY PRIMARY KEY NO NULL,
MODELO VARCHAR2(50),
ID_MARCA INT,
FOREIGN KEY (ID_MARCA) REFERENCES MARCAS(ID_MARCA)
A�O INT;
PRECIO FLOAT,
NUMERO_VIN,
ID_COLOR INT
FOREIGN KEY (ID_COLOR) REFERENCES COLOR(ID_COLOR));

----TABLA VENTA
CREATE TABLE VENTA(
ID_VENTA INT IDENTITY PRIMARY KEY NO NULL,
FECHA VENTA DATE,
ID_CLIENTE INT, 
ID_AUTOMOVIL INT, 
ID_EMPLEADO INT,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
FOREIGN KEY (ID_AUTOMOVIL) REFERENCES AUTOMOVIL(ID_AUTOMOVIL),
FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO));


-- CRUD Cliente
CREATE OR REPLACE PROCEDURE CrearCliente(
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_direccion VARCHAR2,
    p_telefono VARCHAR2,
    p_correo VARCHAR2
) AS
BEGIN
    INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO)
    VALUES (p_nombre, p_apellido, p_direccion, p_telefono, p_correo);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerCliente(
    p_id_cliente INT
) RETURN CLIENTE%ROWTYPE AS
    v_cliente CLIENTE%ROWTYPE;
BEGIN
    SELECT * INTO v_cliente
    FROM CLIENTE
    WHERE ID_CLIENTE = p_id_cliente;
    RETURN v_cliente;
END;

CREATE OR REPLACE PROCEDURE ActualizarCliente(
    p_id_cliente INT,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_direccion VARCHAR2,
    p_telefono VARCHAR2,
    p_correo VARCHAR2
) AS
BEGIN
    UPDATE CLIENTE
    SET
        NOMBRE = p_nombre,
        APELLIDO = p_apellido,
        DIRECCION = p_direccion,
        TELEFONO = p_telefono,
        CORREO = p_correo
    WHERE ID_CLIENTE = p_id_cliente;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarCliente(
    p_id_cliente INT
) AS
BEGIN
    DELETE FROM CLIENTE
    WHERE ID_CLIENTE = p_id_cliente;
    COMMIT;
END;

-- CRUD Distribuidor
CREATE OR REPLACE PROCEDURE CrearDistribuidor(
    p_nombre VARCHAR2,
    p_direccion VARCHAR2,
    p_telefono VARCHAR2
) AS
BEGIN
    INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO)
    VALUES (p_nombre, p_direccion, p_telefono);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerDistribuidor(
    p_id_distribuidor INT
) RETURN DISTRIBUIDOR%ROWTYPE AS
    v_distribuidor DISTRIBUIDOR%ROWTYPE;
BEGIN
    SELECT * INTO v_distribuidor
    FROM DISTRIBUIDOR
    WHERE ID_DISTRIBUIDOR = p_id_distribuidor;
    RETURN v_distribuidor;
END;

CREATE OR REPLACE PROCEDURE ActualizarDistribuidor(
    p_id_distribuidor INT,
    p_nombre VARCHAR2,
    p_direccion VARCHAR2,
    p_telefono VARCHAR2
) AS
BEGIN
    UPDATE DISTRIBUIDOR
    SET
        NOMBRE = p_nombre,
        DIRECCION = p_direccion,
        TELEFONO = p_telefono
    WHERE ID_DISTRIBUIDOR = p_id_distribuidor;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarDistribuidor(
    p_id_distribuidor INT
) AS
BEGIN
    DELETE FROM DISTRIBUIDOR
    WHERE ID_DISTRIBUIDOR = p_id_distribuidor;
    COMMIT;
END;

-- CRUD Empleado
CREATE OR REPLACE PROCEDURE CrearEmpleado(
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_telefono VARCHAR2,
    p_correo VARCHAR2
) AS
BEGIN
    INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO)
    VALUES (p_nombre, p_apellido, p_telefono, p_correo);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerEmpleado(
    p_id_empleado INT
) RETURN EMPLEADO%ROWTYPE AS
    v_empleado EMPLEADO%ROWTYPE;
BEGIN
    SELECT * INTO v_empleado
    FROM EMPLEADO
    WHERE ID_EMPLEADO = p_id_empleado;
    RETURN v_empleado;
END;

CREATE OR REPLACE PROCEDURE ActualizarEmpleado(
    p_id_empleado INT,
    p_nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_telefono VARCHAR2,
    p_correo VARCHAR2
) AS
BEGIN
    UPDATE EMPLEADO
    SET
        NOMBRE = p_nombre,
        APELLIDO = p_apellido,
        TELEFONO = p_telefono,
        CORREO = p_correo
    WHERE ID_EMPLEADO = p_id_empleado;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarEmpleado(
    p_id_empleado INT
) AS
BEGIN
    DELETE FROM EMPLEADO
    WHERE ID_EMPLEADO = p_id_empleado;
    COMMIT;
END;

-- CRUD Color
CREATE OR REPLACE PROCEDURE CrearColor(
    p_color VARCHAR2
) AS
BEGIN
    INSERT INTO COLOR (COLOR)
    VALUES (p_color);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerColor(
    p_id_color INT
) RETURN COLOR%ROWTYPE AS
    v_color COLOR%ROWTYPE;
BEGIN
    SELECT * INTO v_color
    FROM COLOR
    WHERE ID_COLOR = p_id_color;
    RETURN v_color;
END;

CREATE OR REPLACE PROCEDURE ActualizarColor(
    p_id_color INT,
    p_color VARCHAR2
) AS
BEGIN
    UPDATE COLOR
    SET
        COLOR = p_color
    WHERE ID_COLOR = p_id_color;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarColor(
    p_id_color INT
) AS
BEGIN
    DELETE FROM COLOR
    WHERE ID_COLOR = p_id_color;
    COMMIT;
END;

-- CRUD Marca
CREATE OR REPLACE PROCEDURE CrearMarca(
    p_nombre_marca VARCHAR2
) AS
BEGIN
    INSERT INTO MARCA (NOMBRE_MARCA)
    VALUES (p_nombre_marca);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerMarca(
    p_id_marca INT
) RETURN MARCA%ROWTYPE AS
    v_marca MARCA%ROWTYPE;
BEGIN
    SELECT * INTO v_marca
    FROM MARCA
    WHERE ID_MARCA = p_id_marca;
    RETURN v_marca;
END;

CREATE OR REPLACE PROCEDURE ActualizarMarca(
    p_id_marca INT,
    p_nombre_marca VARCHAR2
) AS
BEGIN
    UPDATE MARCA
    SET
        NOMBRE_MARCA = p_nombre_marca
    WHERE ID_MARCA = p_id_marca;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarMarca(
    p_id_marca INT
) AS
BEGIN
    DELETE FROM MARCA
    WHERE ID_MARCA = p_id_marca;
    COMMIT;
END;

-- CRUD Automovil
CREATE OR REPLACE PROCEDURE CrearAutomovil(
    p_modelo VARCHAR2,
    p_id_marca INT,
    p_ano INT,
    p_precio FLOAT,
    p_numero_vin VARCHAR2,
    p_id_color INT
) AS
BEGIN
    INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR)
    VALUES (p_modelo, p_id_marca, p_ano, p_precio, p_numero_vin, p_id_color);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE ActualizarAutomovil(
    p_id_automovil INT,
    p_modelo VARCHAR2,
    p_id_marca INT,
    p_ano INT,
    p_precio FLOAT,
    p_numero_vin VARCHAR2,
    p_id_color INT
) AS
BEGIN
    UPDATE AUTOMOVIL
    SET
        MODELO = p_modelo,
        ID_MARCA = p_id_marca,
        A�O = p_ano,
        PRECIO = p_precio,
        NUMERO_VIN = p_numero_vin,
        ID_COLOR = p_id_color
    WHERE ID_AUTOMOVIL = p_id_automovil;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarAutomovil(
    p_id_automovil INT
) AS
BEGIN
    DELETE FROM AUTOMOVIL
    WHERE ID_AUTOMOVIL = p_id_automovil;
    COMMIT;
END;

--CRUD Venta
CREATE OR REPLACE PROCEDURE CrearVenta(
    p_fecha_venta DATE,
    p_id_cliente INT,
    p_id_automovil INT,
    p_id_empleado INT
) AS
BEGIN
    INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO)
    VALUES (p_fecha_venta, p_id_cliente, p_id_automovil, p_id_empleado);
    COMMIT;
END;

CREATE OR REPLACE FUNCTION LeerVenta(
    p_id_venta INT
) RETURN VENTA%ROWTYPE AS
    v_venta VENTA%ROWTYPE;
BEGIN
    SELECT * INTO v_venta
    FROM VENTA
    WHERE ID_VENTA = p_id_venta;
    RETURN v_venta;
END;

CREATE OR REPLACE PROCEDURE ActualizarVenta(
    p_id_venta INT,
    p_fecha_venta DATE,
    p_id_cliente INT,
    p_id_automovil INT,
    p_id_empleado INT
) AS
BEGIN
    UPDATE VENTA
    SET
        FECHA_VENTA = p_fecha_venta,
        ID_CLIENTE = p_id_cliente,
        ID_AUTOMOVIL = p_id_automovil,
        ID_EMPLEADO = p_id_empleado
    WHERE ID_VENTA = p_id_venta;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE EliminarVenta(
    p_id_venta INT
) AS
BEGIN
    DELETE FROM VENTA
    WHERE ID_VENTA = p_id_venta;
    COMMIT;
END;

-- Inserciones en la tabla CLIENTE
INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
VALUES ('Juan', 'P�rez', 'Calle 123', '123-456-7890', 'juan@example.com');

INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
VALUES ('Mar�a', 'Gonz�lez', 'Avenida 456', '987-654-3210', 'maria@example.com');

INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
VALUES ('Carlos', 'Ram�rez', 'Calle Principal', '555-123-4567', 'carlos@example.com');

INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
VALUES ('Ana', 'Mart�nez', 'Calle Secundaria', '333-888-7777', 'ana@example.com');

INSERT INTO CLIENTE (NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
VALUES ('Pedro', 'S�nchez', 'Avenida Norte', '444-999-8888', 'pedro@example.com');

-- Inserciones en la tabla DISTRIBUIDOR
INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO) 
VALUES ('Distribuidor A', 'Calle Central', '111-222-3333');

INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO) 
VALUES ('Distribuidor B', 'Avenida Principal', '555-444-3333');

INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO) 
VALUES ('Distribuidor C', 'Avenida Sur', '888-777-6666');

INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO) 
VALUES ('Distribuidor D', 'Calle 456', '999-666-5555');

INSERT INTO DISTRIBUIDOR (NOMBRE, DIRECCION, TELEFONO) 
VALUES ('Distribuidor E', 'Avenida 789', '777-333-2222');

-- Inserciones en la tabla EMPLEADO
INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO) 
VALUES ('Luis', 'Mart�nez', '111-222-3333', 'luis@example.com');

INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO) 
VALUES ('Sof�a', 'G�mez', '555-444-3333', 'sofia@example.com');

INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO) 
VALUES ('Javier', 'S�nchez', '888-777-6666', 'javier@example.com');

INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO) 
VALUES ('Laura', 'P�rez', '999-666-5555', 'laura@example.com');

INSERT INTO EMPLEADO (NOMBRE, APELLIDO, TELEFONO, CORREO) 
VALUES ('Daniel', 'Gonz�lez', '777-333-2222', 'daniel@example.com');

-- Inserciones en la tabla COLOR
INSERT INTO COLOR (COLOR) 
VALUES ('Rojo');

INSERT INTO COLOR (COLOR) 
VALUES ('Azul');

INSERT INTO COLOR (COLOR) 
VALUES ('Verde');

INSERT INTO COLOR (COLOR) 
VALUES ('Blanco');

INSERT INTO COLOR (COLOR) 
VALUES ('Negro');

-- Inserciones en la tabla MARCA
INSERT INTO MARCA (NOMBRE_MARCA) 
VALUES ('Toyota');

INSERT INTO MARCA (NOMBRE_MARCA) 
VALUES ('Honda');

INSERT INTO MARCA (NOMBRE_MARCA) 
VALUES ('Ford');

INSERT INTO MARCA (NOMBRE_MARCA) 
VALUES ('Chevrolet');

INSERT INTO MARCA (NOMBRE_MARCA) 
VALUES ('Nissan');

-- Inserciones en la tabla AUTOMOVIL
-- Aqu� debes tener en cuenta que la columna ID_MARCA se refiere a la tabla MARCA, por lo que debes usar valores de ID v�lidos de la tabla MARCA.
INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR) 
VALUES ('Corolla', 1, 2023, 25000.00, 'VIN123456', 1);

INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR) 
VALUES ('Civic', 2, 2023, 24000.00, 'VIN654321', 2);

INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR) 
VALUES ('F-150', 3, 2023, 35000.00, 'VIN789123', 4);

INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR) 
VALUES ('Silverado', 4, 2023, 36000.00, 'VIN456789', 5);

INSERT INTO AUTOMOVIL (MODELO, ID_MARCA, A�O, PRECIO, NUMERO_VIN, ID_COLOR) 
VALUES ('Altima', 5, 2023, 28000.00, 'VIN987654', 3);

-- Inserciones en la tabla VENTA
-- Aseg�rate de usar IDs v�lidos de CLIENTE, AUTOMOVIL y EMPLEADO que se hayan insertado previamente.

INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO) 
VALUES (TO_DATE('2023-11-02', 'YYYY-MM-DD'), 1, 1, 1);

INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO) 
VALUES (TO_DATE('2023-11-02', 'YYYY-MM-DD'), 2, 2, 2); 

INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO) 
VALUES (TO_DATE('2023-11-03', 'YYYY-MM-DD'), 3, 3, 3);

INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO) 
VALUES (TO_DATE('2023-11-04', 'YYYY-MM-DD'), 4, 4, 4);

INSERT INTO VENTA (FECHA_VENTA, ID_CLIENTE, ID_AUTOMOVIL, ID_EMPLEADO) 
VALUES (TO_DATE('2023-11-05', 'YYYY-MM-DD'), 5, 5, 5);

--TRIGGERS
SET SERVEROUTPUT ON;
--1
CREATE OR REPLACE TRIGGER Consulta_datos AFTER INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se ha insertado un nuevo cliente: ' || :NEW.NOMBRE || ' ' || :NEW.APELLIDO ||
                        ', DIRECCIÓN: ' || :NEW.DIRECCION ||
                        ', TELÉFONO: ' || :NEW.TELEFONO ||
                        ', CORREO: ' || :NEW.CORREO);
END;
/

--2
CREATE OR REPLACE TRIGGER Mostrar_Informacion_Empleado
AFTER INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo empleado registrado:');
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || :NEW.ID_EMPLEADO);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || :NEW.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || :NEW.APELLIDO);
    DBMS_OUTPUT.PUT_LINE('Teléfono: ' || :NEW.TELEFONO);
    DBMS_OUTPUT.PUT_LINE('Correo: ' || :NEW.CORREO);
END;
/


--3
CREATE OR REPLACE TRIGGER Mostrar_Informacion_Color
AFTER INSERT ON COLOR
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo color registrado:');
    DBMS_OUTPUT.PUT_LINE('Color: ' || :NEW.COLOR);
END;
/


--4

CREATE OR REPLACE TRIGGER Mostrar_Informacion_Distribuidor
AFTER INSERT ON DISTRIBUIDOR
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo distribuidor registrado:');
    DBMS_OUTPUT.PUT_LINE('ID: ' || :NEW.ID_DISTRIBUIDOR);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || :NEW.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Dirección: ' || :NEW.DIRECCION);
    DBMS_OUTPUT.PUT_LINE('Teléfono: ' || :NEW.TELEFONO);
END;
/

--5
CREATE OR REPLACE TRIGGER Mostrar_Informacion_Venta
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nueva venta registrada:');
    DBMS_OUTPUT.PUT_LINE('ID Venta: ' || :NEW.ID_VENTA);
    DBMS_OUTPUT.PUT_LINE('Fecha de Venta: ' || TO_CHAR(:NEW.FECHA_VENTA, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || :NEW.ID_CLIENTE);
    DBMS_OUTPUT.PUT_LINE('ID Automóvil: ' || :NEW.ID_AUTOMOVIL);
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || :NEW.ID_EMPLEADO);
END;
/

--FUNCIONES
--1
CREATE OR REPLACE FUNCTION ObtenerNombreCompletoCliente(p_id_cliente INT) RETURN VARCHAR2 IS
   v_nombre_completo VARCHAR2(100);
BEGIN
   SELECT NOMBRE || ' ' || APELLIDO INTO v_nombre_completo
   FROM CLIENTE
   WHERE ID_CLIENTE = p_id_cliente;
   RETURN v_nombre_completo;
END;
/
--2
CREATE OR REPLACE FUNCTION CalcularPrecioTotalVenta(p_id_venta INT) RETURN FLOAT IS
   v_precio_total FLOAT;
BEGIN
   SELECT SUM(PRECIO)
   INTO v_precio_total
   FROM AUTOMOVIL
   WHERE ID_AUTOMOVIL IN (SELECT ID_AUTOMOVIL FROM VENTA WHERE ID_VENTA = p_id_venta);
   RETURN v_precio_total;
END;
/
--3
CREATE OR REPLACE FUNCTION ObtenerInformacionDistribuidor(p_id_distribuidor INT) RETURN VARCHAR2 IS
   v_info_distribuidor VARCHAR2(100);
BEGIN
   SELECT NOMBRE || ', ' || DIRECCION || ', ' || TELEFONO INTO v_info_distribuidor
   FROM DISTRIBUIDOR
   WHERE ID_DISTRIBUIDOR = p_id_distribuidor;
   RETURN v_info_distribuidor;
END;
/
--4
CREATE OR REPLACE FUNCTION ObtenerModeloYMarca(p_id_automovil INT) RETURN VARCHAR2 IS
   v_modelo_marca VARCHAR2(100);
BEGIN
   SELECT A.MODELO || ' (' || M.NOMBRE_MARCA || ')' INTO v_modelo_marca
   FROM AUTOMOVIL A
   JOIN MARCA M ON A.ID_MARCA = M.ID_MARCA
   WHERE A.ID_AUTOMOVIL = p_id_automovil;
   RETURN v_modelo_marca;
END;
/
--5
CREATE OR REPLACE FUNCTION ObtenerColorAutomovil(p_id_automovil INT) RETURN VARCHAR2 IS
   v_color VARCHAR2(20);
BEGIN
   SELECT C.COLOR INTO v_color
   FROM AUTOMOVIL A
   JOIN COLOR C ON A.ID_COLOR = C.ID_COLOR
   WHERE A.ID_AUTOMOVIL = p_id_automovil;
   RETURN v_color;
END;
/
--6
CREATE OR REPLACE FUNCTION ObtenerCantidadVentasEmpleado(p_id_empleado INT) RETURN INT IS
   v_cantidad_ventas INT;
BEGIN
   SELECT COUNT(*) INTO v_cantidad_ventas
   FROM VENTA
   WHERE ID_EMPLEADO = p_id_empleado;
   RETURN v_cantidad_ventas;
END;
/
--7
CREATE OR REPLACE FUNCTION ObtenerPrecioPromedioAutomoviles RETURN FLOAT IS
   v_precio_promedio FLOAT;
BEGIN
   SELECT AVG(PRECIO) INTO v_precio_promedio
   FROM AUTOMOVIL;
   RETURN v_precio_promedio;
END;
/
--8
CREATE OR REPLACE FUNCTION ObtenerColoresDisponibles RETURN SYS_REFCURSOR IS
   v_cursor SYS_REFCURSOR;
BEGIN
   OPEN v_cursor FOR
      SELECT COLOR
      FROM COLOR;
   RETURN v_cursor;
END;
/
--9
CREATE OR REPLACE FUNCTION ObtenerMarcaMasVendida RETURN VARCHAR2 IS
   v_marca_mas_vendida VARCHAR2(50);
BEGIN
   SELECT M.NOMBRE_MARCA INTO v_marca_mas_vendida
   FROM MARCA M
   JOIN AUTOMOVIL A ON M.ID_MARCA = A.ID_MARCA
   JOIN VENTA V ON A.ID_AUTOMOVIL = V.ID_AUTOMOVIL
   GROUP BY M.NOMBRE_MARCA
   ORDER BY COUNT(*) DESC
   FETCH FIRST 1 ROW ONLY;
   RETURN v_marca_mas_vendida;
END;
/
--10
CREATE OR REPLACE FUNCTION ObtenerFechaUltimaVenta RETURN DATE IS
   v_fecha_ultima_venta DATE;
BEGIN
   SELECT MAX(FECHA_VENTA) INTO v_fecha_ultima_venta
   FROM VENTA;
   RETURN v_fecha_ultima_venta;
END;
/
--11
CREATE OR REPLACE FUNCTION ObtenerEmpleadosVentasFecha(p_fecha DATE) RETURN SYS_REFCURSOR IS
   v_cursor SYS_REFCURSOR;
BEGIN
   OPEN v_cursor FOR
      SELECT DISTINCT E.NOMBRE || ' ' || E.APELLIDO AS NOMBRE_COMPLETO
      FROM EMPLEADO E
      JOIN VENTA V ON E.ID_EMPLEADO = V.ID_EMPLEADO
      WHERE TRUNC(V.FECHA_VENTA) = TRUNC(p_fecha);
   RETURN v_cursor;
END;
/
--12
CREATE OR REPLACE FUNCTION CalcularPrecioTotalVentasCliente(p_id_cliente INT) RETURN FLOAT IS
   v_precio_total FLOAT;
BEGIN
   SELECT NVL(SUM(A.PRECIO), 0)
   INTO v_precio_total
   FROM VENTA V
   JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL
   WHERE V.ID_CLIENTE = p_id_cliente;
   RETURN v_precio_total;
END;
/
--13
CREATE OR REPLACE FUNCTION ObtenerCantidadAutomovilesPorColor(p_color VARCHAR2) RETURN INT IS
   v_cantidad_automoviles INT;
BEGIN
   SELECT COUNT(*)
   INTO v_cantidad_automoviles
   FROM AUTOMOVIL A
   JOIN COLOR C ON A.ID_COLOR = C.ID_COLOR
   WHERE C.COLOR = p_color;
   RETURN v_cantidad_automoviles;
END;
/
--14
CREATE OR REPLACE FUNCTION ObtenerPromedioPreciosPorMarca RETURN SYS_REFCURSOR IS
   v_cursor SYS_REFCURSOR;
BEGIN
   OPEN v_cursor FOR
      SELECT M.NOMBRE_MARCA, AVG(A.PRECIO) AS PRECIO_PROMEDIO
      FROM MARCA M
      LEFT JOIN AUTOMOVIL A ON M.ID_MARCA = A.ID_MARCA
      GROUP BY M.NOMBRE_MARCA;
   RETURN v_cursor;
END;
/


--VISTAS
--1 INFORMACION EMPLEADO
CREATE OR REPLACE VIEW Vista_Nombre_Completo AS
SELECT
    ID_EMPLEADO AS "ID Empleado",
    NOMBRE || ' ' || APELLIDO AS "Nombre Completo",
    CORREO AS "Correo"
FROM EMPLEADO;


SELECT * FROM Vista_Nombre_Completo;


--2 INFORMACION DISTRIBUIDOR
CREATE OR REPLACE VIEW Vista_Informacion_Distribuidor AS
SELECT
    NOMBRE || ', ' || DIRECCION || ', ' || TELEFONO AS "Información Distribuidor"
FROM DISTRIBUIDOR;

SELECT * FROM Vista_Informacion_Distribuidor;

--3 INFORMACION CLIENTE
CREATE OR REPLACE VIEW Vista_Nombre_CLIENTE AS
SELECT
    NOMBRE || ' ' || APELLIDO AS "Nombre Completo",
    TELEFONO AS "Numero"
FROM CLIENTE;


SELECT * FROM Vista_Nombre_Cliente;

--4 EMPLEADO X AUTOMOVIL
CREATE OR REPLACE VIEW Vista_Informacion_Venta_Empleado AS
SELECT
    E.NOMBRE || ' ' || E.APELLIDO AS "Nombre del Empleado",
    A.MODELO AS "Modelo del Automóvil",
    V.FECHA_VENTA AS "Fecha de Venta"
FROM VENTA V
JOIN EMPLEADO E ON V.ID_EMPLEADO = E.ID_EMPLEADO
JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL;

SELECT * FROM Vista_Informacion_Venta_Empleado;

--5 VENTA X CLIENTE
CREATE OR REPLACE VIEW Vista_Informacion_Venta AS
SELECT
    V.ID_VENTA AS "ID Venta",
    C.NOMBRE || ' ' || C.APELLIDO AS "Nombre del Cliente",
    A.MODELO AS "Modelo del Automóvil",
    V.FECHA_VENTA AS "Fecha de Venta"
FROM VENTA V
JOIN CLIENTE C ON V.ID_CLIENTE = C.ID_CLIENTE
JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL;

SELECT * FROM Vista_Informacion_Venta;

--6 INFORMACION AUTOMOVIL
CREATE OR REPLACE VIEW Vista_Informacion_Automovil AS
SELECT
    A.MODELO AS "Modelo",
    M.NOMBRE_MARCA AS "Marca",
    A.AÑO AS "Año",
    A.PRECIO AS "Precio"
FROM AUTOMOVIL A
JOIN MARCA M ON A.ID_MARCA = M.ID_MARCA;

SELECT * FROM Vista_Informacion_Automovil;

--7 Venta Automovil
CREATE OR REPLACE VIEW Vista_Informacion_Venta_Automovil AS
SELECT
    V.ID_VENTA AS "ID Venta",
    A.MODELO AS "Automóvil",
    M.NOMBRE_MARCA AS "Marca",
    C.COLOR AS "Color",
    A.PRECIO AS "Precio"
FROM VENTA V
JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL
JOIN MARCA M ON A.ID_MARCA = M.ID_MARCA
JOIN COLOR C ON A.ID_COLOR = C.ID_COLOR;

SELECT * FROM Vista_Informacion_Venta_Automovil;

--8 Colores Disponibles
CREATE OR REPLACE VIEW Vista_ColoresDisponibles AS
SELECT COLOR AS "Colores Disponibles"
FROM COLOR
ORDER BY COLOR;

SELECT * FROM Vista_ColoresDisponibles;

--9 Marcas Disponibles
CREATE OR REPLACE VIEW Vista_MarcasDisponibles AS
SELECT NOMBRE_MARCA AS "Marcas Disponibles"
FROM MARCA
ORDER BY NOMBRE_MARCA;

SELECT * FROM Vista_MarcasDisponibles;

--10 Empleado y Precio de venta 
CREATE OR REPLACE VIEW Vista_Venta_Precio AS
SELECT
    E.NOMBRE || ' ' || E.APELLIDO AS "Empleado",
    V.FECHA_VENTA AS "Fecha de Venta",
    A.PRECIO AS "Precio del Automóvil"
FROM VENTA V
JOIN EMPLEADO E ON V.ID_EMPLEADO = E.ID_EMPLEADO
JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL;

SELECT * FROM Vista_Venta_Precio;

----BLOQUES
SET SERVEROUTPUT ON;

---1 Automovil mas costoso
DECLARE
  v_max_precio FLOAT;
  v_id_automovil INT;
BEGIN
  -- Encontrar el precio máximo en la tabla AUTOMOVIL
  SELECT MAX(PRECIO) INTO v_max_precio FROM AUTOMOVIL;

  -- Encontrar el ID del automóvil con el precio máximo
  SELECT ID_AUTOMOVIL INTO v_id_automovil
  FROM AUTOMOVIL
  WHERE PRECIO = v_max_precio;

  -- Mostrar el resultado
  DBMS_OUTPUT.PUT_LINE('El automóvil con el precio más alto tiene un precio de ' || v_max_precio || ' y su ID es ' || v_id_automovil);
END;
/

--2 Venta mas costosa
DECLARE
  v_id_venta INT;
  v_fecha_venta DATE;
  v_id_cliente INT;
  v_id_automovil INT;
  v_id_empleado INT;
  v_max_precio FLOAT;

BEGIN
  -- Encontrar el precio en VENTA
  SELECT MAX(PRECIO) INTO v_max_precio
  FROM (
    SELECT VENTA.ID_VENTA, AUTOMOVIL.PRECIO
    FROM VENTA
    JOIN AUTOMOVIL ON VENTA.ID_AUTOMOVIL = AUTOMOVIL.ID_AUTOMOVIL
  );

  -- Encontrar la venta con el precio mas alto
  SELECT V.ID_VENTA, V.FECHA_VENTA, V.ID_CLIENTE, V.ID_AUTOMOVIL, V.ID_EMPLEADO
  INTO v_id_venta, v_fecha_venta, v_id_cliente, v_id_automovil, v_id_empleado
  FROM VENTA V
  JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL
  WHERE A.PRECIO = v_max_precio;

  -- Mostrar información de la venta 
  DBMS_OUTPUT.PUT_LINE('La venta más costosa tiene un ID de venta: ' || v_id_venta);
  DBMS_OUTPUT.PUT_LINE('Fecha de venta: ' || TO_CHAR(v_fecha_venta, 'DD/MM/YYYY'));
  DBMS_OUTPUT.PUT_LINE('ID del cliente: ' || v_id_cliente);
  DBMS_OUTPUT.PUT_LINE('ID del automóvil: ' || v_id_automovil);
  DBMS_OUTPUT.PUT_LINE('ID del empleado: ' || v_id_empleado);
  DBMS_OUTPUT.PUT_LINE('Precio más alto: ' || v_max_precio);
END;
/

--3 Venta mas baja
DECLARE
  v_id_venta INT;
  v_fecha_venta DATE;
  v_id_cliente INT;
  v_id_automovil INT;
  v_id_empleado INT;
  v_min_precio FLOAT;

BEGIN
  -- Encontrar el precio mínimo en VENTA
  SELECT MIN(PRECIO) INTO v_min_precio
  FROM (
    SELECT VENTA.ID_VENTA, AUTOMOVIL.PRECIO
    FROM VENTA
    JOIN AUTOMOVIL ON VENTA.ID_AUTOMOVIL = AUTOMOVIL.ID_AUTOMOVIL
  );

  -- Encontrar la venta con el precio más bajo
  SELECT V.ID_VENTA, V.FECHA_VENTA, V.ID_CLIENTE, V.ID_AUTOMOVIL, V.ID_EMPLEADO
  INTO v_id_venta, v_fecha_venta, v_id_cliente, v_id_automovil, v_id_empleado
  FROM VENTA V
  JOIN AUTOMOVIL A ON V.ID_AUTOMOVIL = A.ID_AUTOMOVIL
  WHERE A.PRECIO = v_min_precio;

  -- Mostrar información de la venta con el precio más bajo
  DBMS_OUTPUT.PUT_LINE('La venta más económica tiene un ID de venta: ' || v_id_venta);
  DBMS_OUTPUT.PUT_LINE('Fecha de venta: ' || TO_CHAR(v_fecha_venta, 'DD/MM/YYYY'));
  DBMS_OUTPUT.PUT_LINE('ID del cliente: ' || v_id_cliente);
  DBMS_OUTPUT.PUT_LINE('ID del automóvil: ' || v_id_automovil);
  DBMS_OUTPUT.PUT_LINE('ID del empleado: ' || v_id_empleado);
  DBMS_OUTPUT.PUT_LINE('Precio más bajo: ' || v_min_precio);
END;
/

--4 Automovil mas barato
DECLARE
  v_min_precio FLOAT;
  v_id_automovil INT;
BEGIN
  -- Encontrar el precio mínimo en la tabla AUTOMOVIL
  SELECT MIN(PRECIO) INTO v_min_precio FROM AUTOMOVIL;

  -- Encontrar el ID del automóvil con el precio mínimo
  SELECT ID_AUTOMOVIL INTO v_id_automovil
  FROM AUTOMOVIL
  WHERE PRECIO = v_min_precio;

  -- Mostrar el resultado
  DBMS_OUTPUT.PUT_LINE('El automóvil con el precio más bajo tiene un precio de ' || v_min_precio || ' y su ID es ' || v_id_automovil);
END;
/

--5 
DECLARE
  v_iva_porcentaje NUMBER := 0.12; -- Porcentaje de IVA (12% en este ejemplo)
  v_id_venta INT;
  v_fecha_venta DATE;
  v_id_cliente INT;
  v_id_automovil INT;
  v_id_empleado INT;
  v_precio_iva FLOAT;

BEGIN
  -- Recorre la tabla VENTA y muestra los datos de cada venta con IVA
  FOR r IN (SELECT * FROM VENTA)
  LOOP
    v_id_venta := r.ID_VENTA;
    v_fecha_venta := r.FECHA_VENTA;
    v_id_cliente := r.ID_CLIENTE;
    v_id_automovil := r.ID_AUTOMOVIL;
    v_id_empleado := r.ID_EMPLEADO;

    -- Calcula el precio con IVA
    SELECT PRECIO * (1 + v_iva_porcentaje) INTO v_precio_iva
    FROM AUTOMOVIL
    WHERE ID_AUTOMOVIL = v_id_automovil;

    -- Muestra los datos de la venta con IVA
    DBMS_OUTPUT.PUT_LINE('ID de Venta: ' || v_id_venta);
    DBMS_OUTPUT.PUT_LINE('Fecha de Venta: ' || TO_CHAR(v_fecha_venta, 'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('ID de Cliente: ' || v_id_cliente);
    DBMS_OUTPUT.PUT_LINE('ID de Automóvil: ' || v_id_automovil);
    DBMS_OUTPUT.PUT_LINE('ID de Empleado: ' || v_id_empleado);
    DBMS_OUTPUT.PUT_LINE('Precio con IVA: ' || v_precio_iva);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
  END LOOP;
END;
/

--Listar todos los clientes
DECLARE
  CURSOR c_clientes IS
    SELECT NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO
    FROM CLIENTE;
BEGIN
  FOR cliente_rec IN c_clientes LOOP
    DBMS_OUTPUT.PUT_LINE(cliente_rec.NOMBRE || ' ' || cliente_rec.APELLIDO || ', ' || cliente_rec.DIRECCION);
  END LOOP;
END;

--Listar todos los distribuidores
DECLARE
  CURSOR c_distribuidores IS
    SELECT NOMBRE, DIRECCION, TELEFONO
    FROM DISTRIBUIDOR;
BEGIN
  FOR distribuidor_rec IN c_distribuidores LOOP
    DBMS_OUTPUT.PUT_LINE(distribuidor_rec.NOMBRE || ', ' || distribuidor_rec.DIRECCION);
  END LOOP;
END;

--Listar todos los empleados
DECLARE
  CURSOR c_empleados IS
    SELECT NOMBRE, APELLIDO, TELEFONO, CORREO
    FROM EMPLEADO;
BEGIN
  FOR empleado_rec IN c_empleados LOOP
    DBMS_OUTPUT.PUT_LINE(empleado_rec.NOMBRE || ' ' || empleado_rec.APELLIDO || ', ' || empleado_rec.TELEFONO);
  END LOOP;
END;

--Listar colores disponibles
DECLARE
  CURSOR c_colores IS
    SELECT COLOR
    FROM COLOR;
BEGIN
  FOR color_rec IN c_colores LOOP
    DBMS_OUTPUT.PUT_LINE(color_rec.COLOR);
  END LOOP;
END;

--Listar las marcas de autos disponibles
DECLARE
  CURSOR c_marcas IS
    SELECT NOMBRE_MARCA
    FROM MARCA;
BEGIN
  FOR marca_rec IN c_marcas LOOP
    DBMS_OUTPUT.PUT_LINE(marca_rec.NOMBRE_MARCA);
  END LOOP;
END;

--Listar automoviles disponibles
DECLARE
  CURSOR c_automoviles IS
    SELECT MODELO, A�O, PRECIO
    FROM AUTOMOVIL;
BEGIN
  FOR automovil_rec IN c_automoviles LOOP
    DBMS_OUTPUT.PUT_LINE(automovil_rec.MODELO || ', ' || automovil_rec.A�O || ', ' || automovil_rec.PRECIO);
  END LOOP;
END;

--Listar las ventas realizadas en un rango de fechas espec�fico
DECLARE
  CURSOR c_ventas_fechas IS
    SELECT v.FECHA_VENTA, c.NOMBRE AS NOMBRE_CLIENTE, a.MODELO AS MODELO_AUTOMOVIL
    FROM VENTA v
    JOIN CLIENTE c ON v.ID_CLIENTE = c.ID_CLIENTE
    JOIN AUTOMOVIL a ON v.ID_AUTOMOVIL = a.ID_AUTOMOVIL
    WHERE v.FECHA_VENTA BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD');
BEGIN
  FOR venta_rec IN c_ventas_fechas LOOP
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || venta_rec.FECHA_VENTA || ', Cliente: ' || venta_rec.NOMBRE_CLIENTE || ', Autom�vil: ' || venta_rec.MODELO_AUTOMOVIL);
  END LOOP;
END;

--Calcular el total de ventas por empleado
DECLARE
  CURSOR c_ventas_empleados IS
    SELECT e.NOMBRE, e.APELLIDO, COUNT(v.ID_VENTA) AS NUM_VENTAS
    FROM EMPLEADO e
    LEFT JOIN VENTA v ON e.ID_EMPLEADO = v.ID_EMPLEADO
    GROUP BY e.NOMBRE, e.APELLIDO;
BEGIN
  FOR empleado_venta_rec IN c_ventas_empleados LOOP
    DBMS_OUTPUT.PUT_LINE(empleado_venta_rec.NOMBRE || ' ' || empleado_venta_rec.APELLIDO || ' - Total de ventas: ' || empleado_venta_rec.NUM_VENTAS);
  END LOOP;
END;

--Encontrar el cliente que m�s compras ha realizado
DECLARE
  CURSOR c_cliente_mas_compras IS
    SELECT c.NOMBRE, c.APELLIDO, COUNT(v.ID_VENTA) AS NUM_COMPRAS
    FROM CLIENTE c
    LEFT JOIN VENTA v ON c.ID_CLIENTE = v.ID_CLIENTE
    GROUP BY c.NOMBRE, c.APELLIDO
    ORDER BY NUM_COMPRAS DESC;
BEGIN
  OPEN c_cliente_mas_compras;
  FETCH c_cliente_mas_compras INTO v_nombre, v_apellido, v_num_compras;
  DBMS_OUTPUT.PUT_LINE('El cliente con m�s compras es: ' || v_nombre || ' ' || v_apellido || ' - Compras: ' || v_num_compras);
  CLOSE c_cliente_mas_compras;
END;

--Listar los distribuidores que suministran piezas de un color espec�fico
DECLARE
  v_color VARCHAR2(20) := 'Rojo';
  CURSOR c_distribuidores_color IS
    SELECT d.NOMBRE
    FROM DISTRIBUIDOR d
    JOIN PIEZAS p ON d.ID_DISTRIBUIDOR = p.ID_DISTRIBUIDOR
    JOIN COLOR c ON p.ID_COLOR = c.ID_COLOR
    WHERE c.COLOR = v_color;
BEGIN
  FOR distribuidor_color_rec IN c_distribuidores_color LOOP
    DBMS_OUTPUT.PUT_LINE('Distribuidor que suministra piezas de color ' || v_color || ': ' || distribuidor_color_rec.NOMBRE);
  END LOOP;
END;

--Listar los empleados que no han realizado ninguna venta
DECLARE
  CURSOR c_empleados_sin_ventas IS
    SELECT e.NOMBRE, e.APELLIDO
    FROM EMPLEADO e
    WHERE e.ID_EMPLEADO NOT IN (SELECT DISTINCT ID_EMPLEADO FROM VENTA);
BEGIN
  FOR empleado_sin_ventas_rec IN c_empleados_sin_ventas LOOP
    DBMS_OUTPUT.PUT_LINE('Empleado sin ventas: ' || empleado_sin_ventas_rec.NOMBRE || ' ' || empleado_sin_ventas_rec.APELLIDO);
  END LOOP;
END;

-- Calcular el precio promedio de los autom�viles de una marca espec�fica
DECLARE
  v_marca VARCHAR2(20) := 'Toyota';
  CURSOR c_precio_promedio IS
    SELECT AVG(a.PRECIO) AS PRECIO_PROMEDIO
    FROM AUTOMOVIL a
    JOIN MARCA m ON a.ID_MARCA = m.ID_MARCA
    WHERE m.NOMBRE_MARCA = v_marca;
BEGIN
  OPEN c_precio_promedio;
  FETCH c_precio_promedio INTO v_precio_promedio;
  DBMS_OUTPUT.PUT_LINE('Precio promedio de autom�viles de marca ' || v_marca || ': ' || v_precio_promedio);
  CLOSE c_precio_promedio;
END;

--Listar los autom�viles vendidos a un cliente en particular
DECLARE
  v_cliente_id INT := 5; -- ID del cliente espec�fico
  CURSOR c_automoviles_cliente IS
    SELECT a.MODELO, a.A�O
    FROM VENTA v
    JOIN AUTOMOVIL a ON v.ID_AUTOMOVIL = a.ID_AUTOMOVIL
    WHERE v.ID_CLIENTE = v_cliente_id;
BEGIN
  FOR automovil_cliente_rec IN c_automoviles_cliente LOOP
    DBMS_OUTPUT.PUT_LINE('Autom�viles vendidos al cliente ' || v_cliente_id || ': ' || automovil_cliente_rec.MODELO || ', A�o: ' || automovil_cliente_rec.A�O);
  END LOOP;
END;

--Contar el n�mero de ventas realizadas en un mes espec�fico
DECLARE
  v_mes NUMBER := 7; -- N�mero de mes (por ejemplo, julio)
  CURSOR c_ventas_mes IS
    SELECT COUNT(*) AS NUM_VENTAS
    FROM VENTA v
    WHERE EXTRACT(MONTH FROM v.FECHA_VENTA) = v_mes;
BEGIN
  OPEN c_ventas_mes;
  FETCH c_ventas_mes INTO v_num_ventas_mes;
  DBMS_OUTPUT.PUT_LINE('N�mero de ventas en el mes ' || v_mes || ': ' || v_num_ventas_mes);
  CLOSE c_ventas_mes;
END;

--Listar los clientes que compraron autom�viles de una marca espec�fica
DECLARE
  v_marca_id INT := 2; -- ID de la marca espec�fica
  CURSOR c_clientes_marca IS
    SELECT DISTINCT c.NOMBRE, c.APELLIDO
    FROM CLIENTE c
    JOIN VENTA v ON c.ID_CLIENTE = v.ID_CLIENTE
    JOIN AUTOMOVIL a ON v.ID_AUTOMOVIL = a.ID_AUTOMOVIL
    WHERE a.ID_MARCA = v_marca_id;
BEGIN
  FOR cliente_marca_rec IN c_clientes_marca LOOP
    DBMS_OUTPUT.PUT_LINE('Clientes que compraron autom�viles de marca ' || v_marca_id || ': ' || cliente_marca_rec.NOMBRE || ' ' || cliente_marca_rec.APELLIDO);
  END LOOP;
END;
/

--Paquetes
CREATE OR REPLACE PACKAGE Cliente_Package AS
    PROCEDURE CrearCliente(
        p_nombre VARCHAR2,
        p_apellido VARCHAR2,
        p_direccion VARCHAR2,
        p_telefono VARCHAR2,
        p_correo VARCHAR2
    );

    FUNCTION LeerCliente(p_id_cliente INT) RETURN CLIENTE%ROWTYPE;

    PROCEDURE ActualizarCliente(
        p_id_cliente INT,
        p_nombre VARCHAR2,
        p_apellido VARCHAR2,
        p_direccion VARCHAR2,
        p_telefono VARCHAR2,
        p_correo VARCHAR2
    );

    PROCEDURE EliminarCliente(p_id_cliente INT);
END Cliente_Package;
/

CREATE OR REPLACE PACKAGE Distribuidor_Package AS
    PROCEDURE CrearDistribuidor(
        p_nombre VARCHAR2,
        p_direccion VARCHAR2,
        p_telefono VARCHAR2
    );

    FUNCTION LeerDistribuidor(p_id_distribuidor INT) RETURN DISTRIBUIDOR%ROWTYPE;

    PROCEDURE ActualizarDistribuidor(
        p_id_distribuidor INT,
        p_nombre VARCHAR2,
        p_direccion VARCHAR2,
        p_telefono VARCHAR2
    );

    PROCEDURE EliminarDistribuidor(p_id_distribuidor INT);
END Distribuidor_Package;
/

CREATE OR REPLACE PACKAGE Empleado_Package AS
    PROCEDURE CrearEmpleado(
        p_nombre VARCHAR2,
        p_apellido VARCHAR2,
        p_telefono VARCHAR2,
        p_correo VARCHAR2
    );

    FUNCTION LeerEmpleado(p_id_empleado INT) RETURN EMPLEADO%ROWTYPE;

    PROCEDURE ActualizarEmpleado(
        p_id_empleado INT,
        p_nombre VARCHAR2,
        p_apellido VARCHAR2,
        p_telefono VARCHAR2,
        p_correo VARCHAR2
    );

    PROCEDURE EliminarEmpleado(p_id_empleado INT);
END Empleado_Package;
/

CREATE OR REPLACE PACKAGE Color_Package AS
    PROCEDURE CrearColor(p_color VARCHAR2);

    FUNCTION LeerColor(p_id_color INT) RETURN COLOR%ROWTYPE;

    PROCEDURE ActualizarColor(p_id_color INT, p_color VARCHAR2);

    PROCEDURE EliminarColor(p_id_color INT);
END Color_Package;
/

CREATE OR REPLACE PACKAGE Marca_Package AS
    PROCEDURE CrearMarca(p_nombre_marca VARCHAR2);

    FUNCTION LeerMarca(p_id_marca INT) RETURN MARCA%ROWTYPE;

    PROCEDURE ActualizarMarca(p_id_marca INT, p_nombre_marca VARCHAR2);

    PROCEDURE EliminarMarca(p_id_marca INT);
END Marca_Package;
/
