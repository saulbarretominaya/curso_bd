-- Teoría sobre Backup y Restore en Oracle

-- 1. Introducción
-- En la administración de bases de datos, realizar copias de seguridad (Backup) 
-- y poder recuperarlas (Restore) es fundamental para garantizar la integridad y disponibilidad
--  de la información. Oracle ofrece dos enfoques principales para el respaldo de datos:
-- a) Backup Físico (RMAN): Copia a nivel de archivos del sistema.
-- b) Backup Lógico (Data Pump - Dump): Exporta datos y metadatos en un formato legible.

-- 2. Tipos de Backup en Oracle
-- 2.1 Backup Físico (RMAN)
-- Este tipo de backup guarda todos los archivos esenciales de la base de datos, permitiendo su restauración completa en 
-- caso de fallos. Se realiza con Recovery Manager (RMAN) y abarca:
-- ✅ Datafiles (.dbf): Contienen las tablas, índices y objetos de la base de datos.
-- ✅ Control File (.ctl): Contiene la estructura de la base de datos.
-- ✅ Redo Logs (.log): Registros de transacciones recientes.
-- ✅ SPFILE (.ora): Archivo de configuración de la base de datos.
-- ✅ Archivelogs (.arc) (si la BD está en modo ARCHIVELOG): Permiten restauraciones en un punto en el tiempo.

-- 2.2 Backup Lógico (Dump - Data Pump)
-- Este tipo de backup exporta los datos y metadatos a un archivo .dmp, que luego puede importarse en otra base de datos. 
-- Se realiza con Oracle Data Pump (EXPDP/IMPDP) y abarca:
-- ✅ Esquema SUCURSALES:
    -- ✅ Tablas y usuarios.
    -- ✅ Procedimientos almacenados, funciones y triggers.
    -- ✅ Roles y privilegios asignados a los objetos exportados.

-- 3. Proceso de Backup y Restore
-- 3.1 Backup y Restore con RMAN
-- Backup Completo con RMAN
-- RMAN> BACKUP DATABASE;
-- RMAN> RESTORE DATABASE;
-- RMAN> RECOVER DATABASE;

-- 3.2 Exportación e Importación con Data Pump
-- Exportar un esquema con EXPDP
-- expdp usuario/password@base_de_datos schemas=NOMBRE_ESQUEMA dumpfile=backup.dmp logfile=backup.log
--📌 Explicación:
-- expdp: Comando para exportar datos.
-- usuario/password@base_de_datos: Usuario y conexión a la base de datos (XE, por ejemplo).
-- schemas=NOMBRE_ESQUEMA: Esquema a exportar.
-- dumpfile=backup.dmp: Archivo de salida con los datos.
-- logfile=backup.log: Archivo de registro del proceso de exportación.

-- Importar un esquema con IMPDP
-- impdp usuario/password@base_de_datos schemas=NOMBRE_ESQUEMA dumpfile=backup.dmp logfile=restore.log
-- 📌 Explicación:
-- impdp: Comando para importar datos.
-- usuario/password@base_de_datos: Usuario y base de datos de destino.
-- schemas=NOMBRE_ESQUEMA: Esquema a importar.
-- dumpfile=backup.dmp: Archivo de backup lógico a restaurar.
-- logfile=restore.log: Archivo de log de la importación.
