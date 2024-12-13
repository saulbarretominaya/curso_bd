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
   constraint fk_id_categoria foreign key ( id_categoria )
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

create table clientes (
   id_cliente  number primary key,
   nombre      varchar2(100),
   ape_paterno varchar2(100),
   ape_materno varchar2(100)
);

create table ventas (
   id_venta      number primary key,
   id_cliente    number,
   id_trabajador number,
   sub_total     number(10,2),
   monto_total   number(10,2),
   fecha         date default sysdate,
   constraint fk_id_cliente foreign key ( id_cliente )
      references clientes ( id_cliente ),
   constraint fk_id_trabajador foreign key ( id_trabajador )
      references trabajadores ( id_trabajador )
);

create table detalle_ventas (
   id_dventa       number primary key,
   id_venta        number,
   id_producto     number,
   precio_unitario number(10,2),
   cantidad        varchar2(10),
   sub_total       number(10,2),
   constraint fk_id_venta foreign key ( id_venta )
      references ventas ( id_venta ),
   constraint fk_id_producto foreign key ( id_producto )
      references productos ( id_producto )
);