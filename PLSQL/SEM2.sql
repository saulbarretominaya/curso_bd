-- 1. Introducción a Tablespaces y Datafiles
-- Conceptos
CREATE TABLESPACE mi_tablespace  -- Se está creando un tablespace llamado mi_tablespace.
DATAFILE 'D:\OracleXE21\oradata\XE\mi_tablespace.dbf' -- Se especifica el archivo físico donde se almacenará el tablespace.
SIZE 100M -- Define el tamaño inicial del archivo de datos (mi_tablespace.dbf).
AUTOEXTEND ON -- Permite que el datafile crezca automáticamente cuando se llene el espacio disponible. (Si no se activa AUTOEXTEND, el archivo se quedaría con el tamaño fijo de 100MB, y cuando se llene, las operaciones que requieran más espacio fallarían.)
NEXT 10M -- Define el incremento de crecimiento del archivo cada vez que se llene. (En este caso, cuando los 100MB iniciales se agoten, Oracle agregará 10MB más al archivo automáticamente.)
MAXSIZE 500M -- Especifica el límite máximo al que puede crecer el archivo. (En este ejemplo, el archivo puede crecer hasta 500MB como máximo.)

-- ¿Y como lo creamos?
CREATE TABLESPACE mi_tablespace 
DATAFILE 'D:\OracleXE21\oradata\XE\mi_tablespace.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- ¿Qué es un CDB y un PDB en Oracle?
-- Desde Oracle 12c, la base de datos tiene una arquitectura multitenant. Esto significa que hay dos niveles de bases de datos:

-- 1. Container Database (CDB)
-- Es la base de datos raíz donde se gestionan los usuarios comunes y la estructura global.
-- Se identifica como CDB$ROOT.
-- Permite crear usuarios comunes (prefijo C##).
-- Se usa para administrar toda la instancia.

-- 2. Pluggable Database (PDB) 
-- Es una base de datos independiente dentro del CDB.
-- Se comporta como una base de datos normal y contiene sus propios objetos (tablas, usuarios, etc.).
-- En este caso, la PDB se llama XEPDB1.
-- Los usuarios que crees aquí NO pueden llevar el prefijo C##.
-- Es una base de datos independiente dentro del CDB.
-- Se comporta como una base de datos normal y contiene sus propios objetos (tablas, usuarios, etc.).
-- En este caso, la PDB se llama XEPDB1.
-- Los usuarios que crees aquí NO pueden llevar el prefijo C##.

-- Ves la sesion actual de la BD.
SHOW CON_NAME;
-- opcion 1
ALTER SESSION SET CONTAINER = CDB$ROOT;
CREATE USER C##GLOBAL_USER IDENTIFIED BY "123";
GRANT DBA TO C##GLOBAL_USER CONTAINER=ALL;
-- opcion 2
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER USUARIO_LOCAL IDENTIFIED BY "123";
GRANT DBA TO USUARIO_LOCAL;

-- ###########################################################
-- Al crear la conexión en SQL Developer, revisa estos campos:
-- 1. Username: usuario_local
-- 2. Password: 123
-- 3. Hostname: localhost (o el IP de tu servidor Oracle)
-- 4. Port: 1521 (por defecto)
-- 5. Service Name: XEPDB1 ✅ (no XE ni CDB$ROOT)