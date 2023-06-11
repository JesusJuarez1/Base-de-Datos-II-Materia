--1. ¿Qué son las funciones de grupo?
--Las funciones de grupo son funciones las cuales operan con sobre un conjunto de valores y de estos valores regresan un solo valor.


--2. Explique el funcionamiento de cada una de las siguientes consultas:
Select sum(2) from Employees;
--Suma 2 por cada registro que encuentra.
Select sum(Salary) from Employees;
--Suma todos los salarios de todos los empleados.
Select sum(distinct salary) from Employees;
--Suma todos los salarios que no sean iguales.
Select sum(commission_pct) from Employees;
--Suma las comisiones de los empleados que tengan una.


--3. Explique el funcionamiento de cada una de las siguientes consultas: 
Select avg(2) from Employees;
--Obtiene el promedio de la suma de 2 por cada registro que encuentra.
Select avg(Salary) from Employees;
--Obtiene el promedio de todos los salarios que tiene el empleado.
Select avg(distinct salary) from Employees;
--Obtiene el promedio de todos los salarios que no sean iguales.
Select avg(commission_pct) from Employees;
--Obtiene el promedio de las comisiones de los empleados que tengan una.


--4. Explique el funcionamiento de cada una de las siguientes consultas:
Select min(commission_pct), max(commission_pct) from Employees;
--Obtiene el valor minimo y valor maximo de todas las comisiones diferentes de null.
Select min(start_date), max(end_date) from Job_History;
--Obtiene la fecha mas antigua dentro de start_date y obtiene la fecha mas reciente en la columna end_date.
Select min(job_id), max(job_id) from Employees;
--Obtiene el minimo y maximo de la columna job_id comparando por orden alfabetico


--5. Explique el funcionamiento de cada una de las siguientes consultas:
Select department_id, sum(commission_pct) from Employees where commission_pct is not null group by department_id;
--Agrupa la salida por los numeros de departamento, donde la comision no es null y suma las comisiones dependiendo el department_id.
Select department_id,job_id,sum(commission_pct) from Employees where commission_pct is not null group by department_id, job_id;
--Hace la suma de las commisiones que sean diferentes de null, agrupando el resultado por el department_id y el job_id.


--6. Explique el funcionamiento de la siguiente consulta:
Select department_id,avg(salary) from Employees group by department_id having avg(salary) > 8000;
--Obtiene el promedio de los salarios donde el departamento tenga el mismo id, y donde el resultado del promedio sea mayor a 8000


--7. Explique el funcionamiento de la siguiente consulta:
Select department_id, count(*) from Job_History where department_id in (50,60,80,110) group by department_id;
--Cuenta el numero de registros que contienen el mismo id de departamento, seleccionando algunos departamentos y agrupando el resultado por el id del departamento.


--8. Explique el funcionamiento de la siguiente consulta:
Select department_id, count(*) from Job_History where department_id in (50,60,80,110) group by department_id having count(*) > 1;
--Hace lo mismo que la consulta anterior (7), con la diferencia que excluye en los que el resultado de contar el resultado sea mayor a 1.


--9. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada departamento 
--(únicamente interesa contar a los empleados que ganan más de 5000 y que tengan una comisión asignada).
Select department_id, count(*) from Employees where salary > 5000 and commission_pct is not null group by department_id;


--10. Elabore una sentencia SELECT que indique la cantidad de empleados que hay en cada puesto de trabajo 
--(únicamente interesa contar a los empleados que tengan más de 10 de antigüedad) y sólo mostrar los puestos
--que tengan más de 10 empleados asignados.
Select job_id, count(*) from Employees where (months_between(sysdate,hire_date)/12) > 10 group by job_id having count(*) > 10;
