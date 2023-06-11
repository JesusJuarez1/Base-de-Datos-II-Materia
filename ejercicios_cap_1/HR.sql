--1. Explique las capacidades de la sentencia SELECT.
--La sentencia Select nos permite consultar los datos de una tabla de una base de datos y tiene una gran variedad de opciones con las cuales
--podremos consultar la informacion que realmente necesitamos.

--2. ¿Cuál es la sintaxis básica de la sentencia SELECT?
--La sentencia basica es: Select [columna/s] from [tabla/s] where [condicion/es];
--Select: selecciona
--[columna/s]: selecciona las columnas deseadas (todas = *)
--from: de donde las va a consultar
--[tabla/s] nombres de las tablas que se quieren consultar
--where: Condicionar el resultado
--[condicion/es]: condiciones con las que se obtiene solo los datos que lo cumplen

--3. Escriba una sentencia SELECT que calcule el salario diario de un empleado.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,TO_CHAR(SALARY/15,'999,999.99') SALARIO_DIARIO FROM EMPLOYEES WHERE EMPLOYEE_ID = 108;

--4. Escriba una sentencia SELECT para incrementar el salario diario de un empleado 5 pesos.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,TO_CHAR(SALARY+5) SALARIO FROM EMPLOYEES WHERE EMPLOYEE_ID = 108;

--5. Tomando en consideración que la comisión de un empleado es parte de su salario, escriba una sentencia que calcule
--su salario quincenal total (incluya su porcentaje de comisión).
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,TO_CHAR((SALARY)+((SALARY*(COMMISSION_PCT))/100)) SALARIO_MAS_COMSISION 
    FROM EMPLOYEES WHERE EMPLOYEE_ID = 145;
    
--6. ¿Cuáles son las 3 formas de representar un alias a una columna?, explicar las diferencias.
--Colocar la palabra reservada "as" despues de la columna a la que se le quiere poner un alias y luego colocar el nombre del alias
--Colocar solo el nombre despues de la columna sin la palabra reservada "as"
--Colocar el nombre del alias entre comillas cuando se quere un nombre que contenga espacios

--7. Escriba una sentencia SELECT que imprima su resultado en el siguiente formato: 
--Juan Pérez tiene un salario de 3000, trabaja en el departamento 30 y su puesto es SA_REP.
SELECT FIRST_NAME||' '||LAST_NAME||' TIENE UN SALARIO DE '||SALARY||', TRABAJA EN EL DEPARTAMENTO '
    ||DEPARTMENT_ID||' Y SU PUESTO ES '||JOB_ID SALIDA FROM EMPLOYEES WHERE EMPLOYEE_ID = 115;
    
--8. Escriba una sentencia SELECT que utilice el operador Q para que imprima su resultado en el siguiente formato:
--El departamento de VENTAS está ubicado en la localidad 2300 y su jefe tiene el identificador 130.
SELECT q'{EL DEPARTAMENTO DE '}'||DEPARTMENT_NAME||q'{' ESTÁ UBICADO EN LA LOCALIDAD '}'||LOCATION_ID||q'{' Y SU JEFE TIENE EL IDENTIFICADOR '}'
    ||MANAGER_ID SALIDA FROM DEPARTMENTS WHERE DEPARTMENT_ID = 60;

--9. Escriba una sentencia SELECT que imprima de forma única los identificadores de los puestos que están asignados a los empleados.
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

--10. Describa la estructura de las 7 tablas de la base de datos RH.
DESCRIBE RH.DEPARTAMENTOS_JMJP;
DESCRIBE RH.HISTORIA_LABORAL_JMJP;
DESCRIBE RH.PAISES_JMJP;
DESCRIBE RH.REGIONES_JMJP;
DESCRIBE RH.TRABAJADORES_JMJP;
DESCRIBE RH.TRABAJOS_JMJP;
DESCRIBE RH.UBICACIONES_JMJP;







