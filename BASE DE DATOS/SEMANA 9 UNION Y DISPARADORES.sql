CREATE OR REPLACE TRIGGER trg_clientes_insert
    BEFORE INSERT ON clientes -- BEFORE: ANTES, AFTER: DESPUES
    FOR EACH ROW 
    BEGIN
        INSERT INTO auditoria_clientes (id_cliente, nombre, ape_materno, ape_paterno, accion )
        VALUES(:NEW.id_cliente, :NEW.nombre, :NEW.ape_materno, :NEW.ape_paterno, 'INSERT');
    END
;

--  EN ORACLE PODEMOS USAR DE ESTA MANERA SIN NECESIDAD DE CREAR VARIOS TRIGGER
CREATE OR REPLACE TRIGGER trg_clientes
    BEFORE INSERT OR UPDATE OR DELETE ON clientes
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria_clientes (id_cliente, nombre, ape_materno, ape_paterno, accion)
        VALUES(:NEW.id_cliente, :NEW.nombre, :NEW.ape_materno, :NEW.ape_paterno, 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO auditoria_clientes (id_cliente, nombre, ape_materno, ape_paterno, accion)
        VALUES(:NEW.id_cliente, :NEW.nombre, :NEW.ape_materno, :NEW.ape_paterno, 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO auditoria_clientes (id_cliente, nombre, ape_materno, ape_paterno, accion)
        VALUES(:OLD.id_cliente, :OLD.nombre, :OLD.ape_materno, :OLD.ape_paterno, 'DELETE');
    END IF;
END;
;