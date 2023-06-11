--1. Explique en qué consiste cada uno de los operadores de conjunto.
--UNION: Devuelve filas de ambas consultas excluyendo duplicados.
--UNION ALL: Devuelve filas de ambas consultas incluyendo duplicados.
--INTERSECT: Devuelve filas que son comunes en hambas tablas.
--MINUS: Devuelve todas las filas de la primera consulta que no estan en la segunda consulta.


--2. Mencione los lineamientos que se deben de seguir para el uso de los operadores de conjunto.
--Las expresiones en las listas SELECT deben coincidir en numero y tipo de dato
--La clausula order by solo puede aparecer una vez al final de la declaracion.


--3. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select employee_id, job_id,department_id from employees union all 
Select employee_id, job_id,department_id from job_history order by employee_id;


--4. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select employee_id, job_id,department_id from employees 
INTERSECT
Select employee_id, job_id,department_id from job_history order by employee_id;


--5. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select location_id,department_name "Department",to_char(null) "Wharehouse location" from Departments 
union
Select location_id,to_char(null), state_province from Locations;


--6. Elabore una sentencia SELECT que muestre el Id del empleado, el Id del puesto y el salario, 
--incluir tanto los puestos actuales como los puestos históricos.
Select employee_id, job_id, salary from Employees union
Select employee_id, job_id, 0 from Job_History;


--7. Interprete el funcionamiento de la siguiente consulta:
Select employee_id, job_id, salary from Employees union
Select employee_id, job_id, 0 from Job_History order by 2;
--Obtiene el id del empleado, id del trabajo y el salario de todos los empleados incluyendo los trabajos en los que estuvieron,
--ordenando los resultados por la segunda columna


--8. Elaborar una sentencia SELECT que muestre las regiones que tienen países asignados.
Select region_id,to_char(null) ,country_name from Countries union
Select region_id,region_name,null pais from Regions;


--9. Elaborar una sentencia SELECT que muestre las regiones que no tienen países asignados.
Select region_id,region_name,null pais from Regions intersect
Select region_id,to_char(null),country_name from Countries;


--10. Elaborar una sentencia SELECT que muestre los empleados que no han generado histórico.
Select employee_id,job_id,department_id from Employees minus
Select employee_id,job_id,department_id from Job_History;


