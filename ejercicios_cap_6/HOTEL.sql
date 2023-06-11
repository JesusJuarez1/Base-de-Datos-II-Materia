--Natural join
Select * from Habitaciones_jmjp natural join Tipo_Habitacion_jmjp;

Select * from Hoteles_jmjp natural join Categorias_jmjp;

Select * from Habitaciones_jmjp natural join Habitacion_Hotel_jmjp;



--Join using
Select * from Agencia_jmjp join Agencia_Empleado_jmjp using (id_agencia) join Empleado_jmjp using (id_empleado);

Select * from Cliente_jmjp join Reserva_jmjp using (id_cliente);

Select * from Habitaciones_jmjp join Habitacion_Hotel_jmjp using (id_habitacion) join Hoteles_jmjp using (id_hotel);



--Join on
Select a.id_agencia,a.nombre,e.id_empleado,e.nombre nombre_empleado,e.apellido_paterno from Agencia_jmjp a 
join Agencia_Empleado_jmjp ae on (a.id_agencia=ae.id_agencia) join Empleado_jmjp e on (e.id_empleado=ae.id_empleado);

Select c.id_cliente,c.nombre,c.apellido_paterno,r.id_reserva,r.fecha_inicio,r.fecha_fin,r.precio from Cliente_jmjp c
join Reserva_jmjp r on (c.id_cliente=r.id_cliente and r.precio > 1000);

Select h.nombre,t.descripcion from Habitaciones_jmjp h join Tipo_Habitacion_jmjp t on (h.id_tipo=t.id_tipo and t.descripcion like '%LE%');



--Self-Join
Select * from Cliente_jmjp c join Cliente_jmjp cl on (c.id_cliente=cl.id_cliente);

Select h.id_hotel,hot.nombre,h.fecha_construccion,hot.telefono from Hoteles_jmjp h join Hoteles_jmjp hot on (h.id_hotel = hot.id_hotel);

Select * from Categorias_jmjp c join Categorias_jmjp ca on (c.id_categoria=ca.id_categoria);


--nonequijoin
Select * from Empleado_jmjp e join Cliente_jmjp c on (c.nombre like '%'||substr(e.nombre,1,2)||'%');

Select * from Hoteles_jmjp h join Reserva_jmjp r on (h.fecha_construccion < r.fecha_inicio);

Select * from Reserva_jmjp r join Reserva_jmjp re on (r.precio > re.precio);



--left outer join
Select a.id_agencia,a.nombre,e.id_empleado,e.nombre nombre_empleado,e.apellido_paterno from Agencia_jmjp a 
left outer join Agencia_Empleado_jmjp ae on (a.id_agencia=ae.id_agencia) left outer join Empleado_jmjp e on (e.id_empleado=ae.id_empleado);

Select c.id_cliente,c.nombre,c.apellido_paterno,r.id_reserva,r.fecha_inicio,r.fecha_fin,r.precio from Cliente_jmjp c
left outer join Reserva_jmjp r on (c.id_cliente=r.id_cliente and r.precio > 1000);

Select h.nombre,t.descripcion from Habitaciones_jmjp h left outer join Tipo_Habitacion_jmjp t on (h.id_tipo=t.id_tipo and t.descripcion like '%LE%');



--right outer join
Select a.id_agencia,a.nombre,e.id_empleado,e.nombre nombre_empleado,e.apellido_paterno from Agencia_jmjp a 
right outer join Agencia_Empleado_jmjp ae on (a.id_agencia=ae.id_agencia) right outer join Empleado_jmjp e on (e.id_empleado=ae.id_empleado);

Select c.id_cliente,c.nombre,c.apellido_paterno,r.id_reserva,r.fecha_inicio,r.fecha_fin,r.precio from Cliente_jmjp c
right outer join Reserva_jmjp r on (c.id_cliente=r.id_cliente and r.precio > 1000);

Select h.nombre,t.descripcion from Habitaciones_jmjp h right outer join Tipo_Habitacion_jmjp t on (h.id_tipo=t.id_tipo and t.descripcion like '%LE%');



--full outer join
Select a.id_agencia,a.nombre,e.id_empleado,e.nombre nombre_empleado,e.apellido_paterno from Agencia_jmjp a 
full outer join Agencia_Empleado_jmjp ae on (a.id_agencia=ae.id_agencia) full outer join Empleado_jmjp e on (e.id_empleado=ae.id_empleado);

Select c.id_cliente,c.nombre,c.apellido_paterno,r.id_reserva,r.fecha_inicio,r.fecha_fin,r.precio from Cliente_jmjp c
full outer join Reserva_jmjp r on (c.id_cliente=r.id_cliente and r.precio > 1000);

Select h.nombre,t.descripcion from Habitaciones_jmjp h full outer join Tipo_Habitacion_jmjp t on (h.id_tipo=t.id_tipo and t.descripcion like '%LE%');



--cross join
Select h.nombre,t.descripcion from Habitaciones_jmjp h cross join Tipo_Habitacion_jmjp t;

Select c.id_cliente,c.nombre,c.apellido_paterno,r.id_reserva,r.fecha_inicio,r.fecha_fin,r.precio from Cliente_jmjp c cross join Reserva_jmjp r;

Select * from Agencia_jmjp cross join Empleado_jmjp;




