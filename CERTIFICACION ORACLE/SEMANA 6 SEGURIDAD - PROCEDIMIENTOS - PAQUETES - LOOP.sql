-- SEGURIDAD EN ORACLE: 
    -- PERFILES: ADMINISTRADOR DE SISTEMAS, ADMINISTRADOR DE USUARIOS, ANALISTA MARKETING
    -- ROLES: ROL AD-USERS, ROL AD-TABLES, ROL QUERY-TABLES
-- CREACION DE CUENTAS
    --CREATE USER, GRANT, CREATE ROLE, CREATE PROFILE

    
-- REALIZAR UN INSERT UTILIZANDO PROCEDIMIENTOS ALMACENADOS Y SEQUENCIA.
create or replace procedure proc_insertar_clientes (
   p_id_cliente  in number,
   p_nombre      in varchar2,
   p_ape_paterno in varchar2,
   p_ape_materno in varchar2
) is
begin
   insert into clientes (id_cliente,nombre,ape_paterno,ape_materno) 
   values (p_id_cliente,p_nombre,p_ape_paterno,p_ape_materno );
   commit;
end;

-- REGISTRAR PROCEDIMIENTOS MODO PL/SQL
begin
   proc_insertar_clientes(1,'Pedro','Lopez','Risco');
   proc_insertar_clientes(2,'Juan','Martinez','Soto');
   proc_insertar_clientes(3,'Luis','Lopez','Ramirez');
end;

-- #########################################################################################################################################################################

-- AHORA, AGRUPARLO EN UN PAQUETE
CREATE OR REPLACE PACKAGE pkg_clientes AS
   PROCEDURE proc_insertar_clientes (p_id_cliente  number, p_nombre varchar2, p_ape_paterno varchar2,p_ape_materno varchar2);
    procedure proc_actualizar_clientes(p_id_cliente number, p_nombre varchar2, p_ape_paterno varchar2, p_ape_materno varchar2);
END pkg_clientes;

create or replace package body pkg_clientes as
   
   -- SP_INSERT
   procedure proc_insertar_clientes (
      p_id_cliente  number,
      p_nombre      varchar2,
      p_ape_paterno varchar2,
      p_ape_materno varchar2
   ) is
   begin
      insert into clientes (id_cliente,nombre,ape_paterno,ape_materno)
      values (p_id_cliente, p_nombre, p_ape_paterno, p_ape_materno);
      commit;
   end proc_insertar_clientes;

   -- SP_UPDATE
   procedure proc_actualizar_clientes(
      p_id_cliente  number,
      p_nombre      varchar2,
      p_ape_paterno varchar2,
      p_ape_materno varchar2
   )is
   begin
         update clientes set nombre = p_nombre, ape_paterno = p_ape_paterno, ape_materno = p_ape_materno
         where id_cliente = p_id_cliente;
         commit;
   end proc_actualizar_clientes;

end pkg_clientes;

-- ELIMINAR PAQUETES
drop package body pkg_clientes;

-- REGISTRAR UN PROCEDIMIENTO DENTRO DE UN PAQUETES MODO PL/SQL
BEGIN
   pkg_clientes.proc_insertar_clientes(4, 'Pedro', 'Lopez', 'Risco');
   pkg_clientes.proc_insertar_clientes(5, 'Juan', 'Martinez', 'Soto');
END;
-- ACTUALIZAR UN PROCEDIMIENTO DENTRO DE UN PAQUETES MODO PL/SQL
BEGIN
   pkg_clientes.proc_actualizar_clientes(4, 'Pedro', 'Lopez', 'Risco');
   pkg_clientes.proc_actualizar_clientes(5, 'Juan', 'Martinez', 'Soto');
END;

-- SI DESEAMOS IMPRIMIR
-- DBMS_OUTPUT.PUT_LINE('Hola Mundo');

CREATE OR REPLACE PROCEDURE proc_listar_clientes IS
   v_nombre clientes.nombre%TYPE;
BEGIN

   SELECT nombre 
   INTO v_nombre 
   FROM clientes;
   -- IMPRIMIMOS
   DBMS_OUTPUT.PUT_LINE('Nombre del cliente: ' || v_nombre);

   -- MANEJAMOS ERRORES
   EXCEPTION
   WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('Error desconocido: ' || SQLERRM);

END;


-- MANEJANDO CURSORES
CREATE OR REPLACE PROCEDURE proc_listar_clientes IS
   v_cursor SYS_REFCURSOR;
   v_nombre clientes.nombre%TYPE;
BEGIN
   OPEN v_cursor FOR SELECT nombre FROM clientes;

   LOOP
      FETCH v_cursor INTO v_nombre;
      
      -- Verificamos si se han encontrado registros
      EXIT WHEN v_cursor%NOTFOUND;
      
      DBMS_OUTPUT.PUT_LINE('Nombre del cliente: ' || v_nombre);
   END LOOP;
   
   CLOSE v_cursor;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
