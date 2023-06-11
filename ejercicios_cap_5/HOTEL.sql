--AVG
Select avg(precio) Promedio_Precio from Reserva_jmjp;
Select avg(cantidad) promedio_personas from Habitacion_hotel_jmjp;


--SUM
Select sum(precio) suma_Precios from Reserva_jmjp;
Select sum(cantidad) suma_personas from Habitacion_hotel_jmjp;


--MAX
Select max(precio) "Precio mas Grande" from Reserva_jmjp;
Select max(nombre) "Nombre mas Grande", max(apellido_paterno) "Apellido mas Grande" from Empleado_jmjp;


--MIN
Select min(nombre) "Nombre mas Chico", min(apellido_paterno) "Apellido mas Chico" from Cliente_jmjp;
Select min(precio) "Precio mas Chico" from Reserva_jmjp;


--COUNT(*)
Select id_hotel, count(*) reservas from Reserva_jmjp group by id_hotel;
Select id_categoria, count(*) hoteles from Hoteles_jmjp group by id_categoria;


--COUNT(COLUMNA)
Select id_tipo, count(nombre) habitaciones from Habitaciones_jmjp group by id_tipo;
Select id_agencia,id_empleado, count(id_hotel) hoteles from Reserva_jmjp group by id_agencia,id_empleado;


--DISTINCT
Select id_tipo, count(distinct nombre) habitaciones from Habitaciones_jmjp group by id_tipo;
Select id_agencia,id_empleado, count(distinct id_hotel) hoteles from Reserva_jmjp group by id_agencia,id_empleado;


--GROUP BY
Select id_hotel, avg(precio) Promedio from Reserva_jmjp group by id_hotel;
Select id_hotel, sum(cantidad) Cantidad from Habitacion_hotel_jmjp group by id_hotel;
Select id_tipo, max(nombre) nombre from Habitaciones_jmjp group by id_tipo;


--HAVING
Select id_hotel, avg(precio) Promedio from Reserva_jmjp group by id_hotel having avg(precio) > 1000;
Select id_hotel,id_habitacion, sum(cantidad) Cantidad from Habitacion_hotel_jmjp group by id_hotel,id_habitacion having sum(cantidad) = 3;
Select id_tipo, count(*) cantidad from Habitaciones_jmjp group by id_tipo having count(*) > 1;


--ANIDACIÓN DE FUNIONES DE GRUPO
Select max(avg(precio)) Promedio from Reserva_jmjp group by id_hotel;
Select avg(sum(cantidad)) Cantidad from Habitacion_hotel_jmjp group by id_hotel,id_habitacion having sum(cantidad) = 3;
Select min(count(*)) cantidad from Habitaciones_jmjp group by id_tipo;