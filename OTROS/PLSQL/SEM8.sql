-- ¿Qué es RMAN?
-- Recovery Manager (RMAN) es una herramienta de Oracle que permite realizar copias de seguridad (backup), 
-- recuperación (recovery) y restauración (restore) de bases de datos de manera eficiente y automatizada.

-- Tipos de Backup en RMAN
-- Backup Completo (Full Backup): Respalda toda la base de datos.
-- Backup Incremental: Solo respalda los cambios desde el último backup.
-- Backup de Archivos de Control y SPFILE: Guarda archivos críticos para la recuperación de la base de datos.
-- Backup Archivado de Redo Logs: Permite recuperar la base de datos hasta un punto específico en el tiempo.

-- ###################################################################################################################
-- Comandos Básicos de RMAN

-- Conectar a la base de datos
-- RMAN> CONNECT TARGET usuario/password@servicio;

-- Crear un backup completo
-- RMAN> BACKUP DATABASE FORMAT 'D:\backups\mi_backup_%U.bkp';

-- Listar backups realizados
-- RMAN> LIST BACKUP;

-- Verificar un backup sin restaurarlo
-- RMAN> RESTORE DATABASE VALIDATE;

-- Restaurar la base de datos
-- RMAN> RESTORE DATABASE;

-- Recuperar la base de datos después de un fallo
-- RMAN> RECOVER DATABASE;

-- ###################################################################################################################
-- NOTA: REALIZAR EL EJERCICIO QUE SE ENCUENTRA EN SU CLASSROOM, EL DOCUMENTO DE APOYO ESTA EN LA CARPETA MANUALES/RMA-ARCHIVELOG