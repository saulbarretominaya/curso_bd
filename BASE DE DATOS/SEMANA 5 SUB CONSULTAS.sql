CREATE TABLE empleados (
    empleado_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    salario NUMBER(10, 2),
    depto_id NUMBER
);


INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (1, 'Juan Pérez', 3500, 10);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (2, 'María López', 4000, 20);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (3, 'Carlos Fernández', 2500, 10);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (4, 'Ana González', 5000, 20);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (5, 'Luis Torres', 6000, 30);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (6, 'Sofía Ramírez', 7000, 30);
INSERT INTO empleados (empleado_id, nombre, salario, depto_id) VALUES (7, 'Miguel Rojas', 4500, 10);


-- Subconsulta básica
-- Queremos listar a los empleados que ganan más que el salario promedio de todos los empleados.

SELECT nombre, salario
FROM empleados
WHERE salario > (
    SELECT AVG(salario)
    FROM empleados
);