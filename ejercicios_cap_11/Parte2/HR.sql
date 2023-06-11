--1. Explique en qué consiste una vista.
--Representa subconjuntos de dato de una o varias tablas.


--2. Mencione las ventajas de las vistas.
--Sirven para restringir el acceso a los datos.
--Facilitan las consultas complejas.
--Proporciona independencia de los datos.
--Poder presentar diferentes vistas de los mismos datos.


--3. Mencione las características de una vista simple y de una vista compleja.
--Las vistas simples solo permiten una tabla, no puede contener funciones, no contiene grupos de datos y puede contener operaciones DML.
--Las vistas complejas permiten una o varias tablas, puede contener funciones, puede contener grupos de datos y no siempre puede contener operaciones DML.


--4. Explique el funcionamiento de la siguiente vista:
Create view dept_sal as
Select d.department_name, sum(e.salary) sal from Departments d left outer join Employees e on d.department_id=e.department_id
group by department_name order by department_name;
--Crea una vista la cual tomara los nombres de departamento y la suma de los salarios de los empleados para
--cada departamento ordenando los datos por nombre de departamento


--5. Elabore una sentencia SELECT para crear una Vista que muestre el Nombre del Puesto, 
--la suma de los salarios asignados a ese puesto, el salario más alto y el salario más bajo
--que se haya asignado a un empleado en ese puesto.
Create view job_sal as
Select j.job_title, sum(e.salary) suma,max(e.salary) maximo,min(e.salary) minimo from Jobs j left outer join Employees e on
j.job_id=e.job_id group by job_title;
Select * from job_sal;


--6. Mencione las reglas para poder ejecutar sentencias DML a través de una vista, para:
--a) insertar datos.
--b) modificar datos.
--c) eliminar datos.
--No debe contener:
    --Funciones de grupo
    --La clausula GROUP BY
    --La palabra clave DISTINCT
    --La palabra clave de pseudocolumna ROWNUM
    --Columnas definidas por extencion
    --Columnas NOT NULL en las tablas base que no están seleccionadas por la vista


--7. Elabore una vista que muestre el siguiente resultado:
Create view Dept_Sal_Staff as
Select d.department_id, count(e.salary) staff, sum(e.salary) salaries, d.department_name
from Departments d join Employees e on (d.department_id=e.department_id) group by d.department_id,d.department_name;
Select * from Dept_Sal_Staff;


--8. Elabore una vista que muestre un listado de los empleados que ganen mas de $10,000.00.
--A través de la vista tratar de registrar un empleado que gane $8,000.00.
--Alterar la vista para agregar la opción WITH CHECK OPTION. Nuevamente, a través de la vista tratar de registrar un empleado
--que gane $8,000.00. Explicar el comportamiento de todo el ejercicio.

--Se crea la vista
Create view Emp_Sal as
Select * from Employees where salary > 10000;
Select * from Emp_Sal;

--Se inserta el dato y se consulta la vista
Insert into Emp_Sal values(207,null,'Perez','aefgag',null,to_date('10/09/07','dd/mm/yy'),'AD_PRES',8000,null,null,null);
Select * from Emp_Sal;--No aparece el dato insertado debido a que no cumple con la condicion en la vista

--Modifica la vista agregando la opcion WITH CHECK OPTION
Create or replace view Emp_Sal as
Select * from Employees where salary > 10000
with check option constraint Emp_Sal_con;
--Se trata de insertar otro dato, Sale un error debido a la opcion agregada a la vista
Insert into Emp_Sal values(208,null,'Perez','aefgag',null,to_date('10/09/07','dd/mm/yy'),'AD_PRES',8000,null,null,null);


--9. Elabore una vista de solo lectura. Trate de agregar un registro a través de la vista. Explique el comportamiento.
create view Job_Vie as
Select * from Jobs where max_salary > 10000
with read only;
select * from Job_Wie;
Insert into Job_Vie values('NEW_JOB','NUEVO TRABAJO',10001,8000);
--Como la vista se crea con la opcion de solo lectura, esta no permite insertar, modificar o eliminar los datos


--10. Elabore una sentencia para borrar una de las vistas anteriormente creadas.
Drop view Job_Vie;