-- VERIFICAR SI EXISTE LUEGO DE CREAR EL ROL PERSONALIZADO, NO OLVIDAR DESCONECTAR Y VOLVER A CONECTAR
SELECT * FROM C##SUCURSALES.categorias;
SELECT * FROM C##SUCURSALES.productos;

-- CREAR SINONIMOS
CREATE SYNONYM categorias FOR C##SUCURSALES.categorias; -- SINONIMO CATEGORIAS
CREATE SYNONYM productos FOR C##SUCURSALES.productos;
-- VER SINONIMOS CREADOS
SELECT * FROM USER_SYNONYMS; 

-- REVOCAR UN SINONIMO
DROP SYNONYM categorias; 

-- LUEGO YA PODRIAMOS HACER UN SELECT DIRECTO
SELECT * FROM categorias;
