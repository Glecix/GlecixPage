CREATE TABLE usuarios(ID NUMBER(7), user VARCHAR(10), password VARCHAR(10), fecha DATE, permit CHAR(1));
CREATE TABLE registro(carnet NUMBER(7),nombre VARCHAR(20), Nsegundo VARCHAR(20), apellido VARCHAR(20), Sapellido VARCHAR(20));

ALTER TABLE usuarios ADD CONSTRAINT PK_usuarios_id PRIMARY KEY (ID);
ALTER TABLE registro ADD CONSTRAINT PK_registro_carnet PRIMARY KEY (carnet);
ALTER TABLE refistro ADD CONSTRAINT FK_registro_usuarios FOREIGN KEY (carnet) REFERENCES usuarios(ID);
ALTER TABLE usuarios ADD CONSTRAINT CK_usuarios_permit CHECK (permit IN ('A','E','M'));

/
CREATE TRIGGER A_users BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
SELECT SYSDATE INTO :new.fecha FROM DUAL;
END;
/