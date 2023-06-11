--1
Select employee_id,to_char(hire_date,'mm/yy') month_hired from Employees where employee_id = 205;

--2
    --SCC
Select to_char(sysdate,'scc') Siglo from dual;
    --SYYYY
Select to_char(hire_date,'syyyy') Año from Employees where employee_id = 125;
    --YYY
Select to_char(sysdate,'yyy') Año from dual;
    --IYYY
Select to_char(to_date('15/11/2223'),'iyyy') Año from Employees where employee_id = 111;
    --SYEAR
Select to_char(sysdate,'syear') Año from dual;
    --BC, AD
Select to_char(hire_date,'fmdd-month-yyyy bc') "BC-AD" from Employees where employee_id = 125;
    --B.C., A.D.
Select to_char(sysdate,'fmdd-month-yyyy b.c.') "B.C-A.D" from Dual;
    --Q
Select to_char(hire_date,'q') "CUARTO DE AÑO" from Employees where employee_id = 123;
    --MM
Select to_char(sysdate,'mm') "MM" from Dual;
    --MONTH
Select to_char(sysdate,'month') "MONTH" from Dual;
    --MON
Select to_char(sysdate,'mon') "MON" from Dual;
    --RM
Select to_char(sysdate,'RM') "RM" from Dual;
    --WW
Select to_char(sysdate,'WW') "WW" from Dual;
    --DDD
Select to_char(hire_date,'DDD') "DDD" from Employees where employee_id = 154;
    --DAY
Select to_char(sysdate,'DAY') "DAY" from Dual;
    --DY
Select to_char(sysdate,'DY') "DY" from Dual;
    --J
Select to_char(hire_date,'J') "J" from Employees where employee_id = 132;
    --IW
Select to_char(sysdate,'ID') "ID" from Dual;

--3
Select last_name, to_char(hire_date,'fmddspth "of" Month yyyy HH:MI:SS AM') hiredate from Employees;

--4. ¿En qué consiste el modificador fm?, Elabore un ejemplo.
--Elimina espacios en blanco y tambien elimina los ceros iniciales a la izquierda
Select to_char(sysdate,'fmDay-Month-yyyy') from Dual;

--5. ¿En qué consiste el modificador fx?, Elabore un ejemplo.
--Espesifica la coincidencia exacta para el argumento del caracter, tambien espesifica el modelo de formato de una funcion to_date
Select to_number('$1,234,567.89','$999,999,999.00') "FX" from Dual;

--6. Explique el resultado de la siguiente consulta:
--Select last_name, hire_date from Employees where hire_date = to_date('Jun 25, 2005','Month DD, YYYY');
--Consulta el apellido y la fecha de contratacion del empleado con la fecha de contrtacion igual a la conversion 
--de la cadena al formato de fecha espesificado.

--7
Select to_char(sysdate,'fm"Hoy es: "Day DD" de "Month" de "yyyy" y son las: "hh:mm:ss am') "Hora actual" from dual;

--8
Select to_char(next_day(add_months(hire_date,6),5),'fm Day, Month ddth, yyyy') from Employees order by hire_date;

--9
--NVL: Convierte un valor nulo al valor del tipo de dato que tenga.
Select nvl(null,20000) from dual;
--NVL2: Evalua si la primera expresion no es nula regresa la segunda expresion, si es nula devuelve la tercera.
Select nvl2(1,2,3) from dual;
Select nvl2(null,2,3) from dual;
--NULLIF: Evalua dos expresiones, si son iguales regresa un null, de lo contrario regresa la primera expresion.
Select nullif(123,123) from dual;
--COALESCE: Regresa la primera expresion que no devuelve null, si todos son null retorna null.
Select coalesce(null,null,null,null,null,null,7,8,9) from dual;

--10
Select last_name, salary, commission_pct, nvl2(commission_pct,salary+((salary/100)*(commission_pct*100)),salary+2000) "New Salary" from Employees;

--11
Select last_name, salary, 
    decode (trunc(salary/2000,0),
            0, 0.00,
            1, 0.09,
            2, 0.20,
            3, 0.30,
            4, 0.40,
            5, 0.42,
            6, 0.44,
            0.45) tax_rate
from Employees;

--12
Select last_name, salary,
    decode(trunc(salary/5000,0),
        0, 'SALARIO BAJO',
        1, 'SALARIO MEDIO',
        'SALARIO ALTO') salario
from Employees;




