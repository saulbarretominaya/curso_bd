-- CREAR LA VISTA GENERO
CREATE VIEW VISTA_PARAMETROS_GENERO AS 
    SELECT
        depa.codigo,
        depa.descripcion
    FROM parametros pa
    JOIN detalle_parametros depa ON depa.id_parametro=pa.id_parametro
    WHERE pa.codigo='001'
;
SELECT * FROM VISTA_PARAMETROS_GENERO; -- VALIDAMOS


-- CREAR LA VISTA TIPO DOCUMENTO
CREATE VIEW VISTA_PARAMETROS_TIPO_DOCUMENTO AS 
    SELECT
        depa.codigo,
        depa.descripcion
    FROM parametros pa
    JOIN detalle_parametros depa ON depa.id_parametro=pa.id_parametro
    WHERE pa.codigo='002'
;
SELECT * FROM VISTA_PARAMETROS_TIPO_DOCUMENTO; -- VALIDAMOS


-- CREAR LA VISTA CARGO
CREATE VIEW VISTA_PARAMETROS_CARGOS AS 
    SELECT
        depa.codigo,
        depa.descripcion
    FROM parametros pa
    JOIN detalle_parametros depa ON depa.id_parametro=pa.id_parametro
    WHERE pa.codigo='003'
;
SELECT * FROM VISTA_PARAMETROS_CARGOS; -- VALIDAMOS


-- CREAR LA VISTA TIPO MONEDA
CREATE VIEW VISTA_PARAMETROS_TIPO_MONEDA AS 
    SELECT
        depa.codigo,
        depa.descripcion
    FROM parametros pa
    JOIN detalle_parametros depa ON depa.id_parametro=pa.id_parametro
    WHERE pa.codigo='004'
;
SELECT * FROM VISTA_PARAMETROS_TIPO_MONEDA; -- VALIDAMOS


-- CREAR LA VISTA ESTADO CIVIL
CREATE VIEW VISTA_PARAMETROS_ESTADO_CIVIL AS 
    SELECT
        depa.codigo,
        depa.descripcion
    FROM parametros pa
    JOIN detalle_parametros depa ON depa.id_parametro=pa.id_parametro
    WHERE pa.codigo='005'
;
SELECT * FROM VISTA_PARAMETROS_ESTADO_CIVIL; -- VALIDAMOS


-- EJERCICIO 
-- REALIZAR UN ALTER TABLE A LA TABLA PRODUCTOS Y AGREGAR LA COLUMNA PRECIO_COSTO, LUEGO CREAR UNA VISTA INCLUYENDO EL 10% ADICIONAL AL PRECIO DE COSTO DE TODOS LOS PRODUCTOS.
-- MOSTRAR LOS SIGUIENTE CAMPOS EN LA VISTA: NOMBRE PRODUCTO, PRECIO COSTO Y PRECIO VENTA.
