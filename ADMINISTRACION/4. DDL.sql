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

create table parametros (
   id_parametro number primary key,
   descripcion  varchar2(200),
   codigo       varchar2(50) not null unique
);

create table detalle_parametros (
   id_dparametro number primary key,
   descripcion   varchar2(200),
   codigo        varchar2(50) not null unique,
   id_parametro  number,
   constraint fk_id_parametro foreign key ( id_parametro )
      references parametros ( id_parametro )
);