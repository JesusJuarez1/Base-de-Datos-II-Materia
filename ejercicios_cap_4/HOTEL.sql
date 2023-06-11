--to_char fechas
Select nombre, to_char(fecha_construccion,'fm day dd, month yyyy') "FECHA CONSTRUCCION" from Hoteles_jmjp;
Select to_char(fecha_inicio,'dy-mon-yyyy') "Fecha Inicio", to_char(fecha_fin,'dd-mm-yy') "Fecha Fin" from Reserva_jmjp;

--to_char números
Select id_reserva,fecha_inicio,fecha_fin,to_char(precio,'fm$999,999,999.99') precio from Reserva_jmjp;
Select id_reserva,fecha_inicio,fecha_fin,to_char(precio,'fmRN') precio from Reserva_jmjp where id_reserva = 102;

--to_date
Select * from Hoteles_jmjp where fecha_construccion < to_date('13, Nov 2012','dd, Mon yyyy');
Select * from Reserva_jmjp where fecha_inicio > to_date('18-Abril-2015','fmdd-month-yyyy');

--to_number
Select ID_HOTEL,ID_HABITACION,to_number(CANTIDAD*1234567.89,999999999999.99) "cantidad*1234567.89"  from habitacion_hotel_jmjp;
Select to_number('123456789.12') "conversion"  from dual;

--Funciones anidadas
Select concat(nombre,concat(' ',concat(apellido_paterno,concat(' ',apellido_materno)))) nombre from Empleado_jmjp;
Select concat(substr(nombre,1,3),concat(' ',concat(substr(apellido_paterno,1,3),concat(' ',substr(apellido_materno,1,3))))) nombre from Cliente_jmjp;

--Funciones generales
--nvl
Select nombre, nvl(apellido_paterno,'No apellido') apellido_p, nvl(apellido_materno,'No apellido') apellido_m from Cliente_jmjp;
Select id_hotel, fecha_construccion, nombre, nvl(telefono,'Sin telefono') telefono from Hoteles_jmjp;
--nvl2
Select id_hotel, id_habitacion, nvl2(cantidad,'Correcto','Error') "¿Tiene cantidad?" from Habitacion_hotel_jmjp;
Select nombre, apellido_paterno,apellido_materno,nvl2(telefono,'tel:'||telefono,'Sin telefono') from Empleado_jmjp;
--nullif
Select nombre, apellido_paterno, apellido_materno, nullif(length(apellido_materno),length(apellido_paterno))longitud from Cliente_jmjp;
Select id_agencia,nombre,colonia,calle, nullif(length(colonia),length(calle))"lon col, call" from Agencia_jmjp;
--coalesce
Select nombre, coalesce(apellido_paterno,'No ap pat, '||apellido_materno,'Sin apellidos')apellido from Empleado_jmjp;
Select id_reserva,fecha_inicio,coalesce(fecha_fin,to_date('00/00/00'))fecha_fin,
    coalesce(id_hotel,id_habitacion,id_agencia,id_empleado,id_cliente,00000) datos
from Reserva_jmjp;

--Case
Select id_reserva, fecha_inicio, case trunc(precio/1500,0)
    when 1 then 'Precio bajo'
    when 2 then 'Precio medio'
    else 'Precio alto' end "Precio"
from Reserva_jmjp;

--decode
Select id_hotel,nombre,telefono, decode(to_char(fecha_construccion,'fmMonth'),
    'Enero', 'Primero',
    'Febrero', 'Segundo',
    'Marzo', 'Tercero',
    'Abril', 'Cuarto',
    'Mayo', 'Quinto',
    'Junio', 'Sexto',
    'Julio', 'Septimo',
    'Agosto', 'Octabo',
    'Septiembre', 'Noveno',
    'Octubre', 'Decimo',
    'Noviembre', 'Decimo primero',
    'Diciembre', 'Decimo segundo',
    'Sin fecha'
    )mes_construccion 
from Hoteles_jmjp;

