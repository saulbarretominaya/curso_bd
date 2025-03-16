-- ¿Qué es un Cron Job?
-- Un Cron Job es una tarea programada que se ejecuta automáticamente en un intervalo de tiempo definido.

-- ¿Qué es DBMS_SCHEDULER en Oracle?
-- DBMS_SCHEDULER es un paquete de Oracle que permite la creación, administración y control de tareas programadas (jobs) dentro de la base de datos. 

-- Componentes clave de un Job en DBMS_SCHEDULER
-- a)  job_name → Nombre único del job.
-- b)  job_type → Tipo de tarea que se ejecutará. Puede ser:
-- c)  'PLSQL_BLOCK' (bloque PL/SQL anónimo)
-- d)  'STORED_PROCEDURE' (procedimiento almacenado)
-- e)  'EXECUTABLE' (ejecutable en el sistema operativo)
-- f)  job_action → Código a ejecutar (PL/SQL o procedimiento).
-- g)  start_date → Fecha y hora en que iniciará el job.
-- h)  repeat_interval → Frecuencia de ejecución (minutos, horas, días, etc.).
-- i)  enabled → Si el job está activado (TRUE) o no (FALSE).


-- Ejemplo de un Cron Job en Oracle

-- 1. Crear una tabla para registrar la ejecución:
    DROP TABLE job_logs;
    CREATE TABLE job_logs (
        id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        mensaje VARCHAR2(100),
        fecha TIMESTAMP DEFAULT SYSTIMESTAMP
    );

-- 2. Crear un Job que inserte registros cada minuto:
    BEGIN
        DBMS_SCHEDULER.create_job (
            job_name        => 'JOB_HOLA_MUNDO',
            job_type        => 'PLSQL_BLOCK',
            job_action      => 'BEGIN INSERT INTO job_logs (mensaje) VALUES (''Hola, este es un Cron Job!''); COMMIT; END;',
            start_date      => SYSTIMESTAMP,
            repeat_interval => 'FREQ=SECONDLY; INTERVAL=1',  -- Cada 1 segundo
            --        repeat_interval => 'FREQ=MINUTELY; INTERVAL=1',  -- Cada 1 minuto
            enabled         => TRUE
        );
    END;

-- 3. Consultar los logs para verificar la ejecución:
    SELECT * FROM job_logs ORDER BY id;

-- ########################################################################################################################################################
-- Eliminar el Job cuando ya no sea necesario: 
BEGIN
    DBMS_SCHEDULER.drop_job('JOB_HOLA_MUNDO');
END;

-- Pausar (Detener temporalmente) un Job
BEGIN
    DBMS_SCHEDULER.disable('JOB_HOLA_MUNDO');
END;

-- Reanudar un Job pausado
BEGIN
    DBMS_SCHEDULER.enable('JOB_HOLA_MUNDO');
END;

-- 3. Verificar el Estado del Job
SELECT job_name, state FROM dba_scheduler_jobs WHERE job_name = 'JOB_HOLA_MUNDO';

-- SCHEDULED	=> El job está habilitado y esperando su próximo tiempo de ejecución.
-- RUNNING	    => El job está ejecutándose en este momento.
-- DISABLED	    => El job está pausado (no se ejecutará hasta que se habilite de nuevo).
-- FAILED	    => Hubo un error en la ejecución del job.
-- COMPLETED	=> El job terminó de ejecutarse y no está programado para repetirse.

-- #################################################################################################################################
-- ARCHI LOGS
-- ¿Qué es ARCHIVELOG en Oracle?
-- El principal objetivo de usar ARCHIVELOG en Oracle es garantizar la recuperación completa de la base de datos en caso de fallos, 
-- minimizando la pérdida de datos.

-- ¿Cómo verificar el estado de ARCHIVELOG?
-- ARCHIVE LOG LIST; o SELECT LOG_MODE FROM V$DATABASE;
-- Si dice "Modo de Archivado: Activado", la base está en ARCHIVELOG.
-- Si dice "Modo de No Archivado", la base está en NOARCHIVELOG.

-- Usuarios con permisos para cambiar ARCHIVELOG (Se recomienda hacer por sql plus)
-- El usuario SYSDBA es el único que puede modificar el modo ARCHIVELOG.
-- sqlplus / as sysdba

-- Poner en Modo ARCHIVELOG:
-- SHUTDOWN IMMEDIATE;
-- STARTUP MOUNT;
-- ALTER DATABASE ARCHIVELOG;
-- ALTER DATABASE OPEN;

-- Poner en Modo NOARCHIVELOG:
-- SHUTDOWN IMMEDIATE;
-- STARTUP MOUNT;
-- ALTER DATABASE NOARCHIVELOG;
-- ALTER DATABASE OPEN;