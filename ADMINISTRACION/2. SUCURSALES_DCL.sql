-- CUALES SON: GRANT, REVOKE 

-- CREACION DE USUARIOS
CREATE USER C##SISE_CO IDENTIFIED BY "123";
CREATE USER C##SISE_SM IDENTIFIED BY "123";
CREATE USER C##SISE_PP IDENTIFIED BY "123";


-- OTORGAR PRIVILEGIOS  LOS NUEVOS USUARIOS PERO NO COMO DBA
GRANT CREATE SESSION TO C##SISE_CO;  -- Permite iniciar sesión
GRANT CREATE TABLE TO C##SISE_CO;    -- Permite crear tablas
GRANT CREATE PROCEDURE TO C##SISE_CO; -- Permite crear procedimientos almacenados
GRANT CREATE TRIGGER TO C##SISE_CO;  -- Permite crear triggers
GRANT CREATE VIEW TO C##SISE_CO;     -- Permite crear vistas  
GRANT CREATE SYNONYM TO C##SISE_CO;  -- Para que pueda crear sinonimos
GRANT ALL ON C##SISE_CO.categorias TO C##SISE_CO; -- ESTO ES POR SI EL USUARIO SISE, DESEA (INSERT, DELETE, UPDATE) LAS TABLAS DE SUCURSAL


-- CREAMOS ROLES PERSONALIZADOS, PERO ANTES DEBEN ESTAR CREADO LAS OBJETOS
CREATE ROLE C##ACCESO_OBJETOS;
-- PERMISOS SOBRE TABLAS Y VISTAS 
GRANT SELECT, INSERT, UPDATE, DELETE ON C##SUCURSALES.categorias TO C##ACCESO_OBJETOS;
GRANT SELECT, INSERT, UPDATE, DELETE ON C##SUCURSALES.productos TO C##ACCESO_OBJETOS;
-- Permisos sobre procedimientos y funciones (Investigar Jovenes - Tarea)
-- Permisos sobre triggers (Investigar Jovenes Tarea)


-- COMO VER LOS ROLES CREADOS
SELECT * FROM DBA_ROLES WHERE ROLE = 'C##ACCESO_OBJETOS';


--POR ULTIMO LE OTORGAMOS EL ROL
GRANT C##ACCESO_OBJETOS TO C##SISE_CO;

-- ELIMINAR ROL
DROP ROLE C##ACCESO_OBJETOS;

-- SI SE DESEA ELIMINAR EL USUARIO  (NO APLICA DELETE PORQUE ES UNA VISTA DE SOLO LECTURA Y NO UNA TABLA)
DROP USER C##SISE_SM CASCADE;

-- REVOCAR TODOS LOS PERMISOS
REVOKE CREATE SESSION FROM C##SISE_CO;
REVOKE CREATE TABLE FROM C##SISE_CO;
REVOKE CREATE PROCEDURE FROM C##SISE_CO;
REVOKE CREATE TRIGGER FROM C##SISE_CO;
REVOKE CREATE VIEW FROM C##SISE_CO;
REVOKE CREATE USER FROM C##SISE_CO;
-- CONSULTAR PRIVILEGIOS
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'C##SISE_CO';