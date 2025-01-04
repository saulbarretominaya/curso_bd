-- QUE ES UN OBJETO
-- SENTENCIAS DML: INSERT, UPDATE, DELETE
-- TRANSACCIONES: COMMIT, ROOLBACK, SAVEPOINT
-- EJEMPLOS DE PLSQL

-- #1. COMMIT y ROLLBACK Básicos
-- Iniciar una transacción
START TRANSACTION;

-- Insertar un producto
INSERT INTO productos (id, nombre, precio)
VALUES (1, 'Producto A', 100);

-- Actualizar el precio de otro producto
UPDATE productos
SET precio = 200
WHERE id = 2;

-- Confirmar los cambios
COMMIT;

-- Si ocurre un error, revertir todo
ROLLBACK;

-- #2. SAVEPOINT
-- Iniciar una transacción
START TRANSACTION;

-- Primer bloque de operaciones
INSERT INTO productos (id, nombre, precio)
VALUES (3, 'Producto B', 150);

-- Crear un punto de guardado
SAVEPOINT punto1;

-- Segundo bloque de operaciones
INSERT INTO productos (id, nombre, precio)
VALUES (4, 'Producto C', 250);

-- Crear otro punto de guardado
SAVEPOINT punto2;

-- Decides deshacer los cambios desde el último punto
ROLLBACK TO punto1;

-- Confirmar los cambios restantes
COMMIT;