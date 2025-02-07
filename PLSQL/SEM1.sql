-- a) Instalador => https://docs.google.com/document/d/1i0mQTCcHqFbsyJZmZlNWNflNFYEX_0TdSjwU3VvjRmc/edit?usp=sharing
-- b) Errores de instalacion => https://docs.google.com/document/d/1aI5df8xnmTP1QdTgC5TdcoIYCc0c42e9pLpEPj_TgDY/edit?usp=drive_link

-- Clase.
-- 1. Usando DBCA para crear una Base de Datos Oracle 12c
    -- Opcion 1: DBCA
    -- Abre una terminal y ejecuta: dbca
    -- Sigue el asistente para crear una base de datos con los siguientes parámetros:
    -- Nombre: ORCL12C
    -- Tipo de almacenamiento: File System
    -- Juego de caracteres: AL32UTF8
    -- Contraseña: Alfanumerica no menor a 8 digitos.
    
    -- Opcion 2: Instalar SQL Developer

-- 2. Trabajando con la Metadata:  Es la información que describe la estructura, organización y características de los objetos dentro de una base de datos. Esto incluye información sobre tablas, columnas, índices, restricciones, vistas, usuarios y más.
    -- a) Información sobre la base de datos
    -- SELECT name, open_mode FROM v$database;
    -- b) Listar las tablas en el esquema del usuario
    -- SELECT table_name FROM user_tables;
    -- c) Obtener las columnas de una tabla
    -- SELECT column_name, data_type, data_length FROM user_tab_columns WHERE table_name = 'EMPLEADOS';
    -- d) Ver los índices en una tabla
    -- SELECT index_name, table_name FROM user_indexes WHERE table_name = 'EMPLEADOS';

        /*  CREATE TABLE empleados (
        id NUMBER PRIMARY KEY,
        nombre VARCHAR2(100),
        salario NUMBER
        );
        */

