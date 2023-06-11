--1. Mencione los diferentes tipos de uniones que maneja Oracle.
    --Natural joins, Outer joins y Cross join.


--2. Mencione las características de un NATURAL JOIN.
    --Selecciona filas de las dos tablas que tienen valores iguales en todas las columnas coincidentes.
    --Si las columnas que tienen los mismos nombres tienen diferentes tipos de datos, se devuelve un error.


--3. Explique las diferencias entre un NATURAL JOIN y un JOIN USING.
    --Se usa el natural join cuando se quiere juntar dos tablas con culumnas con el mismo nombre y el mismo tipo de dato,
    --en cambio se usa el using para espesificar las columnas para la conbinacion.


--4. Explique el funcionamiento de cada una de las siguientes consultas:
Select * from locations natural join countries;
    --Consuta todas las columnas de la tabla locations, ademas de consultar las columnas de la tabla countries 
    --con los valores que coinciden entre las dos tablas.
Select * from locations, countries where locations.country_id = countries.country_id;
    --Hace un natural join rudimentario con la diferencia que incluye la columna country_id 2 veces.
Select * from jobs natural join countries;
    --Para cada registro unico de la tabla jobs conslta cada registro de la tabla countries ya que no existe una columna que compartan.
Select * from jobs, countries;
    --Hace lo mismo que la consulta anterior.
    

--5. Explique el funcionamiento de cada una de las siguientes consultas:
Select * from locations join countries using (country_id);
    --Hace una consulta donde extraiga los registros de cada tabla donde la columna country_id coincidan.
Select * from locations, countries where locations.country_id = countries.country_id;
    --Hace lo mismo que la consulta anterior pero comparando las columnas country_id de cada tabla, 
    --ademas de incluir la columna country_id 2 veces.
Select * from jobs join countries using ;
    --Da un error debido a que no espesifica las columnas que se tienen que comparar para obtener un resultado
    

--6. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select e.employee_id, e.last_name, jh.start_date, e.hire_date, jh.end_date, jh.job_id as Previous_Job, e.job_id as Current_Job 
from Employees e join Job_History jh on e.employee_id = jh.employee_id;


--7. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select e.first_name||' '||e.last_name||' is manager of the '||d.department_name||' department.' as "Managers" 
from Employees e join Departments d on e.employee_id = d.manager_id;


--8. Explique el funcionamiento de cada una de las siguientes consultas:
Select d.department_name from Departments d join Locations l on (l.location_id = d.location_id)
where d.department_name like 'P%';
    --Consulta los nombres de los departamentos cuyo nombre comience con "P" ademas de que tengan una valor para location_id valido.
Select d.department_name from Departments d join Locations l on (l.location_id = d.location_id and d.department_name like 'P%');
    --Hace lo mismo que la consulta anterior solo que la condicion la mete dentro del on.
    

--9. Elabore las sentencias necesarias para crear la tabla e insertar los datos de lo siguiente:
create table Job_Grades(
    grade_level char(1) constraint job_grades_pk primary key,
    lowest_sal number,
    highest_sal number
);
insert into Job_Grades values('A',1000,2999);
insert into Job_Grades values('B',3000,5999);
insert into Job_Grades values('C',6000,9999);
insert into Job_Grades values('D',10000,14999);
insert into Job_Grades values('E',15000,24999);
insert into Job_Grades values('F',25000,40000);


--10. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select e.last_name,e.salary,g.grade_level from Employees e join Job_Grades g on (e.salary >= g.lowest_sal and e.salary <= g.highest_sal);


--11. Explique el funcionamiento de cada una de las siguientes consultas:
Select e.employee_id, e.department_id EMP_DEPT_ID, d.department_id DEPT_EMP_ID, d.department_name
from departments d left outer join Employees e on (d.department_id=e.department_id) where d.department_name like 'P%';
    --Escoge las columnas de cada tabla que quiere consultar, los datos de la tabla Departments consulta todos sus datos aunque 
    --no haya coincidencias con la tabla Employees, y estos datos los empareja con valores nulos.
Select e.employee_id, e.department_id EMP_DEPT_ID, d.department_id DEPT_EMP_ID, d.department_name
from departments d join Employees e on (d.department_id=e.department_id) where d.department_name like 'P%';
    --Consulta los registros de las columnas escogidas que tengan como coincidencia el id del departamento, 
    --si no tienen coincidencias no muestra esos registros.


--12. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select distinct jh.job_id jobs_in_job_history, e.job_id jobs_in_employees 
from Job_History jh right outer join Employees e on(jh.job_id = e.job_id);


--13. Elabore una sentencia SELECT que muestre el siguiente resultado:
Select e.last_name, d.department_name from Employees e 
full outer join Departments d on (e.department_id=d.department_id) order by d.department_id desc;


--14. Explique el funcionamiento de la siguiente consulta:
Select r.region_name, c.country_name from Regions r cross join Countries c;


--15. Elabore una Sentencia SELECT que muestre todos los empleados que hay registrados en la tabla, 
--y en de que tengan un departamento asignado, mostrar el nombre de dicho departamento.
Select e.first_name,e.last_name,e.department_id,d.department_name from Employees e join Departments d on (e.department_id = d.department_id);

