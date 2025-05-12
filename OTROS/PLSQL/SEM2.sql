-- 1. Introducción a Tablespaces y Datafiles
-- Conceptos
CREATE TABLESPACE mi_tablespace  -- Se está creando un tablespace llamado mi_tablespace.
DATAFILE 'D:\OracleXE21\oradata\XE\mi_tablespace.dbf' -- Se especifica el archivo físico donde se almacenará el tablespace.
SIZE 100M -- Define el tamaño inicial del archivo de datos (mi_tablespace.dbf).
AUTOEXTEND ON -- Permite que el datafile crezca automáticamente cuando se llene el espacio disponible. (Si no se activa AUTOEXTEND, el archivo se quedaría con el tamaño fijo de 100MB, y cuando se llene, las operaciones que requieran más espacio fallarían.)
NEXT 10M -- Define el incremento de crecimiento del archivo cada vez que se llene. (En este caso, cuando los 100MB iniciales se agoten, Oracle agregará 10MB más al archivo automáticamente.)
MAXSIZE 500M -- Especifica el límite máximo al que puede crecer el archivo. (En este ejemplo, el archivo puede crecer hasta 500MB como máximo.)

-- ¿Y como lo creamos? 
-- Paso 1 (Creamos el TABLESPACE) - Con el usuario SYSTEM
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE TABLESPACE MI_TABLESPACE 
DATAFILE 'D:\OracleXE21\oradata\XE\mi_tablespace.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;
-- Paso 2 (Creamos el usuario y lo asignamos al TABLESPACE)
CREATE USER USUARIO_TABLESPACE IDENTIFIED BY "123" DEFAULT TABLESPACE MI_TABLESPACE;
GRANT DBA TO USUARIO_TABLESPACE; 
-- Nos conectamos con el usuario creado (SQL DEVELOPER) y creamos una tabla en el TABLESPACE
-- 1. Username: USUARIO_TABLESPACE
-- 2. Password: 123
-- 3. Hostname: localhost (o el IP de tu servidor Oracle)
-- 4. Port: 1521 (por defecto)
-- 5. Service Name: XEPDB1 ✅ (no XE ni CDB$ROOT)
CREATE TABLE mi_tabla (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50)
) TABLESPACE MI_TABLESPACE;
-- Y por ultimo validamos que la tabla este en su tablespace
SELECT table_name, tablespace_name FROM dba_tables WHERE owner = 'USUARIO_TABLESPACE';
-- Lo mismo pero con el usuario
SELECT username, default_tablespace FROM dba_users WHERE username IN ('USUARIO_TABLESPACE'); 



-- Como ver donde se encuentran los tablespace de mi ORACLE
SELECT *  FROM dba_tablespaces;
-- Que usuario fueron creados en los tablesspace
SELECT username, default_tablespace FROM dba_users WHERE username IN ('C##GLOBAL_USER', 'C##USUARIO_LOCAL'); 
-- Por si se desea eliminar el TABLESPACE
DROP TABLESPACE MI_TABLESPACE INCLUDING CONTENTS AND DATAFILES;
-- Luego me voy a RMAN y genero un backup y fin.

-- Beneficios de Administrar los Objetos en un Tablespace Propio
-- Organización → Cada usuario o aplicación puede tener su propio tablespace.
-- Facilidad de Backup → Puedes respaldar solo un tablespace sin afectar otros datos.
-- Optimización del Rendimiento → Puedes distribuir tablespaces en distintos discos.
-- Control de Espacio → Puedes asignar cuotas para evitar que un usuario consuma todo el almacenamiento.



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


-- #####TODO EJECUTARLO EN EL SYSTEM (CREACION DE USUARIO SIN TABLESPACE)
-- PRIMER PASO
SHOW CON_NAME; -- Ves la sesion actual de la BD.
ALTER SESSION SET CONTAINER = CDB$ROOT; 
CREATE USER C##GLOBAL_USER  IDENTIFIED BY "123"; -- Creamos el usuario
GRANT DBA TO C##GLOBAL_USER CONTAINER=ALL; -- Le asignamos permisos
SELECT * FROM dba_tablespaces; -- Ver los tablespace creados
SELECT username,default_tablespace FROM dba_users WHERE username = 'C##GLOBAL_USER';  -- En que tablespace fue creado el usuario

-- SEGUNDO PASO
SHOW CON_NAME; -- Ves la sesion actual de la BD.
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER USUARIO_LOCAL IDENTIFIED BY "123";
GRANT DBA TO USUARIO_LOCAL;
-- Aqui vemos diferencia de crear ambos usuarios
-- 1. Primera diferencia, COMMON = YES → Usuario creado en CDB$ROOT con C## en su nombre, disponible en todas las PDBs.\ COMMON = NO → Usuario creado en una PDB específica, solo existe en esa PDB.
SELECT username, common FROM dba_users WHERE username IN ('C##GLOBAL_USER', 'USUARIO_LOCAL'); 
-- 2. Crea una tabla test_global y trata de conectarte con el otro usuario y accedar a su objeto, tiene que salir ERRROR.
SELECT * FROM C##GLOBAL_USER.test_global;





-- ################################################################################################################
-- UNIONES DE TABLAS
-- UNION: ELIMINA DATOS DUPLICADOS Y OCASIONA ERRORES SI SON DE DIFERENTES TIPO DE DATOS Y DIFERENTE ORDEN 
SELECT 'GATO' AS ANIMALES FROM dual
UNION
SELECT 'GATO' FROM dual;

-- UNION ALL: NO ELIMINA DATOS REPETIDOS
SELECT 'GATO' AS ANIMALES FROM dual
UNION ALL
SELECT 'GATO' FROM dual;

-- INTERSECT: MUESTA SI TIENEN DATOS IGUALES, PARECIO A UN JOIN, SINO VACIO
SELECT 'SOL' AS ANIMALES FROM dual
INTERSECT
SELECT 'ESTRELLA' FROM dual;

-- MINUS: MUESTRA EL PRIMER SELECT SI SON DIFERENTES, SI SON IGUALES VACIO
SELECT 'SOL' AS OBJETO FROM dual
MINUS
SELECT 'LUNA' FROM dual;
