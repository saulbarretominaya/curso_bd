-- VERIFICAR SI EXISTE, NO OLVIDAR DESCONECTAR Y VOLVER A CONECTAR
SELECT * FROM C##SUCURSALES.categorias;
SELECT * FROM C##SUCURSALES.productos;

-- SINONIMOS
CREATE SYNONYM categorias FOR C##SUCURSALES.categorias; -- CREAR SINONIMOS
SELECT * FROM USER_SYNONYMS; -- VER SINONIMOS
DROP SYNONYM categorias_sin; -- REVOCAR UN SINONIMO

-- LUEGO YA PODRIAMOS HACER UN SELECT DIRECTO
SELECT * FROM categorias;


INSERT INTO categorias (id_categoria, nombre_categoria) VALUES (1, 'Electrónica'); commit;
INSERT INTO categorias (id_categoria, nombre_categoria) VALUES (2, 'Ropa'); commit;
INSERT INTO categorias (id_categoria, nombre_categoria) VALUES (3, 'Juegos'); commit;
INSERT INTO categorias (id_categoria, nombre_categoria) VALUES (4, 'Muebles'); commit;
INSERT INTO categorias (id_categoria, nombre_categoria) VALUES (5, 'Jarras'); commit;


DELETE FROM categorias; commit;

