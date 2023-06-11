--1. Mencione en qué partes de la Sentencia SELECT se puede utilizar una SUBCONSULTA.
--Se puede utilizar todas las partes como si fuera una consulta normal, 
--mientras que la consulta que hace la subconsulta soporte lo que regrese la subconsulta.


--2. Mencione los lineamientos para usar SUBCONSULTAS.
--Colocar la subconsulta entre parentesis
--Colocar la subconsulta al lado derecho del operador de comparacion
--Utilizar operadores de una sola linea con subconsultas de una sola fila, y utilizar operadores de varias lienas en subconsultas de varias filas


--3. Explique la diferencia entre los dos tipos de SUBCONSULTAS que existen.
--Las subconsultas de una sola fila solo regresan una sola fila por lo tanto necesitan un operador de comparacion de una sola fila,
--y las subconsultas de varias filas regresan varias filas y requieren un operador de comparacion de varias filas.


--4. Elabore una sentencia SELECT que muestre a todos los empleados que tengan el mismo JOB_ID del empleado 141.
Select * from Employees where job_id = (Select job_id from Employees where employee_id = 141);


--5. Elabore una sentencia SELECT que muestre el nombre del puesto cuyo salario promedio (el salario promedio se obtiene con los 
--salarios asignados en la tabla empleados) sea el más bajo de todos los salarios promedio de los diferentes puestos.
Select job_title from Jobs where job_id = (Select job_id from Employees group by job_id having 
avg(salary) = (Select min(avg(salary)) from Employees group by job_id));


--6. Explique el funcionamiento de la siguiente consulta:
Select last_name from Employees where Manager_id in (Select employee_id from Employees where department_id in 
(Select department_id from Departments where location_id in (Select location_id from Locations where country_id = 'UK')));
--Obtiene los apellidos de los empleados que trabajen en un departamento, los cuales se deben encontrar en el pais con el id "UK"


--7. Explique el funcionamiento de la siguiente consulta:
Select job_title from Jobs natural join Employees group by job_title having avg(salary) = 
(Select max(avg(salary)) from Employees group by job_id);
--Obtiene el titulo del trabajo cuyo salario promedio de los empleados de un mismo trabajo sea 
--el mas alto de todos los promedios de los diferentes puestos


--8. Explique el funcionamiento de cada una de las siguientes consultas:
Select last_name from Employees where salary > all (Select salary from Employees where department_id = 80);
--Obtiene los apellidos de los empleados los cuales tienen un salario mayor a todos los empleados con el departamento 80.
Select last_name from Employees where salary > (Select max(salary) from Employees where department_id = 80);
--Obtiene los apellidos de los empleados los cuales tienen un salario mayor al del empleado del departamento 80 que mas gana.


--9. Elabore una sentencia SELECT que muestre a los empleados que menos ganan en cada uno de los departamentos.
Select e.job_id,e.last_name,e.salary from Employees e join 
(Select job_id, min(salary) sal from Employees group by job_id) j on (e.job_id = j.job_id and e.salary = j.sal);


--10. Explique el funcionamiento de la siguiente consulta:
Select last_name from Employees where employee_id not in (Select manager_id from Employees where manager_id is not null);
--Recupera los nombres de los empleados que no son gerentes


--






