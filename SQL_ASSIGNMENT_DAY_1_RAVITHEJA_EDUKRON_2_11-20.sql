
--M11. List employee_id, first_name, last_name, and a column display_name as "Last, First" (last_name, comma space, first_name).
--Hint: last_name || ', ' || first_name AS display_name.

SELECT employee_id, first_name, last_name, last_name || ', ' || first_name AS display_name FROM HR.EMPLOYEES;

/* M12. Show department_id from hr.departments and a literal 1 as column sort_order.
Hint: SELECT department_id, 1 AS sort_order FROM hr.departments. */

SELECT department_id, 1 AS sort_order FROM hr.departments;


/* M13. From hr.employees, display salary and monthly_net as salary * 0.85 (assuming 15% tax).
Hint: salary * 0.85 AS monthly_net. */

SELECT salary,(salary * 0.85) As monthly_net from hr.employees;

/* M14. List employee_id, commission_pct, and commission_display where NULL commission_pct is shown as 0 using NVL.
Hint: NVL(commission_pct, 0) AS commission_display.

 */

SELECT employee_id, commission_pct, NVL(commission_pct, 0) AS commission_display FROM HR.EMPLOYEES;



/* M15. Display first_name, last_name, salary, and a column compensation that is salary * (1 + NVL(commission_pct, 0)).
Hint: Total comp = salary + salarycommission_pct; factor as salary(1 + NVL(commission_pct,0)).
 
 */

SELECT first_name, last_name, SALARY,(salary + commission_pct) AS compensation FROM HR.EMPLOYEES;


/* M16. From hr.departments, list department_name and a literal column region with value 'HQ'.
Hint: SELECT department_name, 'HQ' AS region FROM hr.departments.V */
 SELECT department_name, 'HQ' AS region FROM hr.departments;


 /* M17. Show employee_id, hire_date, and a column years_label with literal 'Years of service'.
Hint: Add a string literal with alias years_label. */

SELECT employee_id, hire_date,'Years of service' AS  years_label from hr.employees;


/* M18. List employee_id, salary, and double_salary as salary * 2.
Hint: Simple arithmetic expression with alias. */
SELECT employee_id, salary,salary * 2 AS double_salarY FROM HR.EMPLOYEES;





/* M19. From hr.employees, display manager_id and a column has_manager that is the literal 'Yes' when manager_id is not null and 'No' when manager_id is null (use NVL2: NVL2(manager_id, 'Yes', 'No')).
Hint: NVL2(manager_id, 'Yes', 'No') AS has_manager. */

SELECT manager_id ,(NVL2(manager_id, 'Yes', 'No')) AS has_manager FROM HR.EMPLOYEES;

/* M20. Show department_id, department_name from hr.departments, and a calculated column dept_code as the first 3 characters of department_name (use SUBSTR).
Hint: SUBSTR(department_name, 1, 3) AS dept_code. */

SELECT department_id, department_name,SUBSTR(department_name, 1, 3) AS dept_code from hr.departments;

