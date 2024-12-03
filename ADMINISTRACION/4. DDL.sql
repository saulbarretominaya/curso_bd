-- CUALES SON: CREATE, ALTER, DROP

create table categorias (
   id_categoria     number primary key,
   nombre_categoria varchar2(100),
   desc_categoria   varchar2(500)
);


create table productos (
   id_producto     number primary key,
   nombre_producto varchar2(100),
   id_categoria    number,
   constraint fk_categoria foreign key ( id_categoria )
      references categorias ( id_categoria )
);


create table trabajadores (
   id_trabajador     number primary key,
   nombre_trabajador varchar2(200),
   sueldo            number(10,2)
);