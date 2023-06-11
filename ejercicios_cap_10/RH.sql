CREATE TABLE REGIONES_JMJP(
    ID_REGION NUMBER CONSTRAINT REGIONES_PK PRIMARY KEY,
    NOMBRE_REGION VARCHAR2(25)
);

CREATE TABLE PAISES_JMJP(
    ID_PAIS CHAR(2) CONSTRAINT PAISES_PK PRIMARY KEY,
    NOMBRE_PAIS VARCHAR2(40),
    ID_REGION NUMBER,
    CONSTRAINT REGIONES_PAISES_FK FOREIGN KEY (ID_REGION) REFERENCES REGIONES_JMJP(ID_REGION)
);

CREATE TABLE UBICACIONES_JMJP(
    ID_UBICACION NUMBER(4) CONSTRAINT UBICACIONES_PK PRIMARY KEY,
    DIRECCION VARCHAR2(40),
    CODIGO_POSTAL VARCHAR2(12),
    CIUDAD VARCHAR2(30) CONSTRAINT UBICACIONES_CIUDAD_NN NOT NULL,
    PROVINCIA VARCHAR2(25),
    ID_PAIS CHAR(2),
    CONSTRAINT PAISES_UBICACIONES_FK FOREIGN KEY (ID_PAIS) REFERENCES PAISES_JMJP(ID_PAIS)
);

CREATE TABLE TRABAJOS_JMJP(
    ID_TRABAJO VARCHAR2(10) CONSTRAINT TRABAJOS_PK PRIMARY KEY,
    NOMBRE_TRABAJO VARCHAR2(35)CONSTRAINT TRABAJOS_NOMBRE_TRABAJO_NN NOT NULL,
    SALARIO_MINIMO NUMBER(6),
    SALARIO_MAXIMO NUMBER(6)
);

CREATE TABLE TRABAJADORES_JMJP(
    ID_TRABAJADOR NUMBER(6) CONSTRAINT TRABAJADORES_PK PRIMARY KEY,
    NOMBRE VARCHAR2(20),
    APELLIDO VARCHAR2(25) CONSTRAINT TRABAJADORES_APELLIDOS_NN NOT NULL,
    CORREO VARCHAR2(25) CONSTRAINT TRABAJADORES_CORREO_NN NOT NULL,
    NUMERO VARCHAR2(20),
    FECHA_CONTRATACION DATE CONSTRAINT TRABAJADORES_CONSTRATACION_NN NOT NULL,
    ID_TRABAJO VARCHAR2(10),
    SALARIO NUMBER(8,2),
    COMISION_PCT NUMBER(2,2),
    ID_GERENTE NUMBER(6,2),
    ID_DEPARTAMENTO NUMBER(6,0),
    CONSTRAINT TRABAJO_TRABAJADOR_FK FOREIGN KEY (ID_TRABAJO) REFERENCES TRABAJOS_JMJP(ID_TRABAJO)
);

ALTER TABLE TRABAJADORES_JMJP ADD CONSTRAINT TRABAJADORES_TRABAJADORES_FK 
    FOREIGN KEY (ID_GERENTE) REFERENCES TRABAJADORES_JMJP(ID_TRABAJADOR);

CREATE TABLE DEPARTAMENTOS_JMJP(
    ID_DEPARTAMENTO NUMBER(4,0) CONSTRAINT DEPARTAMENTOS_PK PRIMARY KEY,
    NOMBRE_DEPARTAMENTO VARCHAR(30) CONSTRAINT DEPARTAMENTOS_NOMBRE_NN NOT NULL,
    ID_GERENTE NUMBER(6,0),
    ID_UBICACION NUMBER(4,0),
    CONSTRAINT  TRABAJADORES_DEPARTAMENTOS_FK FOREIGN KEY (ID_GERENTE) REFERENCES TRABAJADORES_JMJP(ID_TRABAJADOR),
    CONSTRAINT UBICACIONES_DEPARTAMENTOS_FK FOREIGN KEY (ID_UBICACION) REFERENCES UBICACIONES_JMJP(ID_UBICACION)
);

ALTER TABLE TRABAJADORES_JMJP ADD CONSTRAINT DEPARTAMENTOS_TRABAJADORES_FK 
FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS_JMJP(ID_DEPARTAMENTO);

CREATE TABLE HISTORIA_LABORAL_JMJP(
    ID_TRABAJADOR NUMBER(6),
    FECHA_COMIENZO DATE,
    FECHA_FIN DATE CONSTRAINT HISTORIA_LABORAL_FECHA_FIN_NN NOT NULL,
    ID_TRABAJO VARCHAR2(10) CONSTRAINT HISTORIA_LABORAL_TRABAJO_NN NOT NULL,
    ID_DEPARTAMENTO NUMBER(4),
    CONSTRAINT HISTORIA_LABORAL_PK PRIMARY KEY (ID_TRABAJADOR,FECHA_COMIENZO),
    CONSTRAINT TRABAJOS_HISTORIA_LABORAL_FK FOREIGN KEY (ID_TRABAJO) REFERENCES TRABAJOS_JMJP(ID_TRABAJO),
    CONSTRAINT TRABAJADORES_HISTORIA_LAB_FK FOREIGN KEY (ID_TRABAJADOR) REFERENCES TRABAJADORES_JMJP(ID_TRABAJADOR),
    CONSTRAINT DEPARTAMENTOS_HISTORIA_LAB_FK FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS_JMJP(ID_DEPARTAMENTO)
);












