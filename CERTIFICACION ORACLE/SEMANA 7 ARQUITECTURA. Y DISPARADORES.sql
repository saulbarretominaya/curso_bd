-- ARQUITECTURA DE ORACLE
-- ¿Qué es la arquitectura STANDALONE?
-- Arquitectura donde una única instancia de base de datos corre en un solo servidor, adecuada para aplicaciones pequeñas o con baja carga.

-- ¿Qué es la arquitectura RAC?
-- Permite que varias instancias de base de datos en diferentes servidores accedan a la misma base de datos, ofreciendo alta disponibilidad y escalabilidad.

-- ¿Cómo se administra la memoria y los procesos de usuario?
-- SGA: Memoria compartida que contiene información global como la caché de SQL y buffers de datos.
-- PGA: Memoria privada para cada sesión de usuario, donde se guardan los datos temporales de esa sesión.

-- ¿Qué acciones realiza la SHARED POOL?
-- Parte del SGA que guarda información reutilizable, como consultas SQL y definiciones de objetos de base de datos.

-- ¿Qué será la DATABASE CACHE?
-- Parte del SGA donde se almacenan las páginas de datos leídas de la base de datos, mejorando el rendimiento al evitar lecturas desde el disco.

-- ¿Y la PGA qué es?
-- PGA: Almacena datos temporales y específicos de cada sesión de usuario, ayudando a optimizar la ejecución de consultas.

-- En resumen, la arquitectura de Oracle se organiza para optimizar la memoria, la disponibilidad y el rendimiento en la gestión de bases de datos.


CREATE OR REPLACE TRIGGER trg_clientes 
    BEFORE INSERT ON clientes
    FOR EACH ROW 
    BEGIN
        INSERT INTO auditoria_clientes (id_cliente, nombre, ape_materno, ape_paterno, accion )
        VALUES(:NEW.id_cliente, :NEW.nombre, :NEW.ape_materno, :NEW.ape_paterno, 'INSERT');
    END
;

insert into clientes (id_cliente,nombre,ape_materno,ape_paterno) values ('13','Pedro','Lopez','Muñoz');


