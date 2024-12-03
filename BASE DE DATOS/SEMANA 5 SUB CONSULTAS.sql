-- Listar los trabajadores que ganan más que el sueldo promedio de todos los empleados y ordenar el sueldo de mayor a menor.
select id_trabajador,
       nombre_trabajador,
       sueldo
  from trabajadores
 where sueldo > (
   select avg(sueldo)
     from trabajadores
)
 order by sueldo desc;