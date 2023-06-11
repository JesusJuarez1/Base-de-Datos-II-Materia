--  SECUENCIAS
create sequence id_ag 
    start with 100
    maxvalue 999999
    cycle;
    
create sequence id_cat
    start with 100
    maxvalue 9999
    cycle;
    
create sequence id_cli
    start with 100
    maxvalue 999999
    cycle;
    
create sequence id_emp
    start with 100
    maxvalue 999999
    cycle;

create sequence id_hab
    start with 100
    maxvalue 999999
    cycle;
    
create sequence id_hot
    start with 100
    maxvalue 999999
    cycle;

create sequence id_res
    start with 100
    maxvalue 999999
    cycle;
    
create sequence id_tip  
    start with 100
    maxvalue 999999
    cycle;
    

--  SINONIMOS
create synonym Ag_Emp for Agencia_Empleado_JMJP;
create synonym Ag for Agencia_JMJP;
create synonym Cat for Categorias_JMJP;
create synonym Cli for Cliente_JMJP;
create synonym Emp for Empleado_JMJP;
create synonym Hab_Hot for Habitacion_Hotel_JMJP;
create synonym Hab for Habitaciones_JMJP;
create synonym Hot for Hoteles_JMJP;
create synonym Res for Reserva_JMJP;
create synonym Tip_Hab for Tipo_Habitacion_JMJP;


--  INDICES
create bitmap index nom_age_idx on Agencia_JMJP(nombre);
create bitmap index iva_cat_idx on Categorias_JMJP(IVA);
create index nom_cli_idx on Cliente_JMJP(nombre,apellido_paterno,apellido_materno);
create index nom_emp_idx on Empleado_JMJP(nombre,apellido_paterno,apellido_materno);
create bitmap index can_hab_hot_idx on Habitacion_Hotel_JMJP(cantidad);
create index nom_hab_idx on Habitaciones_JMJP(nombre);
create index tip_hab_idx on Habitaciones_JMJP(id_tipo);
create index fech_hot_idx on Hoteles_JMJP(fecha_construccion);
create index nom_hot_idx on Hoteles_JMJP(nombre);
create index cat_hot_idx on Hoteles_JMJP(id_categoria);
create index fechas_res_idx on Reserva_JMJP(fecha_inicio,fecha_fin);
create index pre_res_idx on Reserva_JMJP(precio);
create index hot_res_idx on Reserva_JMJP(id_hotel);
create index hab_res_idx on Reserva_JMJP(id_habitacion);
create index age_res_idx on Reserva_JMJP(id_agencia);
create index emp_res_idx on Reserva_JMJP(id_empleado);
create index cli_res_idx on Reserva_JMJP(id_cliente);
create bitmap index des_tip_hab_idx on Tipo_Habitacion_JMJP(descripcion);


