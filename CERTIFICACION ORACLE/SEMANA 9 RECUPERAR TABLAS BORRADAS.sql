-- Tema: Recuperación de Tablas y Esquemas en Oracle
-- Objetivos de la Clase:
-- Aprender a recuperar tablas eliminadas utilizando la papelera (Recycle Bin).
-- Realizar respaldos de esquemas completos con Data Pump.
-- Restaurar un esquema eliminado a partir de un respaldo.

-- 1. Crear una tabla en un esquema existente:
CREATE TABLE sucursales (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    ciudad VARCHAR2(100),
    empleados NUMBER
);

INSERT INTO sucursales VALUES (1, 'Sucursal Centro', 'Lima', 50);
INSERT INTO sucursales VALUES (2, 'Sucursal Sur', 'Arequipa', 30);
INSERT INTO sucursales VALUES (3, 'Sucursal Norte', 'Trujillo', 40);
COMMIT;

-- 2 Eliminar la tabla y verificar que está en la papelera:
DROP TABLE sucursales;
SELECT object_name, original_name FROM recyclebin;

-- 3 Recuperar la tabla desde la papelera:
FLASHBACK TABLE sucursales TO BEFORE DROP;

-- 4. Eliminación permanente de una tabla (sin posibilidad de recuperación):
DROP TABLE sucursales PURGE;


