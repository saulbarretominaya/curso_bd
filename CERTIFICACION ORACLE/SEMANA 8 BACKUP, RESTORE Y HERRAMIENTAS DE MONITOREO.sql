--  Tema: Respaldo y Restauración de un Esquema Completo

-- 1. Crear un esquema sucursales:
CREATE USER sucursales IDENTIFIED BY password;
GRANT CONNECT, RESOURCE TO sucursales;

-- 2. Exportar el esquema usando Data Pump: Desde la terminal:
expdp sucursales/password directory=DATA_PUMP_DIR dumpfile=sucursales_backup.dmp logfile=sucursales_backup.log schemas=sucursales
-- directory=DATA_PUMP_DIR: Especifica el directorio en el que se guardará el respaldo.
-- dumpfile=sucursales_backup.dmp: Nombre del archivo de respaldo.
-- logfile=sucursales_backup.log: Registro del proceso de exportación.

-- 3. Eliminar el esquema completo:
DROP USER sucursales CASCADE;

-- 4. Restaurar el esquema desde el respaldo: Desde la terminal:
impdp system/password directory=DATA_PUMP_DIR dumpfile=sucursales_backup.dmp logfile=sucursales_restore.log schemas=sucursales

-- 5. Verificar que el esquema y sus datos han sido recuperados:
SELECT * FROM sucursales;






