--1. Elabore 3 vistas sencillas y elabore las sentencias SELECT para consultar los datos de dichas vistas.
--1
Create view Clie as
Select id_cliente, nombre, apellido_paterno, apellido_materno from Cliente_jmjp;
Select * from Clie;
--2
Create view Emp_id as
Select * from Empleado_jmjp where id_empleado = 101;
Select * from Emp_id;
--3
Create view Agen as
Select id_agencia,nombre,(colonia||' '||calle) Direccion from Agencia_jmjp;
Select * from Agen;


--2. Elabore 3 vistas complejas sencillas y elabore las sentencias SELECT para consultar los datos de dichas vistas.
--1
create view Hotel_Habit as 
Select ho.id_hotel,ho.id_categoria,ho.fecha_construccion,ho.nombre hotel,ha.id_habitacion,ha.nombre habitacion,ha.id_tipo,haho.cantidad from Hoteles_jmjp ho
join Habitacion_Hotel_jmjp haho on (ho.id_hotel=haho.id_hotel) join Habitaciones_jmjp ha on(haho.id_habitacion=ha.id_habitacion);
Select * from Hotel_Habit;
--2
Create view Agen_Emp as
Select a.id_agencia,a.nombre Agencia,e.id_empleado,e.nombre empleado,e.apellido_paterno from Agencia_jmjp a
join Agencia_Empleado_jmjp ae on (a.id_agencia=ae.id_agencia) join Empleado_jmjp e on (ae.id_empleado=e.id_empleado);
Select * from Agen_Emp;
--3
Create view Precio as
Select min(precio) menor, max(precio) mayor, avg(precio) promedio from Reserva_jmjp;
Select * from Precio;


--3. Modifique 1 vista sencilla y 1 vista compleja.
Create or replace view Emp_id as
Select * from Empleado_jmjp where id_empleado >= 101;
Select * from Emp_id;

Create or replace view Precio as
Select min(precio) menor, max(precio) mayor, avg(precio) promedio, count(*) Cantidad from Reserva_jmjp;
Select * from Precio;


--4. Elabore una vista sencilla que cumpla con las características necesarias para poder ejecutar sentencias DML a través de ella.
Create view Habit as 
Select id_habitacion, nombre from Habitaciones_jmjp;
Select * from Habit;
    --a. Inserte registros por medio de la vista
    Insert into Habit values(105,'Suite');
    Select * from Habit;
    --b. Modifique registros por medio de la vista.
    Update Habit set nombre = 'SUITE' where id_habitacion = 105;
    Select * from Habit;
    --c. Elimine registros por medio de la vista.
    Delete from Habit where id_habitacion = 105;
    Select * from Habit;


--5. Elabore 2 vistas con la cláusula WITH CHECK OPTION y elabore las sentencias necesarias para comprobar la restricción de la vista.
Create or replace view Habit as 
Select id_habitacion, nombre from Habitaciones_jmjp where nombre = 'HABITACION TRIPLE' with check option;
Select * from Habit;
Update Habit set nombre = 'SUITE' where nombre = 'HABITACION TRIPLE';
Select * from Habit;

Create or replace view Emp_Nom as
Select * from Empleado_jmjp where apellido_paterno = 'FELIX' with check option;
Select * from Emp_Nom;
Update Emp_Nom set apellido_paterno = 'PEREZ';
Select * from Emp_Nom;


--6. Elabore 2 vistas con la cláusula WITH READ ONLY y elabore las sentencias necesarias para comprobar la restricción de la vista.
Create or replace view Habit as
Select id_habitacion, nombre, id_tipo from Habitaciones_jmjp where id_tipo is not null with read only;
Select * from Habit;
Insert into Habit values(105,'Prueba',null);

Create or replace view Agen as 
Select id_agencia, nombre, colonia, calle from Agencia_jmjp with read only;
Update Agen set nombre = 'Prueba';


--7. Elabore la sentencia necesaria para borrar una vista.
Drop view Agen;

