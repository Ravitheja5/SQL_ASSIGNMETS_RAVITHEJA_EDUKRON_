/* 1. **M1.** Display `employee_id`, `first_name`, `last_name`, and a new column `full_name` that is first_name and last_name concatenated with a comma between them (e.g., "John, Doe").  
   **Hint:** Use `first_name || ', ' || last_name` and alias it as `full_name`.
 */

SELECT employee_id,first_name || ',' || last_name AS full_name FROM HR.EMPLOYEES;

/* 2. **M2.** List `employee_id`, `salary`, and a column `bonus_10_pct` showing 10% of salary (salary * 0.10).  
   **Hint:** Use an arithmetic expression and alias. */

SELECT EMPLOYEE_ID , SALARY,SALARY*0.10 AS bonus_10_pct FROM HR.EMPLOYEES;
--m3:
ALTER TABLE employees
ADD record_type VARCHAR2(20);

UPDATE employees
SET record_type = 'Employee';

SELECT emp_id, hire_date, record_type
FROM employees;

/* M4. For each employee, display email and a column email_domain set to the literal '@company.com'.
Hint: Use a string literal with an alias; no concatenation required for this part.

 */

SELECT EMAIL, '@company.com' AS  email_domain FROM HR.EMPLOYEES;
/* M6. Display first_name, last_name, and a column initials formed by the first character of first_name and the first character of last_name (e.g., "JD").
Hint: Use SUBSTR(first_name, 1, 1) and SUBSTR(last_name, 1, 1) concatenated. */

SELECT  first_name, last_name, SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 1) AS  FROM HR.EMPLOYEES; 


/* M7. Show employee_id, salary, and annual_salary as salary * 12, and also annual_plus_bonus as salary * 12 * 1.1 (10% bonus).
Hint: Two calculated columns with aliases. */

SELECT employee_id,   salary, (salary * 12 ) AS annual_salary ,(salary * 12 * 1.1) AS annual_plus_bonus FROM HR.EMPLOYEES;


/* M8. List all columns from hr.departments using explicit column names (department_id, department_name, manager_id, location_id).
Hint: SELECT each column name from hr.departments; no *. */

SELECT department_id, department_name, manager_id, location_id FROM HR.DEPARTMENTS;


/* M9. From hr.employees, select employee_id and a column description that is the literal 'Emp#' concatenated with employee_id (cast to string if needed: use TO_CHAR(employee_id)).
Hint: 'Emp#' || TO_CHAR(employee_id) AS description. */

SELECT employee_id ,  'Emp#' || TO_CHAR(employee_id) AS description FROM hr.employees;

/* M10. Display job_id, salary, and a column salary_band that is the literal 'Standard' for every row.
Hint: Add 'Standard' AS salary_band in SELECT.

 */

SELECT job_id, salary,'Standard' AS salary_band FROM hr.employees;
