--Elaborar 3 sentencias de subconsultas con operadores de un sólo registro.
--1
Select * from Hotel_Habitacion_jmjp where cantidad > = 
(Select cantidad from Habitacion_Hotel_jmjp where id_habitacion = 101);
--2
Select * from Agencia_jmjp where nombre != 
(Select nombre from Agencia_jmjp where id_agencia = 102);
--3
Select * from Habitaciones_jmjp where id_tipo != (Select id_tipo from Tipo_Habitacion_jmjp
where descripcion = 'HABITACION PARA UN HUESPED');


--Elaborar 3 sentencias de subconsultas con operadores de múltiples registros.
--1
Select * from Hoteles_jmjp where id_hotel in (Select id_hotel from Habitacion_Hotel_jmjp);
--2
Select id_reserva,fecha_inicio,fecha_fin,precio from Reserva_jmjp 
where precio > all (Select precio from Reserva_jmjp where id_reserva <= 102);
--3
Select id_hotel,fecha_construccion,nombre from Hoteles_jmjp where fecha_construccion != any 
(Select fecha_construccion from Hoteles_jmjp where id_hotel in (101,103,105));


--Elaborar 3 sentencias de subconsultas en la cláusula HAVING.
--1
Select id_hotel,sum(precio) from Reserva_jmjp group by id_hotel 
having sum(precio) = any (Select sum(precio) from Reserva_jmjp group by id_agencia);
--2
Select id_categoria,min(nombre) from Hoteles_jmjp group by id_categoria having 
min(nombre) != (Select min(nombre) from Hoteles_jmjp);
--3
Select id_tipo,max(nombre) from Habitaciones_jmjp group by id_tipo having id_tipo in 
(Select id_tipo from Tipo_Habitacion_jmjp where descripcion like '%HUESPEDES%');


--Elaborar 3 sentencias de subconsultas con el operador EXISTS.
--1
Select * from Agencia_jmjp where exists (Select * from Agencia_Empleado_jmjp where id_agencia != 102);
--2
Select * from Reserva_jmjp where exists (Select * from Reserva_jmjp where fecha_fin = null);
--3
Select * from Empleado_jmjp where not exists (Select e.* from Empleado_jmjp e natural join Agencia_Empleado_jmjp)