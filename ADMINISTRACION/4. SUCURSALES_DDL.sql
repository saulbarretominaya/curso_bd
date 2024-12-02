-- CUALES SON: CREATE, ALTER, DROP

create table categorias (
id_categoria NUMBER PRIMARY KEY,
nombre_categoria VARCHAR2(100),
desc_categoria VARCHAR2(500)
-- fecha DATE DEFAULT sysdate
);


create table productos (
id_producto NUMBER PRIMARY KEY,
nombre_producto VARCHAR2(100),
id_categoria NUMBER,
CONSTRAINT fk_categoria
FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);