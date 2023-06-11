--  SECUENCIAS
CREATE SEQUENCE REG_ID
    START WITH 5
    NOMAXVALUE
    NOCYCLE;

create sequence UBI_ID 
    start with 3300
    increment by 100
    maxvalue 9999
    cycle;
    
create sequence dep_id
    start with 280
    increment by 10
    maxvalue 9999
    cycle;
    
create sequence emp_id
    start with 206
    maxvalue 999999
    cycle;

--  SINONIMOS
create synonym Dep for Departamentos_JMJP;
create synonym His_Lab for Historia_Laboral_JMJP;
create synonym Pai for Paises_JMJP;
create synonym Reg for Regiones_JMJP;
create synonym Trab for Trabajadores_JMJP;
create synonym Tra for Trabajos_JMJP;
create synonym Ubi for Ubicaciones_JMJP;


--  INDICES
create unique index nom_dep_idx on Departamentos_JMJP(nombre_departamento);
create index ger_dep_idx on Departamentos_JMJP(id_gerente);
create index ubi_dep_idx on Departamentos_JMJP(id_ubicacion);
create index fechas_hl_idx on Historia_Laboral_JMJP(fecha_comienzo,fecha_fin);
create index tra_hl_idx on Historia_Laboral_JMJP(id_trabajo);
create index dep_hl_idx on Historia_Laboral_JMJP(id_departamento);
create bitmap index nom_pai_idx on Paises_JMJP(nombre_pais);
create unique index nom_pai_idx_u on Paises_JMJP(nombre_pais);
create index reg_pai_idx on Paises_JMJP(id_region);
create bitmap index nom_reg_idx on Regiones_JMJP(nombre_region);
create index nom_trab_idx on Trabajadores_JMJP(nombre,apellido);
create index fec_trab_idx on Trabajadores_JMJP(fecha_contratacion);
create index tra_trab_idx on Trabajadores_JMJP(id_trabajo);
create index sal_trab_idx on Trabajadores_JMJP(salario,comision_pct);
create index ger_trab_idx on Trabajadores_JMJP(id_gerente);
create index dep_trab_idx on Trabajadores_JMJP(id_departamento);
create bitmap index nom_tra_idx on Trabajos_JMJP(nombre_trabajo);
create unique index nom_tra_idx_u on Trabajos_JMJP(nombre_trabajo);
create index sala_tra_idx on Trabajos_JMJP(salario_minimo, salario_maximo);
create index cp_ubi_idx on Ubicaciones_JMJP(codigo_postal);
create index ciu_ubi_idx on Ubicaciones_JMJP(ciudad);
create index pai_ubi_idx on Ubicaciones_JMJP(id_pais);
