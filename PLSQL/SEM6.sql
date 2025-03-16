-- EJERCICIO PRACTICO DE USO DE BACKUP LOGICO (USO DE DATA PUMP)

-- CREACION DE USUARIO CON SYSTEM
CREATE USER C##SUCURSALES IDENTIFIED BY "123";
GRANT DBA TO C##SUCURSALES; 

-- CREACION DE TABLAS
create table categorias (
   id_categoria     number primary key,
   nombre_categoria varchar2(100),
   desc_categoria   varchar2(500)
)
/
create table productos (
   id_producto     number primary key,
   nombre_producto varchar2(100),
   id_categoria    number,
   constraint fk_id_categoria foreign key ( id_categoria )
      references categorias ( id_categoria )
)
/
-- INSERCION
INSERT ALL
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (1, 'TV', 'Televisores pequeños y portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (2, 'Micro', 'Microondas compactos y eficientes')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (3, 'Plancha', 'Planchas para ropa de tamaño portátil')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (4, 'Radio', 'Radios AM/FM compactos y portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (5, 'Tostador', 'Tostadoras para pan pequeñas y prácticas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (6, 'Licuadora', 'Licuadoras portátiles para jugos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (7, 'Exprimidor', 'Exprimidores de cítricos de mano')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (8, 'Ventilador', 'Ventiladores personales y de mesa')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (9, 'Cafetera', 'Cafeteras de 1 o 2 tazas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (10, 'Aspirador', 'Aspiradoras de mano para limpieza ligera')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (11, 'Batidora', 'Batidoras de repostería pequeñas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (12, 'Secador', 'Secadores de cabello portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (13, 'Calefactor', 'Calefactores eléctricos personales')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (14, 'Freezer', 'Freezers pequeños para oficinas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (15, 'Sandwich', 'Sandwicheras portátiles y prácticas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (16, 'Reproductor', 'Reproductores multimedia portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (17, 'Termo', 'Termos eléctricos para café o té')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (18, 'Rizador', 'Rizadores de cabello de viaje')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (19, 'Lámpara', 'Lámparas LED recargables')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (20, 'Foco', 'Focos inteligentes pequeños')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (21, 'Cortador', 'Cortadores de alimentos eléctricos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (22, 'Extractor', 'Extractores de jugos pequeños')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (23, 'Calentador', 'Calentadores de agua de viaje')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (24, 'Mezclador', 'Mezcladores de alimentos compactos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (25, 'Purificador', 'Purificadores de aire personales')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (26, 'Enfriador', 'Enfriadores de aire compactos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (27, 'Procesador', 'Procesadores de alimentos pequeños')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (28, 'Molino', 'Molinos de café portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (29, 'Deshum', 'Deshumidificadores para habitaciones')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (30, 'Estufa', 'Estufas eléctricas compactas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (31, 'Cortapelo', 'Cortapelos eléctricos recargables')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (32, 'PlanchaV', 'Planchas verticales de vapor')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (33, 'MiniBar', 'Mini refrigeradores para bebidas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (34, 'Grill', 'Parrillas eléctricas pequeñas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (35, 'Olla', 'Ollas eléctricas de cocción lenta')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (36, 'Freidora', 'Freidoras de aire compactas')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (37, 'Campana', 'Campanas extractoras portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (38, 'Hervidor', 'Hervidores de agua eléctricos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (39, 'Repetidor', 'Repetidores Wi-Fi compactos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (40, 'Proyector', 'Proyectores portátiles multimedia')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (41, 'Scanner', 'Escáneres portátiles de documentos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (42, 'Lupa', 'Lupas electrónicas recargables')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (43, 'Grabador', 'Grabadores de voz compactos')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (44, 'Medidor', 'Medidores láser para distancias')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (45, 'Reloj', 'Relojes despertadores digitales')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (46, 'Audifono', 'Audífonos inalámbricos pequeños')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (47, 'Altavoz', 'Altavoces Bluetooth portátiles')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (48, 'Control', 'Controles remotos universales')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (49, 'Linterna', 'Linternas LED recargables')
    INTO categorias (id_categoria, nombre_categoria, desc_categoria) VALUES (50, 'Cargador', 'Cargadores rápidos y compactos')
SELECT 1 FROM DUAL; 
COMMIT;
/
INSERT ALL
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (1, 'TV LED 32"', 1)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (2, 'TV Smart 40"', 1)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (3, 'Monitor 24"', 1)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (4, 'Proyector HD', 1)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (5, 'Repetidor Wi-Fi', 1)

    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (6, 'Microondas 20L', 2)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (7, 'Horno Eléctrico', 2)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (8, 'Freidora Aire', 2)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (9, 'Olla Lenta', 2)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (10, 'Tostador Doble', 2)

    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (11, 'Licuadora 2 Vel.', 3)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (12, 'Batidora Portátil', 3)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (13, 'Procesador Alim.', 3)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (14, 'Exprimidor Eléc.', 3)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (15, 'Extractor Zumo', 3)

    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (16, 'Ventilador Mesa', 4)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (17, 'Purificador Aire', 4)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (18, 'Calefactor Pers.', 4)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (19, 'Enfriador Aire', 4)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (20, 'Deshumidificador', 4)

    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (21, 'Secador Cabello', 5)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (22, 'Rizador Portátil', 5)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (23, 'Cortapelo Rec.', 5)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (24, 'Plancha Vapor', 5)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (25, 'Plancha Vertical', 5)

    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (26, 'Cafetera 2 Tazas', 6)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (27, 'Molino Café', 6)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (28, 'Hervidor Agua', 6)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (29, 'Mezclador Mini', 6)
    INTO productos (id_producto, nombre_producto, id_categoria) VALUES (30, 'Termo Eléctrico', 6)
SELECT 1 FROM DUAL;
COMMIT;
/
-- CREAMOS UN PROCEDIMIENTO ALMACENADO
create or replace procedure proc_insertar_categorias (
   p_id_categoria     in number,
   p_nombre_categoria in varchar2,
   p_desc_categoria   in varchar2
   ) is
begin
   insert into categorias (id_categoria,nombre_categoria,desc_categoria) 
   values (p_id_categoria,p_nombre_categoria,p_desc_categoria);
   commit;
end;
/
begin
   proc_insertar_categorias(51,'Reposteros','Reportero de 4x4, color marrón');
   proc_insertar_categorias(52,'Mesa','Mesa de plastico');
end;
/
-- CREAMOS UN PAQUETE
CREATE OR REPLACE PACKAGE pkg_categorias AS
   PROCEDURE proc_insertar_categorias (p_id_categoria NUMBER,p_nombre_categoria VARCHAR2,p_desc_categoria VARCHAR2);
END pkg_categorias;
/
CREATE OR REPLACE PACKAGE BODY pkg_categorias AS
  PROCEDURE proc_insertar_categorias (
    p_id_categoria     NUMBER,
    p_nombre_categoria VARCHAR2,
    p_desc_categoria   VARCHAR2
    ) IS
  BEGIN
    INSERT INTO categorias (id_categoria, nombre_categoria, desc_categoria) 
    VALUES (p_id_categoria, p_nombre_categoria, p_desc_categoria);
    COMMIT;
  END proc_insertar_categorias;
END pkg_categorias;
/
BEGIN
  pkg_categorias.proc_insertar_categorias(53, 'Categoria A', 'Descripción A');
END;

-- ################################################################################################################
-- (OPCIONES PARA REALIZAR COPIAS DE SEGURIDAD)
-- 1 OPCION (POR SQL DEVELOPER)
-- SELECCIONAR EL OBJETO, EJEMPLO UNA TABLA
-- CLIC DERECHO, EXPORTAR

-- 2 OPCION (POR QUERY)
-- Crear usuarios (si es necesario)
SELECT DBMS_METADATA.GET_DDL('USER', USERNAME) FROM DBA_USERS;

-- Crear secuencias
SELECT DBMS_METADATA.GET_DDL('SEQUENCE', SEQUENCE_NAME, 'NOMBRE_ESQUEMA') FROM USER_SEQUENCES;

-- Crear tablas
SELECT DBMS_METADATA.GET_DDL('TABLE', TABLE_NAME, 'NOMBRE_ESQUEMA') FROM USER_TABLES;

-- Crear restricciones referenciales (Claves foráneas)
SELECT DBMS_METADATA.GET_DDL('REF_CONSTRAINT', CONSTRAINT_NAME, 'NOMBRE_ESQUEMA') FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'R';

-- Crear índices
SELECT DBMS_METADATA.GET_DDL('INDEX', INDEX_NAME, 'NOMBRE_ESQUEMA') FROM USER_INDEXES;

-- Crear vistas
SELECT DBMS_METADATA.GET_DDL('VIEW', VIEW_NAME, 'NOMBRE_ESQUEMA') FROM USER_VIEWS;

-- Crear paquetes, procedimientos y funciones
SELECT DBMS_METADATA.GET_DDL('PACKAGE', OBJECT_NAME, 'NOMBRE_ESQUEMA') FROM USER_PROCEDURES WHERE OBJECT_TYPE = 'PACKAGE';
SELECT DBMS_METADATA.GET_DDL('PROCEDURE', OBJECT_NAME, 'NOMBRE_ESQUEMA') FROM USER_PROCEDURES WHERE OBJECT_TYPE = 'PROCEDURE';
SELECT DBMS_METADATA.GET_DDL('FUNCTION', OBJECT_NAME, 'NOMBRE_ESQUEMA') FROM USER_PROCEDURES WHERE OBJECT_TYPE = 'FUNCTION';

-- Crear triggers
SELECT DBMS_METADATA.GET_DDL('TRIGGER', TRIGGER_NAME, 'NOMBRE_ESQUEMA') FROM USER_TRIGGERS;

-- Crear sinónimos
SELECT DBMS_METADATA.GET_DDL('SYNONYM', SYNONYM_NAME, 'NOMBRE_ESQUEMA') FROM USER_SYNONYMS;


-- 3. OPCION (POR LA TERMINAL DE WINDOWS O POWERSHELL)
-- 📌 Ubicación de los archivos y ejecución
-- Ruta por defecto de Data Pump en Oracle XE 21c: D:\ORACLEXE21\ADMIN\XE\DPDUMP\ 
-- Clic derecho y abrir en Terminal

-- (ESTO SOLO TE TRAERA ESTRUCTURA)
-- Paso 1: Exportar la base de datos (Solo estructura) a un archivo .dmp
-- expdp C##SUCURSALES/123@XE schemas=C##SUCURSALES dumpfile=backup.dmp logfile=backup.log
-- Paso 2: Convertir el .dmp en un archivo .sql 
-- impdp C##SUCURSALES/123@XE dumpfile=backup.dmp sqlfile=backup.sql

-- (ESTO TE TRAERA ESTRUCTURA MAS DATOS, ES LO RECOMENDADO)
-- expdp C##SUCURSALES/123@XE schemas=C##SUCURSALES dumpfile=backup1.dmp logfile=backup1.log CONTENT=ALL EXCLUDE=USER
-- impdp C##TEST/123@XE dumpfile=backup1.dmp logfile=restore.log REMAP_SCHEMA=C##SUCURSALES:C##TEST
-- SELECT * FROM ALL_TABLES WHERE OWNER = 'C##TEST'; (Por ultimo validar con el usuario C##TEST)



