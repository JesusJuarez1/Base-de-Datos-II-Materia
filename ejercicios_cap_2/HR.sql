--1. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que laboran en el puesto ‘SA_REP’.
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'SA_REP';

--2. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que fueron contratados el 24 de marzo de 2005.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '19/03/05';

--3. ¿Cuál es el formato de fecha por default?
SELECT SYSDATE FROM DUAL;

--4. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que fueron contratados antes del 19 de enero del 2004.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE < '19/01/04';

--5. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que ganan entre 3000 y 10000.
SELECT * FROM EMPLOYEES WHERE SALARY >= 3000 AND SALARY <= 10000;

--6. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que ganan 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000 y 10000.
SELECT * FROM EMPLOYEES WHERE SALARY = 1000 OR SALARY = 2000 OR SALARY = 3000 OR SALARY = 4000 OR SALARY = 5000 
    OR SALARY = 6000 OR SALARY = 7000 OR SALARY = 8000 OR SALARY = 9000 OR SALARY = 10000;

--7. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo nombre contenga la letra ‘a’.
SELECT * FROM EMPLOYEES WHERE (SELECT INSTR(FIRST_NAME,'A',1) FROM DUAL D) <> 0 OR (SELECT INSTR(FIRST_NAME,'a',1) FROM DUAL D) <> 0;

--8. Elaborar una sentencia SELECT que muestre los datos generales de los puestos cuyo ID contenga un guion bajo ( _ ). Ingresar un nuevo puesto que no contenga guion bajo en su Id para comprobar.
SELECT * FROM JOBS WHERE (SELECT INSTR(JOB_ID,'_',1) FROM DUAL) <> 0;

--9. Elaborar una sentencia SELECT que muestre los datos generales de los empleados que tiene una comisión asignada.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

--10. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo nombre no contenga la letra ‘a’ y que ganen más de 7500.
SELECT * FROM EMPLOYEES WHERE ((SELECT INSTR(FIRST_NAME,'A',1) FROM DUAL D) = 0 AND (SELECT INSTR(FIRST_NAME,'a',1) FROM DUAL D) = 0) AND SALARY > 7500;

--11. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo puesto sea SA_REP y que ganen más de 12000 o cuyo puesto sea AD_PRES.
SELECT * FROM EMPLOYEES WHERE (JOB_ID = 'SA_REP' AND SALARY > 12000) OR JOB_ID = 'AD_PRES';

--12. Elaborar una sentencia SELECT que muestre los datos generales de los empleados ordenados por apellido de forma ascendente y por nombre de forma descendente.
SELECT * FROM EMPLOYEES ORDER BY LAST_NAME ASC,FIRST_NAME DESC;

--13. Elaborar una sentencia SELECT que muestre los datos generales de los empleados cuyo apellido contenga la letra ‘a’.
SELECT * FROM EMPLOYEES WHERE (SELECT INSTR(LAST_NAME,'A',1) FROM DUAL D) <> 0 OR (SELECT INSTR(LAST_NAME,'a',1) FROM DUAL D) <> 0;

--14. Elaborar una sentencia SELECT que muestre los datos generales de los empleados utilizando variables de sustitución y la reutilización de al menos una de ellas.
SELECT 'EL EMPLEADO CONTIENE EN SU NOMBRE '||'&&NOMBRE_CONTIENE' AS SALIDA,FIRST_NAME,LAST_NAME FROM EMPLOYEES 
WHERE (SELECT INSTR(LOWER(FIRST_NAME),LOWER('&NOMBRE_CONTIENE'),1) FROM DUAL) <> 0;
    

--15. Elaborar una sentencia SELECT que muestre los datos generales de los empleados utilizando el comando DEFINE.
DEFINE SAL = 12345.67;
SELECT * FROM EMPLOYEES WHERE SALARY > &SAL;