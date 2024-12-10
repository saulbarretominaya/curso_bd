-- Introducción al Lenguaje DDL en Oracle

-- CREATE
-- Este comando crea un objeto dentro de la base de datos. Puede ser una tabla, vista, índice, trigger, función, procedimiento o cualquier otro objeto que el motor de la base de datossoporte.

-- ALTER
-- Este comando permite modificar la estructura de un objeto. Se pueden agregar/quitar campos a una tabla, modificar el tipo de un campo, agregar/quitar índices a una tabla, modificar un trigger, etc.

-- RENAME
-- Cambia el nombre a una tabla, vista, secuencia o sinónimo privado.

-- DROP
-- Este comando elimina un objeto de la base de datos. Puede ser una tabla, vista, índice, trigger, función, procedimiento o cualquier otro objeto que el motor de la base de datos soporte. Se puede combinar con la sentencia ALTER.

-- TRUNCATE
-- Este comando trunca todo el contenido de una tabla. La ventaja sobre el comando DROP es que si se quiere
-- borrar todo el contenido de la tabla, es mucho más rápido, especialmente si la tabla es muy grande. La
-- desventaja es que TRUNCATE sólo sirve cuando se quiere eliminar absolutamente todos los registros, ya que
-- no se permite la cláusula WHERE. Si bien, en un principio, esta sentencia parecería ser DML (Lenguaje de
-- Manipulación de Datos), es en realidad una DDL, ya que internamente, el comando TRUNCATE borra la tabla
-- y la vuelve a crear y no ejecuta ninguna transacción.