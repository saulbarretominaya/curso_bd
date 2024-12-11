-- Instrucciones DML en Oracle
-- INSERT: Una sentencia INSERT de SQL agrega uno o más registros a una (y sólo una) tabla en una base de datos relacional.
-- UPDATE: Una sentencia UPDATE de SQL es utilizada para modificar los valores de un conjunto de registros existentes en una tabla.
-- MERGE: Lo que permite la sentencia SQL MERGE es, dependiendo de una condición lógica, actualizar registros (UPDATE) cuando la condición se cumple, o insertar registros(INSERT) cuando dicha condición no se cumple, de ahí surge la denominación de UPSERT.
-- DELETE: Una sentencia DELETE de SQL borra uno o más registros existentes en una tabla.
-- Instruccionesde Transferencia: Administran las modificaciones creadas por las instrucciones DML. Lo forman las instrucciones ROLLBACK, COMMIT y SAVEPOINT.

-- REALIZAR UN INSERT UTILIZANDO PROCEDIMIENTOS ALMACENADOS Y SEQUENCIA.
create or replace procedure proc_insertar_clientes (
   p_id_cliente  in number,
   p_nombre      in varchar2,
   p_ape_paterno in varchar2,
   p_ape_materno in varchar2
) is
begin
   insert into clientes (
      id_cliente,
      nombre,
      ape_paterno,
      ape_materno
   ) values ( p_id_cliente,
              p_nombre,
              p_ape_paterno,
              p_ape_materno );
   commit;
end;

begin
   proc_insertar_clientes(
      1,
      'Pedro',
      'Lopez',
      'Risco'
   );
   proc_insertar_clientes(
      2,
      'Juan',
      'Martinez',
      'Soto'
   );
   proc_insertar_clientes(
      3,
      'Luis',
      'Lopez',
      'Ramirez'
   );
end;

-- INSERTARLO DENTRO DE UN PAQUETES
create or replace package body pkg_clientes as
   
   procedure proc_insertar_clientes (
      p_id_cliente  in number,
      p_nombre      in varchar2,
      p_ape_paterno in varchar2,
      p_ape_materno in varchar2
   ) is
   begin
      insert into clientes (
         id_cliente,
         nombre,
         ape_paterno,
         ape_materno
      ) values ( p_id_cliente,
                 p_nombre,
                 p_ape_paterno,
                 p_ape_materno );
      commit;
   end proc_insertar_clientes;

end;

-- ELIMINAR PAQUETES
drop package body pkg_clientes;

-- INSERTAR
BEGIN
   pkg_clientes.proc_insertar_clientes(1, 'Pedro', 'Lopez', 'Risco');
   pkg_clientes.proc_insertar_clientes(2, 'Juan', 'Martinez', 'Soto');
   pkg_clientes.proc_insertar_clientes(3, 'Luis', 'Lopez', 'Ramirez');
END;