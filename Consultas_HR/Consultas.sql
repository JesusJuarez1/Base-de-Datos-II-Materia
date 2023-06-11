--1. Consultar el nombre de la región, el nombre del país y en caso de que un país tenga localidades, 
--mostrar también los datos generales de las localidades.
Select r.region_name, c.country_name, l.street_address, l.postal_code, l.city, l.state_province from Regions r left outer join Countries c
on (r.region_id=c.region_id) left outer join Locations l on (c.country_id=l.country_id);


--2. Consultar el nombre completo de los empleados que no han generados ningún histórico.
Select first_name||' '||last_name "Nombre Completo" from Employees where employee_id not in (Select employee_id from Job_History);


--3. Consultar el nombre de los departamentos y el total de empleados que tiene cada uno de ellos, 
--pero sólo mostrar aquellos departamentos que tengan más de 10 empleados.
Select d.department_name, count(e.employee_id) Num_Emp from Departments d join Employees e on (d.department_id=e.department_id) 
group by department_name having count(e.employee_id) > 10;


--4. Consultar los datos generales de los históricos (mostrar los datos generales de las tablas que se relacionan con la tabla de JOB_HISTORY).
Select jh.employee_id,e.first_name,e.last_name,jh.start_date,jh.end_date,jh.job_id,j.job_title,jh.department_id,d.department_name from Job_History jh
left outer join Employees e on (jh.employee_id=e.employee_id) left outer join Jobs j on (jh.job_id=j.job_id) 
left outer join Departments d on (jh.department_id=d.department_id);


--5. Consultar los nombres de los puestos (job_title) y total de empleados (que no ganen entre 5000 y 8000 y que tengan comisión asignada)
--que tiene cada uno de ellos, pero sólo mostrar aquellos puestos que tengan más de 1 empleado.
Select job_title,cont_emp from Jobs join 
(Select job_id,count(*)cont_emp from Employees 
where salary<=5000 and salary>=8000 and commission_pct is not null 
group by job_id having count(*)>1) using(job_id);   --No hay empleados que cumplan con las condiciones


--6. Consultar el nombre del empleado que más veces ha cambiado de departamento.
Select first_name||' '||last_name nombre from Employees e join 
(Select employee_id,count(distinct department_id) num_veces from Job_History group by employee_id) m on 
(e.employee_id=m.employee_id) and num_veces = (Select max(count(distinct department_id)) num_veces from Job_History group by employee_id);


--7. Consultar el nombre del empleado que más veces ha cambiado de puesto.
Select first_name||' '||last_name nombre from Employees e join 
(Select employee_id,count(distinct job_id) num_veces from Job_History group by employee_id) m on 
(e.employee_id=m.employee_id) and num_veces = (Select max(count(distinct job_id)) num_veces from Job_History group by employee_id);


--8. Consultar el nombre de la región que tenga más empleados.
Select region_name from Regions where region_id = 
(Select region_id from Countries where country_id = 
(Select country_id from Locations where location_id = (Select d.location_id from Departments d join 
(Select department_id, count(*) num from Employees where department_id is not null group by department_id) e 
on (d.department_id=e.department_id) and 
e.num = (Select max(count(*)) num from Employees where department_id is not null group by department_id))));


--9. Consultar el nombre de los países que su total de localidades se encuentre por arriba del promedio de localidades por país.
Select country_name from Countries c join (Select country_id,count(*) num from Locations group by country_id) l on (c.country_id=l.country_id) 
where l.num > (Select avg(count(country_id)) from Locations group by country_id);


--10. Consultar el puesto que más empleados tenga.
Select job_title from Jobs j join (Select job_id, count(*) num from Employees group by job_id) e on (j.job_id=e.job_id)
where e.num = (Select max(count(*)) num from Employees group by job_id);


--11. Consultar el nombre de todos los empleados registrados en la base de datos y si están asignados a algún departamento,
-- mostrar también el nombre del departamento, en caso contrario mostrar la leyenda “no tiene departamento”.
Select e.last_name, nvl2(e.department_id,d.department_name,'No tiene departamento') Departamento from Employees e
left outer join Departments d on (e.department_id=d.department_id);


--12. Consultar el nombre de la región y el total de países que tiene cada una de ellas, pero sólo mostrar cuyo total de países se encuentre por debajo de la media.
Select r.region_name, c.num_paises from Regions r join (Select region_id, count(*) from Countries group by region_id) c
on (r.region_id=c.region_id) where c.num_paises < (Select avg(count(*)) from Countries group by region_id);


--13. Consultar los datos generales de los empleados que han cambiado de puesto pero no de departamento.
Select e.employee_id,e.last_name,e.salary,e.department_id,e.job_id from Employees e join Job_History jh 
on (e.employee_id=jh.employee_id and e.department_id=jh.department_id and e.job_id != jh.job_id);


--14. Consultar los datos generales de los empleados que han cambiado de departamento pero no de puesto.
Select e.employee_id,e.last_name,e.salary,e.department_id,e.job_id from Employees e join Job_History jh 
on (e.employee_id = jh.employee_id and e.job_id = jh.job_id and e.department_id != jh.department_id);


--15. Consultar el nombre del empleado que más ha cambiado tanto de puesto como de departamento.
Select first_name||' '||last_name "Nombre" from Employees e join
(Select employee_id,count(distinct job_id) num_pues,count(distinct department_id) num_dep from Job_History group by employee_id) jh 
on (e.employee_id=jh.employee_id) join 
(Select max(count(distinct job_id)) num_pues, max(count(distinct department_id)) num_dep from Job_History group by employee_id)m 
on (jh.num_pues=m.num_pues and jh.num_dep=m.num_dep);


--16. Consultar el nombre de los empleados, el porcentaje de comisión y una leyenda que indique “Si tiene comisión” 
--o “No tiene comisión”
Select first_name||' '||last_name nombre,(nvl2(commission_pct,commission_pct*100,'0')||'%') comision,
nvl2(commission_pct,'Si tiene comision','No tiene comision') Tiene_Comision from Employees;


--17. Consultar el nombre de los empleados, su salario y una leyenda que indique:
    --“Salario Alto” si gana más de 10,000.00
    --“Salario Regular” si gana entre 5,000.00 y 10,000.00
    --“Salario Bajo” si gana menos de 5,000.00
Select first_name||' '||last_name Nombre, salary,
    decode(trunc(salary/5000,0),
        0, 'SALARIO BAJO',
        1, 'SALARIO REGULAR',
        'SALARIO ALTO') salario
from Employees;


--18. Consultar el nombre de los países en lo que no haya empleados trabajando.
Select country_name from Countries where country_id not in
(Select distinct country_id from Locations where location_id in 
(Select distinct location_id from Departments where department_id in 
(Select department_id from Departments intersect Select department_id from Employees)));


--19. Consultar el nombre del departamento más popular (Departamento que más empleados tenga).
Select d.department_name from Departments d join 
(Select department_id,count(*) num from Employees  where department_id is not null group by department_id) e on (d.department_id=e.department_id)
where e.num = (Select max(count(*)) from Employees  where department_id is not null group by department_id);


--20. Consultar el nombre del departamento, el total de empleados que tiene cada uno de ellos y una leyenda que indique:
    --“Departamento muy Poblado” si tiene más de 20 empleados
    --“Departamento Poblado” si tiene entre 10 y 20 empleados
    --“Departamento Solitario” si tiene menos de 10 empleados
Select d.department_id, nvl(e.num_empleados,0) num_emp, 
    decode(trunc(nvl(e.num_empleados,0)/10,0),
    0, 'Departamento Solitario',
    1, 'Departamento poblado',
       'Departamento Muy Poblado') departamento
from Departments d left outer join (Select department_id,count(*) num_empleados from Employees  where department_id is not null group by department_id) e
on (d.department_id=e.department_id);