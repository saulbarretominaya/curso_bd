-- ¿Qué es el Pl/SQL?
-- PL/SQL es un lenguaje de programación que usa Oracle para trabajar con bases de datos.
-- A diferencia de SQL, que solo permite consultas y manipulación de datos, PL/SQL añade estructuras de programación como:
-- ✅ Variables y constantes
-- ✅ Condiciones (IF...THEN...ELSE)
-- ✅ Bucles (LOOP, WHILE, FOR)
-- ✅ Manejo de errores (EXCEPTION)
-- ✅ Procedimientos y funciones

-- Pasos para habilitar la salida en SQL Developer:
-- ✅ Ir al menú Ver (View) → Salida de DBMS.
-- ✅ En la ventana que aparece, hacer clic en el ícono de “+” (Agregar conexión).
-- ✅ Seleccionar la conexión activa y hacer clic en Aceptar.
-- ✅ Ahora, cualquier mensaje enviado con DBMS_OUTPUT.PUT_LINE aparecerá en esta ventana.


-- Diferencia entre SQL y PL/SQL
-- Ejemplo SQL (consulta simple)
SELECT '¡Hola, SQL!' FROM dual; -- Responde directamente con un resultado.

-- Ejemplo PL/SQL (bloque de código)
BEGIN
   DBMS_OUTPUT.PUT_LINE('¡Hola, PL/SQL!'); -- Necesita habilitar la salida y se ejecuta como un bloque.
END;

-- Estructura básica de un bloque PL/SQL
DECLARE  -- (Opcional) Declaración de variables
   v_mensaje VARCHAR2(50);
BEGIN    -- Contiene la lógica del programa.
   v_mensaje := '¡Hola, PL/SQL!';
   DBMS_OUTPUT.PUT_LINE(v_mensaje);
EXCEPTION  -- (Opcional) Manejo de errores
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Ocurrió un error');
END;

-- Variables y Tipos de Datos
DECLARE
   v_nombre VARCHAR2(30) := 'Juan';
   v_edad NUMBER := 25;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
   DBMS_OUTPUT.PUT_LINE('Edad: ' || v_edad);
END;

-- Estructuras de Control
DECLARE
   v_nota NUMBER := 85;
BEGIN
   IF v_nota >= 70 THEN
      DBMS_OUTPUT.PUT_LINE('Aprobado');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Reprobado');
   END IF;
END;

-- Bucle FOR
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Número: ' || i);
   END LOOP;
END;

-- Bucle WHILE
DECLARE
   v_contador NUMBER := 1;
BEGIN
   WHILE v_contador <= 3 LOOP
      DBMS_OUTPUT.PUT_LINE('Iteración: ' || v_contador);
      v_contador := v_contador + 1;
   END LOOP;
END;

-- Procedimientos y Funciones
-- Procedimiento almacenado (subprograma que no devuelve valor):
CREATE OR REPLACE PROCEDURE saludar IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('¡Hola desde un procedimiento!');
END;
-- Imprimir
BEGIN
   saludar;
END;

-- Función almacenada (devuelve un valor):
CREATE OR REPLACE FUNCTION obtener_doble(p_num NUMBER) RETURN NUMBER IS
BEGIN
   RETURN p_num * 2;
END;
-- Imprimir
DECLARE
   v_resultado NUMBER;
BEGIN
   v_resultado := obtener_doble(10);
   DBMS_OUTPUT.PUT_LINE('El doble es: ' || v_resultado);
END;