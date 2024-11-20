-- https://www.youtube.com/watch?v=3mAopu15-8Q&ab_channel=BetSoftDeveloper (Entidad relacion)

CREATE TABLE PERSONA (
    IdPersona int PRIMARY KEY,
    NomPersona VARCHAR2(100),
    ApePatPersona VARCHAR2(100),
    ApeMatPersona VARCHAR2(100),
    Edad int NOT NULL,
    IdEstaCivil int NOT NULL,
    IdGenero int NOT NULL
);

CREATE TABLE EstaCivil (
    IdEstaCivil int PRIMARY KEY,
    NomEstaCivil VARCHAR2(100)
);

CREATE TABLE Genero (
    IdGenero int PRIMARY KEY,
    NomGenero VARCHAR2(100)
);

ALTER TABLE PERSONA
ADD CONSTRAINT FK_IdEstaCivil
FOREIGN KEY (IdEstaCivil)
REFERENCES EstaCivil (IdEstaCivil);

ALTER TABLE PERSONA
ADD CONSTRAINT FK_IdGenero1
FOREIGN KEY (IdGenero)
REFERENCES Genero (IdGenero);

CREATE SEQUENCE seq_PERSONA
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE seq_EstaCivil
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE seq_Genero
START WITH 1
INCREMENT  BY 1;

-- PROCEDIMIENTO INSERTAR
CREATE OR REPLACE PROCEDURE sp_EstaCivil_Insertar 
(
vNomEstaCivil VARCHAR2
)
AS
BEGIN 
    INSERT INTO estacivil (idEstaCivil,  NomEstaCivil)
    VALUES (seq_EstaCivil.NEXTVAL, vNomEstaCivil);
END sp_EstaCivil_Insertar;

EXEC sp_EstaCivil_Insertar('Soltero');
SELECT * FROM estacivil;

-- PROCEDIMIENTO ACTUALIZAR
CREATE OR REPLACE PROCEDURE sp_EstaCivil_Actualizar 
(
vIdEstaCivil INT, 
vNomEstaCivil VARCHAR2
)
AS
BEGIN 
    UPDATE estacivil SET NomEstaCivil = vNomEstaCivil
    WHERE IdEstaCivil = vIdEstaCivil;
END sp_EstaCivil_Actualizar;

EXEC sp_EstaCivil_Actualizar(1, 'Casado');
SELECT * FROM estacivil;

-- PROCEDIMIENTO ELIMINAR
CREATE OR REPLACE PROCEDURE sp_EstaCivil_Eliminar
(
vIdEstaCivil INT
)
AS
BEGIN 
    DELETE FROM estacivil WHERE IdEstaCivil = vIdEstaCivil;
END sp_EstaCivil_Eliminar;

EXEC sp_EstaCivil_Eliminar(1);
SELECT * FROM estacivil;