/* H1. Display employee_id, first_name, last_name, salary, and a column salary_rank_label that is 'High' if salary >= 10000, 'Medium' if salary >= 5000 and < 10000, else 'Low'. Use CASE.
Hint: CASE WHEN salary >= 10000 THEN 'High' WHEN salary >= 5000 THEN 'Medium' ELSE 'Low' END. */

SELECT  employee_id, first_name, last_name, salary,  (CASE WHEN salary >= 10000 THEN 'High' WHEN salary >= 5000 THEN 'Medium' ELSE 'Low' END) AS salary_rank_label FROM HR.EMPLOYEES;


/* H2. List  employee_id, salary, commission_pct, and total_comp as salary + (salary * NVL(commission_pct, 0)), formatted to 2 decimal places using ROUND(..., 2).
Hint: ROUND(salary * (1 + NVL(commission_pct,0)), 2) AS total_comp. */


SELECT employee_id, salary, commission_pct, ROUND(salary * (1 + NVL(commission_pct,0)), 2) AS total_comp FROM HR.EMPLOYEES;

/* H3. From hr.employees, show employee_id, email, and email_upper as UPPER(email). Also show email_length as LENGTH(email).
Hint: Use UPPER(email) and LENGTH(email) with aliases.

 */


SELECT employee_id, email, UPPER(email) AS  email_upper, LENGTH(email) AS email_length FROM hr.employees;

/* H4. Display department_id from hr.departments, department_name, and a column name_length (number of characters in department_name).
Hint: LENGTH(department_name) AS name_length. */

SELECT department_id,department_name,LENGTH(department_name) AS name_length FROM hr.departments;
/* 
H5. List employee_id, first_name, last_name, and a column reverse_name as last_name concatenated with first_name (no comma).
Hint: last_name || first_name AS reverse_name (add space if you want).

 */
SELECT employee_id, first_name, last_name,last_name || first_name AS reverse_name FROM HR.EMPLOYEES;

/* H6. Show employee_id, hire_date, and a literal column data_source with value 'HR.EMPLOYEES'.
Hint: 'HR.EMPLOYEES' AS data_source */

SELECT employee_id, hire_date,'HR.EMPLOYEES' AS data_source FROM HR.EMPLOYEES;


/* H7. From hr.employees, display job_id, salary, and salary_percentage as (salary / (SELECT SUM(salary) FROM hr.employees)) * 100, rounded to 2 decimals.
Hint: Scalar subquery in SELECT: ROUND(salary * 100.0 / (SELECT SUM(salary) FROM hr.employees), 2). */

SELECT job_id, salary,   ROUND(((salary / (SELECT SUM(salary) FROM hr.employees)) * 100),2) AS salary_percentage FROM HR.employees;


/* H8. List employee_id, first_name, last_name, and a column formal_name as "Mr. " or "Ms. " (your choice) concatenated with first_name and last_name.
Hint: 'Mr. ' || first_name || ' ' || last_name AS formal_name.

 */

 SELECT  employee_id, first_name, last_name,'Mr. ' || first_name || ' ' || last_name AS formal_name FROM HR.EMPLOYEES;
 
/* H9. Display employee_id, salary, and annual_with_raise as (salary * 12) * 1.05 (5% annual raise).
Hint: salary * 12 * 1.05 AS annual_with_raise. */

SELECT employee_id, salary, salary * 12 * 1.05 AS annual_with_raise FROM HR.EMPLOYEES;



/* H10. From hr.departments, show department_id, department_name, and a column id_name that concatenates department_id and department_name with a hyphen (e.g., "10-Administration"). Use TO_CHAR(department_id) for the number.
Hint: TO_CHAR(department_id) || '-' || department_name AS id_name. */
SELECT department_id, department_name, TO_CHAR(department_id) || '-' || department_name AS id_name FROM HR.DEPARTMENTS; 