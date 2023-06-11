Select lower(nombre||' '||apellido_paterno||' '||apellido_materno) as "Nombre" from Cliente_jmjp;
Select * from Hoteles_jmjp where lower(colonia) = 'h_col_4';

Select * from Tipo_Habitacion_jmjp where descripcion = upper('habitacion para un huesped'); 
Select nombre, telefono from Agencia_jmjp where nombre = upper('AgEnCiA 1');

Select initcap(nombre||' '||apellido_paterno||' '||apellido_materno) as "Nombre" from Cliente_jmjp;
Select ID_HABITACION,initcap(NOMBRE) nombre,ID_TIPO  from Habitaciones_jmjp;

select concat(concat(concat(concat(nombre,' '),apellido_paterno),' '),apellido_materno) as "Nombre" from Cliente_jmjp;
Select concat(concat(concat('La habitacion con el id ',ID_HABITACION),' tiene el nombre '),initcap(nombre)) as Habitacion from Habitaciones_jmjp;

Select substr(descripcion,12,25) from tipo_habitacion_jmjp;
Select substr(nombre,1,3) nombre, substr(apellido_paterno,1,3) from Empleado_jmjp;

Select nombre, length(nombre) from Cliente_jmjp;
Select nombre,length(nombre),apellido_paterno,length(apellido_paterno),apellido_materno,length(apellido_materno) from Empleado_jmjp;

Select nombre, instr(nombre,'E') from Hoteles_jmjp;
Select nombre, instr(apellido_materno,'A'), apellido_paterno, instr(apellido_paterno,'A') from Cliente_jmjp;

Select lpad(rpad(nombre,length(nombre)+1,'?'),length(nombre)+2,'?') "?Nombre?" from Cliente_jmjp;
Select lpad(rpad(nombre,length(nombre)+3,'*'),length(nombre)*2,'*') nombre from Hoteles_jmjp;

Select trim(trailing 'S' from descripcion) Descripcion from Categorias_jmjp;
Select trim(both 'Z' from (nombre||' '||apellido_paterno||' '||apellido_materno)) from Empleado_jmjp;

Select id_cliente,replace(telefono,'836','***') numero from Cliente_jmjp;
Select id_hotel,replace(fecha_construccion,'/','-') fecha_construccion from Hoteles_jmjp;

Select id_reserva,fecha_inicio,fecha_fin,round(precio,-1) from Reserva_jmjp;
Select id_reserva,fecha_inicio,fecha_fin,round(precio) from Reserva_jmjp;

Select id_reserva,fecha_inicio,fecha_fin,trunc(precio,-1) from Reserva_jmjp;
Select id_reserva,fecha_inicio,fecha_fin,trunc(precio,-3) from Reserva_jmjp;

Select id_reserva,fecha_inicio,fecha_fin,precio-mod(precio,15) as "Precio" from Reserva_jmjp;
Select id_reserva,fecha_inicio,fecha_fin,precio-mod(precio,150) as "Precio" from Reserva_jmjp;

Select id_hotel,round(fecha_construccion,'MONTH') fecha,nombre,telefono from Hoteles_jmjp;
Select id_reserva,round(fecha_inicio,'MONTH') fecha, precio from Reserva_jmjp;

Select id_hotel,trunc(fecha_construccion,'MONTH') fecha,nombre,telefono from Hoteles_jmjp;
Select id_reserva,trunc(fecha_inicio,'MONTH') fecha, precio from Reserva_jmjp;

Select id_hotel, nombre, fecha_construccion from Hoteles_jmjp where fecha_construccion > '11/11/12';
Select id_reserva,fecha_inicio,fecha_fin,precio from Reserva_jmjp where fecha_fin-fecha_inicio > 3;

Select id_hotel, nombre, fecha_construccion, months_between(fecha_construccion,sysdate) as meses from Hoteles_jmjp;
Select id_reserva, fecha_inicio, fecha_fin,precio, months_between(fecha_inicio, add_months(fecha_fin, 16))as fecha_inicio from Reserva_jmjp;

Select id_hotel, nombre, add_months(fecha_construccion,12) from Hoteles_jmjp;
Select id_reserva, add_months(fecha_inicio,1) fecha_inicio, add_months(fecha_fin,2) fecha_fin from Reserva_jmjp;

Select id_hotel, nombre, next_day(fecha_construccion,2) from Hoteles_jmjp;
Select id_reserva, next_day(fecha_inicio,1) fecha_inicio, next_day(fecha_fin,5) fecha_fin from Reserva_jmjp;

Select id_hotel, nombre, last_day(fecha_construccion) from Hoteles_jmjp;
Select id_reserva, last_day(fecha_inicio) fecha_inicio, last_day(fecha_fin) fecha_fin from Reserva_jmjp;