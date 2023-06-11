--Elaborar 3 sentencias con el operador UNION.
--1
Select id_agencia, nombre,null "ID_EMPLEADO" from Agencia_jmjp union
Select id_agencia, to_char(null),id_empleado from Agencia_Empleado_jmjp;
--2
Select id_hotel,nombre,id_categoria from Hoteles_jmjp union
Select null,to_char(null),id_categoria from Categorias_jmjp order by id_categoria;
--3
Select id_hotel,nombre,null "ID_HABITACION", 0 cantidad from Hoteles_jmjp union
Select id_hotel,to_char(null),id_habitacion,cantidad from Habitacion_Hotel_jmjp;


--Elaborar 3 sentencias con el operador UNION ALL.
Select id_agencia, nombre,null "ID_EMPLEADO" from Agencia_jmjp union all
Select id_agencia, to_char(null),id_empleado from Agencia_Empleado_jmjp;
--2
Select id_hotel,nombre,id_categoria from Hoteles_jmjp union all
Select null,to_char(null),id_categoria from Categorias_jmjp order by id_categoria;
--3
Select id_hotel,nombre,null "ID_HABITACION", 0 cantidad from Hoteles_jmjp union all
Select id_hotel,to_char(null),id_habitacion,cantidad from Habitacion_Hotel_jmjp;


--Elaborar 3 sentencias con el operador INTERSECT.
--1
Select id_tipo from Habitaciones_jmjp intersect
Select id_tipo from Tipo_Habitacion_jmjp;
--2
Select id_hotel,id_habitacion from Habitacion_Hotel_jmjp intersect
Select id_hotel,id_Habitacion from Reserva_jmjp;
--3
Select id_agencia,id_empleado from Reserva_jmjp intersect
Select id_agencia,id_empleado from Agencia_Empleado_jmjp;


--Elaborar 3 sentencias con el operador MINUS.
--1
Select id_agencia from Agencia_jmjp minus
Select id_agencia from Agencia_Empleado_jmjp;
--2
Select id_hotel,id_habitacion from Habitacion_Hotel_jmjp minus
Select id_hotel,id_Habitacion from Reserva_jmjp;
--3
Select id_cliente from Cliente_jmjp minus
Select id_cliente from Reserva_jmjp;